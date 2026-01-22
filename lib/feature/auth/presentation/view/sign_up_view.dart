import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kosom_chat_gpt/core/shared/widgets/custom_text_form_field.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/assets/images/image_assets.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';
import 'package:kosom_chat_gpt/core/shared/widgets/constants.dart';
import 'package:kosom_chat_gpt/feature/auth/data/repo/sign_repo.dart';
import 'package:kosom_chat_gpt/feature/auth/presentation/view/widgets/auth_app_bar.dart';
import 'package:kosom_chat_gpt/feature/auth/presentation/view_model/bloc/sign_cubit.dart';
import 'package:kosom_chat_gpt/feature/auth/presentation/view_model/bloc/sign_state.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  File? _pickedProfileImage;
  bool _isAgreed = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(SignRepo()),
      child: Scaffold(
        body: Stack(
          children: [
            Container(color: KprimaryColor),
            Column(
              children: [
                AuthAppBar(title: 'انشاء حساب'),

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
                    child: BlocConsumer<SignUpCubit, SignUpState>(
                      listener: (context, state) {
                        if (state is SignUpSuccessState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.message),
                              backgroundColor: Colors.green,
                            ),
                          );
                          context.push(
                            '/checkscreen',
                            extra: _emailController.text,
                          );
                        } else if (state is SignUpErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.errorMessage),
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        bool isLoading = state is SignUpLoadingState;
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25.0,
                            ),
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
                                      heightFactor: 0.35,
                                      child: Image.asset(
                                        AssetsData.loginLogo,
                                        width: 290,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        'انشاء حساب جديد',
                                        style: Styles.textStyle24.copyWith(
                                          color: KsigninTextColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Center(
                                      child: Text(
                                        'برجاء ادخال تفاصيل حسابك لتسجيل الدخول',
                                        style: Styles.textStyle14.copyWith(
                                          color: KsigninTextColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 25),
                                    CustomTextFormField(
                                      labelText: 'الاسم',
                                      errorText: 'من فضلك ادخل الاسم',
                                      controller: _nameController,
                                      keyboardType: TextInputType.name,
                                    ),
                                    const SizedBox(height: 18),
                                    CustomTextFormField(
                                      labelText: 'الحساب الشخصي',
                                      errorText: 'من فضلك ادخل الحساب الشخصي',
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    const SizedBox(height: 18),
                                    CustomTextFormField(
                                      labelText: 'الرقم السري',
                                      controller: _passwordController,
                                      errorText: 'من فضلك ادخل الرقم السري',
                                      isPassword: true,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                    ),

                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: _isAgreed,
                                          activeColor: KprimarybuttonColor,
                                          onChanged: (bool? newValue) {
                                            setState(() {
                                              _isAgreed = newValue ?? false;
                                            });
                                          },
                                        ),
                                        Expanded(
                                          child: Text(
                                            'أوافق على شروط الخدمة وسياسة الخصوصية',
                                            style: Styles.textStyle14.copyWith(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 25),
                                    textButtonCustom(
                                      text: isLoading
                                          ? 'جاري إنشاء الحساب...'
                                          : 'إنشاء الحساب',

                                      color: KprimarybuttonColor,
                                      textColor: Colors.white,
                                      onPressed: isLoading
                                          ? null
                                          : () {
                                              if (!_isAgreed) {
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                      'من فضلك وافق على شروط الخدمة أولاً',
                                                    ),
                                                    backgroundColor:
                                                        Colors.redAccent,
                                                  ),
                                                );
                                                return;
                                              }
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                context
                                                    .read<SignUpCubit>()
                                                    .signUp(
                                                      email:
                                                          _emailController.text,
                                                      fullName:
                                                          _nameController.text,
                                                      password:
                                                          _passwordController
                                                              .text,
                                                      playerId: 'string',
                                                      profileImage:
                                                          _pickedProfileImage,
                                                    );
                                              }
                                            },
                                      fontsize: 25,
                                    ),
                                    const SizedBox(height: 20),
                                    if (isLoading)
                                      const Center(
                                        child: CircularProgressIndicator(
                                          color: KprimarybuttonColor,
                                        ),
                                      ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'هل لديك حساب؟ ',
                                          style: Styles.textStyle14.copyWith(
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            context.push(
                                              '/checkscreen',
                                              extra: _emailController.text,
                                            );
                                          },
                                          child: Text(
                                            'تسجيل دخول',
                                            style: Styles.textStyle14.copyWith(
                                              color: KprimarybuttonColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
