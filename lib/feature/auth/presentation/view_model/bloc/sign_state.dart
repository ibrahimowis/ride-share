import 'package:flutter/material.dart';

@immutable
sealed class SignUpState {}

final class SignupInitial extends SignUpState {}

final class SignUpLoadingState extends SignUpState {}

final class SignUpSuccessState extends SignUpState {
  final String message;
  SignUpSuccessState(this.message);
}

final class SignUpErrorState extends SignUpState {
  final String errorMessage;
  SignUpErrorState(this.errorMessage);
}
