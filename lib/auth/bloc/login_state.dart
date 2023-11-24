part of 'login_bloc.dart';

// enum LoginFormState {
//   initial,
//   loading,
//   loaded,
//   error,
// }

class LoginState {
  final String email;
  bool get isValidEmail => email.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final FormSubmissionStatus status;

  final bool valid;

  LoginState(
      {this.email = '',
      this.password = '',
      this.status = const InitialFormStatus(),
      this.valid = true});

  LoginState copyWith({
    String? email,
    String? password,
    FormSubmissionStatus? status,
    bool? valid,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      valid: valid ?? this.valid,
    );
  }
}
