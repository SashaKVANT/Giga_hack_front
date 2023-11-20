import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

//Implement Repo in constructor!

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    // on<LoginEvent>(_onLoginPressed);
  }

  void _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    print("my email is ${event.email}");
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    print("my password is ${event.password}");
    emit(state.copyWith(password: event.password));
  }

  void _onLoginPressed(LoginPressed event, Emitter<LoginState> emit) async {
    if (state.isValidEmail && state.isValidPassword) {
      emit(state.copyWith(status: LoginFormState.loading));
      await Future.delayed(const Duration(seconds: 3), () {
        emit(state.copyWith(
            status: LoginFormState
                .loaded)); //Симуляция репозитория, нужно вставить репу (и выше в Bloc)
      });
    } else {
      emit(state.copyWith(status: LoginFormState.error));
    }
  }
}
