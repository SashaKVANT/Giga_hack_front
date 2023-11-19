part of 'login_bloc.dart';

// @immutable   Это все наработки по ролику от Индуса, надо переделать
// abstract class LoginState {}

// class LoginInitial extends LoginState {
//   final String email;
//   final String password;

//   LoginInitial({
//     this.email = '',
//     this.password = '',
//   });
// }

// class LoginLoading extends LoginState {}

// class LoginError extends LoginState {}

// class LoginFormState extends LoginState {
//   final String email;
//   final String password;

//   LoginFormState(
//     this.email,
//     this.password,
//   );
// }
class LoginState {
  final String email;
  bool get isValidemail => email.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  LoginState({
    this.email = '',
    this.password = '',
  });

  LoginState copyWith({
    String? email,
    String? password,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
