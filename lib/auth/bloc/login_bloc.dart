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

  // void _onLoginPressed(event, emit) async {
  //   if (event is LoginPressed) {
  //     if (event.email.isEmpty || event.password.isEmpty) {
  //       emit(LoginError());
  //     } else {
  //       emit(LoginLoading());
  //       await Future.delayed(const Duration(seconds: 3), () {
  //         emit(LoginLoaded(event.email));
  //       });
  //     }
  //   }
  // }
}
