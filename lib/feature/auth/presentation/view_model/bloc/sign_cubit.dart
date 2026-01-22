import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kosom_chat_gpt/feature/auth/data/repo/sign_repo.dart';
import 'package:kosom_chat_gpt/feature/auth/presentation/view_model/bloc/sign_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignRepo signRepo;
  SignUpCubit(this.signRepo) : super(SignupInitial());

  Future<void> signUp({
    required String email,
    required String password,
    required String fullName,
    required String playerId,
    File? profileImage,
    File? nationalImage,
    String? dataOfBirth,
  }) async {
    try {
      emit(SignUpLoadingState());
      final result = await signRepo.signUp(
        email: email,
        fullName: fullName,
        password: password,
        playerId: playerId,
        profileImage: profileImage,
        nationalImage: nationalImage,
        dataOfBirth: dataOfBirth,
      );
      result.fold(
        (errorMessage) {
          emit(SignUpErrorState(errorMessage));
        },
        (successMassage) {
          emit(SignUpSuccessState(successMassage));
        },
      );
    } catch (e) {
      emit(SignUpErrorState(e.toString()));
    }
  }
}
