part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState({
    this.authenticated = false,
    this.isSignedInAnonymous = false,
    this.checker = false,
    this.hasWalkedThrough = false,
    this.user,
  });

  final bool authenticated;
  final bool isSignedInAnonymous;
  final bool checker;
  final bool hasWalkedThrough;
  final User? user;

  AuthenticationState copyWith({
    bool? authenticated,
    bool? isSignedInAnonymous,
    User? user,
    bool? checker,
    bool? hasWalkedThrough,
  }) {
    return AuthenticationState(
      authenticated: authenticated ?? this.authenticated,
      isSignedInAnonymous: isSignedInAnonymous ?? this.isSignedInAnonymous,
      checker: checker ?? this.checker,
      hasWalkedThrough: hasWalkedThrough ?? this.hasWalkedThrough,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
        authenticated,
        isSignedInAnonymous,
        checker,
        user,
        hasWalkedThrough,
      ];

  Future<User?> getUser() async {
    return await ParseUser.currentUser();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'authenticated': authenticated,
      'isSignedInAnonymous': isSignedInAnonymous,
      'user': user?.toMap(),
      'checker': checker,
      'hasWalkedThrough': hasWalkedThrough,
    };
  }

  factory AuthenticationState.fromMap(Map<String, dynamic> map) {
    return AuthenticationState(
      authenticated: map['authenticated'] as bool,
      isSignedInAnonymous: map['isSignedInAnonymous'] as bool,
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
