import 'package:bloc/bloc.dart';
import 'package:kosom_chat_gpt/feature/auth/data/model/login_response_model.dart';
import 'package:kosom_chat_gpt/feature/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AuthCubit(this.authRepo) : super(AuthInitial());

  LoginResponseModel? myLoginModel;

  Future<void> login({required String email, required String password}) async {
    try {
      emit(LoginLoadingState());
      final result = await authRepo.login(email: email, password: password);

      result.fold(
        //return false
        (errorStr) {
          emit(LoginErrorState(errorStr));
        },
        //return true
        (returnedResponse) {
          // TODO: this is the same data
          myLoginModel = returnedResponse;
          emit(LoginSuccessState(returnedResponse));
        },
      );
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
}
