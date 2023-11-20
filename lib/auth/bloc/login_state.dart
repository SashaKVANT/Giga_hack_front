part of 'login_bloc.dart';

// @immutable //Это все наработки по ролику от Индуса, надо переделать
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

//   LoginFormState({
//     this.email = '',
//     this.password = '',
//   }
//   );

//   LoginFormState copyWith({
//     String? email,
//     String? password,
//   }) {
//     return LoginFormState(
//       email: email ?? this.email,
//       password: password ?? this.password,
//     );
//   }
// }
enum LoginFormState {
  initial,
  loading,
  loaded,
  error,
}

class LoginState {
  final String email;
  bool get isValidEmail => email.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final LoginFormState status;

  LoginState(
      {this.email = '',
      this.password = '',
      this.status = LoginFormState.initial});

  LoginState copyWith({
    String? email,
    String? password,
    LoginFormState? status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
