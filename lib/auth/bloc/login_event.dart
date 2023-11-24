part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class LoginEmailChanged extends LoginEvent {
  //Пока что мы не трекаем эти события (я пока не разобрался)
  final String email;
  const LoginEmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

final class LoginPasswordChanged extends LoginEvent {
  //Пока что мы не трекаем эти события (я пока не разобрался)
  final String password;
  const LoginPasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

final class LoginSubmitted extends LoginEvent {
  LoginSubmitted();

  @override
  List<Object> get props => [];
}
