import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errString),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is LoginSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'user_id_is'.tr(
                  args: ['${state.responseModel.data?.user?.id}'],
                ),
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
              AuthAppBar(title: 'sign_in_button'.tr()),
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
                        textDirection:
                            (EasyLocalization.of(
                                  context,
                                )!.locale.languageCode ==
                                'ar')
                            ? ui.TextDirection.rtl
                            : ui.TextDirection.ltr,
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
                                  'welcome_back'.tr(),
                                  style: Styles.textStyle24.copyWith(
                                    color: KsigninTextColor,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Center(
                                child: Text(
                                  'enter_details'.tr(),
                                  style: Styles.textStyle14.copyWith(
                                    color: KsigninTextColor,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'email_label'.tr(),
                                style: Styles.textStyle14.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 13),
                              CustomTextFormField(
                                labelText: 'email_hint'.tr(),
                                errorText: 'email_error'.tr(),
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: 20),
                              Text(
                                'password_label'.tr(),
                                style: Styles.textStyle14.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 13),
                              CustomTextFormField(
                                labelText: 'password_hint'.tr(),
                                errorText: 'password_error'.tr(),
                                controller: passwordController,
                                isPassword: true,
                              ),
                              SizedBox(height: 7),
                              Text(
                                'forgot_password'.tr(),
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
                                        ? 'sending'.tr()
                                        : 'sign_in_button'.tr(),
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
                                    'no_account'.tr(),
                                    style: Styles.textStyle14.copyWith(
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context.push('/signinScreen');
                                    },
                                    child: Text(
                                      'sign_up'.tr(),
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
