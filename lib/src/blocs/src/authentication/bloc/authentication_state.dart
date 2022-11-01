part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState({
    this.authenticated = false,
    this.isSignedInAnonymous = false,
    this.token = '',
    this.user,
    this.checker = false,
    this.hasWalkedThrough = false,
  });

  final bool authenticated;
  final bool isSignedInAnonymous;
  final String token;
  final User? user;
  final bool checker;
  final bool hasWalkedThrough;

  AuthenticationState copyWith({
    bool? authenticated,
    bool? isSignedInAnonymous,
    String? token,
    User? user,
    bool? checker,
    bool? hasWalkedThrough,
  }) {
    return AuthenticationState(
      authenticated: authenticated ?? this.authenticated,
      isSignedInAnonymous: isSignedInAnonymous ?? this.isSignedInAnonymous,
      token: token ?? this.token,
      user: user ?? this.user,
      checker: checker ?? this.checker,
      hasWalkedThrough: hasWalkedThrough ?? this.hasWalkedThrough,
    );
  }

  @override
  List<Object> get props =>
      [authenticated, token, isSignedInAnonymous, checker, hasWalkedThrough];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'authenticated': authenticated,
      'isSignedInAnonymous': isSignedInAnonymous,
      'token': token,
      'user': user?.toMap(),
      'checker': checker,
      'hasWalkedThrough': hasWalkedThrough,
    };
  }

  factory AuthenticationState.fromMap(Map<String, dynamic> map) {
    return AuthenticationState(
      authenticated: map['authenticated'] as bool,
      isSignedInAnonymous: map['isSignedInAnonymous'] as bool,
      token: map['token'] as String,
      user: map['user'] != null
          ? User.fromMap(map['user'] as Map<String, dynamic>)
          : null,
      checker: map['checker'] as bool,
      hasWalkedThrough: map['hasWalkedThrough'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthenticationState.fromJson(String source) =>
      AuthenticationState.fromMap(json.decode(source) as Map<String, dynamic>);
}
