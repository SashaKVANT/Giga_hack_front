import 'package:autogpt_frontend/auth/bloc/form_submission_status.dart';
import 'package:autogpt_frontend/auth/data/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

//Implement Repo in constructor!

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;

  LoginBloc({required this.authRepo}) : super(LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onLoginPressed);
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

  void _onLoginPressed(LoginSubmitted event, Emitter<LoginState> emit) async {
    if (state.isValidEmail && state.isValidPassword) {
      emit(state.copyWith(status: FormSubmitting(), valid: true));
      try {
        await authRepo.login();
        emit(state.copyWith(status: SubmissionSuccess(), valid: true));
        print("SubmissionSuccess");
      } on String catch (e) {
        emit(state.copyWith(status: SubmissionFailed(e), valid: true));
      }
    } else {
      print("zsdgsagsadgsdg");
      emit(state.copyWith(valid: false));
    }
  }
}
