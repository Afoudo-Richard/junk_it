import 'dart:convert';

// import 'package:authentication_repository/authentication_repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:your_waste/src/data/data.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends HydratedBloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState()) {
    on<AuthenticationChanged>(_onAuthenticationChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    on<AuthenticationChecker>(_onAuthenticationChecker);
    on<AuthenticationHasWalkedThroughChanged>(
        _onAuthenticationHasWalkedThroughChanged);
    on<AuthenticationSignInAnonymous>(_onAuthenticationSignInAnonymous);
  }

  void _onAuthenticationHasWalkedThroughChanged(
    AuthenticationHasWalkedThroughChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    return emit(
      state.copyWith(
        hasWalkedThrough: event.hasWalkedThrough,
      ),
    );
  }

  void _onAuthenticationSignInAnonymous(
    AuthenticationSignInAnonymous event,
    Emitter<AuthenticationState> emit,
  ) async {
    return emit(
      state.copyWith(
        isSignedInAnonymous: true,
        user: User(
            id: -1,
            first_name: "Anonymous",
            last_name: "Anonymous",
            name: "Anonymous"),
      ),
    );
  }

  void _onAuthenticationChanged(
    AuthenticationChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    return event.authenticated
        ? emit(
            state.copyWith(
              authenticated: event.authenticated,
              user: event.user,
              token: event.token,
            ),
          )
        : emit(
            state.copyWith(
              authenticated: event.authenticated,
              user: null,
              token: '',
            ),
          );
  }

  void _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    emit(state.copyWith(
      authenticated: false,
      user: null,
      token: null,
      isSignedInAnonymous: false,
    ));
  }

  void _onAuthenticationChecker(
    AuthenticationChecker event,
    Emitter<AuthenticationState> emit,
  ) {
    emit(
      state.copyWith(checker: event.check),
    );
  }

  @override
  AuthenticationState? fromJson(Map<String, dynamic> json) {
    return AuthenticationState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(AuthenticationState state) {
    return state.toMap();
  }
}
