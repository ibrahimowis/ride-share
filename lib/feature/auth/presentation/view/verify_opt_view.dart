import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kosom_chat_gpt/core/shared/widgets/constants.dart';
import 'package:kosom_chat_gpt/feature/auth/presentation/view_model/bloc/otp_cubit/otp_cubit.dart';
import 'package:kosom_chat_gpt/feature/auth/data/repo/otp_repo.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';

class VerifyOtpView extends StatefulWidget {
  final String email;
  final bool isFromForgetPassword;
  const VerifyOtpView({
    super.key,
    required this.email,
    this.isFromForgetPassword = false,
  });

  @override
  State<VerifyOtpView> createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends State<VerifyOtpView> {
  String otpCode = '';
  int secondsRemaining = 60;
  bool enableResend = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (secondsRemaining > 0) {
        setState(() => secondsRemaining--);
      } else {
        setState(() => enableResend = true);
        t.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void resendCode() {
    setState(() {
      secondsRemaining = 60;
      enableResend = false;
    });
    startTimer();
    context.read<OtpCubit>().resendOtp(email: widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          OtpCubit(OtpRepo()), // ✅ مهم: BlocProvider موجود قبل BlocListener
      child: BlocListener<OtpCubit, OtpState>(
        listener: (context, state) {
          if (state is OtpLoadingState) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          }
          if (state is OtpSuccessState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );
            context.go('/loginViewScreen');
          }
          if (state is OtpErrorState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error), backgroundColor: Colors.red),
            );
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              Container(color: KprimaryColor),
              Column(
                children: [
                  Container(
                    height: 170,
                    color: KprimaryColor,
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 25.0, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'التحقق من البريد الالكتروني',
                              style: Styles.textStyle19,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 50,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'أدخل رمز التحقق المكون من 6 أرقام',
                                style: Styles.textStyle19.copyWith(
                                  color: KsigninTextColor,
                                ),
                              ),
                              const SizedBox(height: 30),
                              PinCodeTextField(
                                appContext: context,
                                length: 6,
                                keyboardType: TextInputType.number,
                                animationType: AnimationType.fade,
                                pinTheme: PinTheme(
                                  borderRadius: BorderRadius.circular(10),
                                  fieldHeight: 50,
                                  fieldWidth: 45,
                                  activeColor: KprimarybuttonColor,
                                  inactiveColor: Colors.grey.shade300,
                                  selectedColor: KprimarybuttonColor,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    otpCode = value;
                                  });
                                },
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'الرمز صالح لمدة $secondsRemaining ثانية',
                                style: Styles.textStyle16.copyWith(
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 40),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                      style: Styles.textStyle19.copyWith(
                                        color: Colors.grey[600],
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: 'لم تستلم الرمز؟ ',
                                        ),
                                        WidgetSpan(
                                          child: GestureDetector(
                                            onTap: enableResend
                                                ? resendCode
                                                : null,
                                            child: Text(
                                              'إعادة إرسال الرمز',
                                              style: Styles.textStyle19
                                                  .copyWith(
                                                    color: enableResend
                                                        ? KprimaryColor
                                                        : Colors.grey[400],
                                                    decoration: enableResend
                                                        ? TextDecoration
                                                              .underline
                                                        : TextDecoration.none,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 100),
                              BlocBuilder<OtpCubit, OtpState>(
                                builder: (context, state) {
                                  bool isLoading = state is OtpLoadingState;
                                  return textButtonCustom(
                                    text: isLoading ? 'جاري الارسال' : 'تحقق',
                                    color: KprimarybuttonColor,
                                    textColor: Colors.white,
                                    onPressed: () async {
                                      if (otpCode.length != 6) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'الرجاء ادخال رمز كامل مكون من 6 ارقام',
                                            ),
                                          ),
                                        );
                                      } else {
                                        await context
                                            .read<OtpCubit>()
                                            .verifyOtp(
                                              email: widget.email,
                                              otpCode: otpCode,
                                              isFromForgetPassword:
                                                  widget.isFromForgetPassword,
                                            );
                                      }
                                    },
                                    fontsize: 25,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
