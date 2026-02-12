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
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString(
            'accessToken',
            returnedResponse.data!.accessToken!,
          );
          await prefs.setString(
            "refreshToken",
            returnedResponse.data!.refreshToken!,
          );
          emit(LoginSuccessState(returnedResponse));
        },
      );
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }

  Future<void> checkAuth() async {
    emit(LoginLoadingState());
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final refreshToken = prefs.getString('refreshToken');

    if (accessToken == null) {
      emit(UnAuthenticatedState());
      return;
    }

    final result = await authRepo.getMe(token: accessToken);

    result.fold(
      (error) async {
        if (refreshToken == null) {
          emit(UnAuthenticatedState());
          return;
        }

        final refreshResult = await authRepo.refreshToken(
          refreshToken: refreshToken,
        );

        refreshResult.fold(
          (refreshError) {
            emit(UnAuthenticatedState());
          },
          (refreshResponse) async {
            await prefs.setString(
              'accessToken',
              refreshResponse.data!.accessToken!,
            );
            await prefs.setString(
              'refreshToken',
              refreshResponse.data!.refreshToken!,
            );
            emit(AuthenticatedState());
          },
        );
      },
      (success) {
        emit(AuthenticatedState());
      },
    );
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('accessToken');
    await prefs.remove('refreshToken');

    emit(UnAuthenticatedState());
  }
}
