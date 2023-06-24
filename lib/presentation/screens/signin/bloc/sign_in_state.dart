import 'package:flutter/foundation.dart' show immutable;

//// Created by PhucPT on 21/06/2023

@immutable
class SignInState {
  final String email;
  final String password;

  const SignInState({this.email = "", this.password = ""});

  SignInState copyWith({String? email, String? password}) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
