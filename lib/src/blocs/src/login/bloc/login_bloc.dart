import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:your_waste/your_waste.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required this.junkItApi,
    required this.authenticationBloc,
  }) : super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<SubmitLoginInputsChecked>(_onSubmitLoginInputsChecked);
    on<LoginSubmitted>(_onSubmitted);
  }

  final JunkItApi junkItApi;
  final AuthenticationBloc authenticationBloc;

  void _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([state.password, email]),
    ));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = LoginPassword.dirty(event.password);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([password, state.email]),
    ));
  }

  void _onSubmitLoginInputsChecked(
    SubmitLoginInputsChecked event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(
      email: Email.dirty(state.email.value),
      password: LoginPassword.dirty(state.password.value),
    ));
  }

  void _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        final response = await junkItApi.login(
          email: state.email.value,
          password: state.password.value,
        );

        User user = await ParseUser.currentUser();

        authenticationBloc.add(
          AuthenticationChanged(
            authenticated: true,
            user: user,
          ),
        );

        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } on ErrorLoggingIn catch (e) {
        emit(state.copyWith(
            errorMessage: e.getErrorsAsString ?? e.message,
            status: FormzStatus.submissionFailure));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
