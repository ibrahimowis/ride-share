import 'package:bloc/bloc.dart';
import 'package:kosom_chat_gpt/feature/auth/data/model/login_response_model.dart';
import 'package:kosom_chat_gpt/feature/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        (errorStr) {
          emit(LoginErrorState(errorStr));
        },
        (returnedResponse) async {
          myLoginModel = returnedResponse;
          if (returnedResponse.data!.accessToken != null) {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString('token', returnedResponse.data!.accessToken!);
          }
          emit(LoginSuccessState(returnedResponse));
        },
      );
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
}
