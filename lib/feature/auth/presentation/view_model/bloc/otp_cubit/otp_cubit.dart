import 'package:bloc/bloc.dart';
import 'package:kosom_chat_gpt/feature/auth/data/repo/otp_repo.dart';
import 'package:meta/meta.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final OtpRepo otpRepo;
  OtpCubit(this.otpRepo) : super(OtpInitial());
  Future<void> verifyOtp({
    required String email,
    required String otpCode,
    required bool isFromForgetPassword,
  }) async {
    try {
      emit(OtpLoadingState());
      final result = await otpRepo.otp(
        email: email,
        otpCode: otpCode,
        isFromForgetPassword: isFromForgetPassword,
      );
      result.fold(
        (error) {
          emit(OtpErrorState(error));
        },
        (message) {
          emit(OtpSuccessState(message));
        },
      );
    } catch (e) {
      emit(OtpErrorState(e.toString()));
    }
  }

  Future<void> resendOtp({required String email}) async {
    try {
      emit(OtpLoadingState()); // يظهر Loading
      final result = await otpRepo.otp(
        email: email,
        otpCode: '', // مفيش OTP هنا لإنه إعادة إرسال
        isFromForgetPassword: true, // لو خاص بإعادة تعيين كلمة السر
      );
      result.fold(
        (error) => emit(OtpErrorState(error)),
        (message) => emit(OtpSuccessState('تم إرسال الرمز مرة أخرى')),
      );
    } catch (e) {
      emit(OtpErrorState(e.toString()));
    }
  }
}
