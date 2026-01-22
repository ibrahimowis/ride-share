part of 'update_profile_cubit.dart';

@immutable
sealed class UpdateProfileState {}

final class UpdateProfileInitial extends UpdateProfileState {}

final class UpdateProfileLoadingState extends UpdateProfileState {}

final class UpdateProfileSuccessState extends UpdateProfileState {
  final String successMessage;
  UpdateProfileSuccessState(this.successMessage);
}

final class UpdateProfileErrorState extends UpdateProfileState {
  final String errorMessage;
  UpdateProfileErrorState(this.errorMessage);
}
