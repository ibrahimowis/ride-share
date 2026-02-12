import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:kosom_chat_gpt/feature/settings/data/repo/update_profile_repo.dart';
import 'package:meta/meta.dart';
part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UpdateProfileRepo updateProfileRepo;
  UpdateProfileCubit(this.updateProfileRepo) : super(UpdateProfileInitial());
  Future<void> updateProfileData({
    String? fullName,
    String? phoneNumber,
    String? gender,
    String? dateOfBirth,
    File? profileimage,
    File? nationalImage,
  }) async {
    try {
      emit(UpdateProfileLoadingState());
      final result = await updateProfileRepo.updateDate(
        fullName: fullName,
        phoneNumber: phoneNumber,
        gender: gender,
        dateOfBirth: dateOfBirth,
        profileimage: profileimage,
        nationalImage: nationalImage,
      );
      result.fold(
        (error) {
          emit(UpdateProfileErrorState(error));
        },
        (message) {
          emit(UpdateProfileSuccessState(message));
        },
      );
    } catch (e) {
      emit(UpdateProfileErrorState(e.toString()));
    }
  }
}
