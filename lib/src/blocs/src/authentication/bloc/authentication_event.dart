// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

// class AuthenticationStatusChanged extends AuthenticationEvent {
//   const AuthenticationStatusChanged(this.status);

//   final AuthenticationStatus status;

//   @override
//   List<Object> get props => [status];
// }

class AuthenticationLogoutRequested extends AuthenticationEvent {}

class AuthenticationChanged extends AuthenticationEvent {
  const AuthenticationChanged(
      {required this.authenticated, required this.token, this.user});

  final String token;
  final bool authenticated;
  final User? user;

  @override
  List<Object> get props => [authenticated, token];
}

class AuthenticationHasWalkedThroughChanged extends AuthenticationEvent {
  final bool hasWalkedThrough;
  const AuthenticationHasWalkedThroughChanged({
    required this.hasWalkedThrough,
  });

  @override
  List<Object> get props => [hasWalkedThrough];
}

class AuthenticationSignInAnonymous extends AuthenticationEvent {}

class AuthenticationChecker extends AuthenticationEvent {
  final bool check;
  const AuthenticationChecker({
    required this.check,
  });

  @override
  List<Object> get props => [check];
}
