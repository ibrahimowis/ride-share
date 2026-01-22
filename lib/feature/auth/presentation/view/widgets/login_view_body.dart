import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' as tr;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kosom_chat_gpt/core/shared/widgets/constants.dart';
import 'package:kosom_chat_gpt/core/shared/widgets/custom_text_form_field.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/assets/images/image_assets.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';
import 'package:kosom_chat_gpt/feature/auth/presentation/view/widgets/auth_app_bar.dart';
import 'package:kosom_chat_gpt/feature/auth/presentation/view_model/auth_cubit.dart';

class LoginViewBody extends StatefulWidget {
  LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          //show error to user
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errString),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is LoginSuccessState) {
          // navigate into home screen
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'user id is :: ${state.responseModel.data?.user?.id}',
              ),
              backgroundColor: KprimarybuttonColor,
            ),
          );
          if (state.responseModel.data?.status == "unverified") {
            context.push('/checkscreen', extra: emailController.text);
          } else {
            context.go('/navBar');
          }
        }
      },
      child: Stack(
        children: [
          Container(color: KprimaryColor),
          Column(
            children: [
              AuthAppBar(title: 'تسجيل دخول'),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                heightFactor: 0.3,
                                child: Image.asset(
                                  AssetsData.loginLogo,
                                  width: 290,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Center(
                                child: Text(
                                  'مرحبا بعودتك',
                                  style: Styles.textStyle24.copyWith(
                                    color: KsigninTextColor,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Center(
                                child: Text(
                                  'برجاء ادخال تفاضيل حسابك لتسجيل الدخول',
                                  style: Styles.textStyle14.copyWith(
                                    color: KsigninTextColor,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'البريد الاكتروني',
                                style: Styles.textStyle14.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 13),
                              CustomTextFormField(
                                labelText: 'ادخل بريدك الالكتروني',
                                errorText: 'من فضلك ادخل البريد',
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: 20),
                              Text(
                                'الرقم السري',
                                style: Styles.textStyle14.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 13),
                              CustomTextFormField(
                                labelText: 'ادخل رقمك السري',
                                controller: passwordController,
                                errorText: 'من فضلك ادخل رقمك السري',
                                isPassword: true,
                              ),
                              SizedBox(height: 7),
                              Text(
                                'هل نسيت كلمة المرور ؟',
                                style: Styles.textStyle14.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 10),
                              BlocBuilder<AuthCubit, AuthState>(
                                builder: (context, state) {
                                  final isLoading = state is LoginLoadingState;

                                  return textButtonCustom(
                                    text: isLoading
                                        ? 'جاري الإرسال'
                                        : 'تسجيل الدخول'.tr(),
                                    color: KprimarybuttonColor,
                                    textColor: Colors.white,
                                    onPressed: isLoading
                                        ? null
                                        : () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              await context
                                                  .read<AuthCubit>()
                                                  .login(
                                                    email: emailController.text
                                                        .trim(),
                                                    password: passwordController
                                                        .text
                                                        .trim(),
                                                  );
                                            }
                                          },
                                    fontsize: 25,
                                  );
                                },
                              ),
                              SizedBox(height: 7),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'ليس لديك حساب؟ ',
                                    style: Styles.textStyle14.copyWith(
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context.push('/signinScreen'); //
                                    },
                                    child: Text(
                                      'قم بالتسجيل ',
                                      style: Styles.textStyle14.copyWith(
                                        color: KprimarybuttonColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
