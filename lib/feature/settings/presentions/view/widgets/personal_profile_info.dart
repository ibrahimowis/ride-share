import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kosom_chat_gpt/core/shared/widgets/custom_text_form_field.dart';
import 'package:kosom_chat_gpt/core/shared/widgets/image_helper.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/assets/images/image_assets.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';
import 'package:kosom_chat_gpt/core/shared/widgets/constants.dart';
import 'package:kosom_chat_gpt/feature/auth/presentation/view/widgets/auth_app_bar.dart';
import 'package:kosom_chat_gpt/feature/settings/presentions/view_model/cubit/update_profile_cubit.dart';

class PersonalProfileInfo extends StatefulWidget {
  const PersonalProfileInfo({super.key});
  @override
  _PersonalProfileInfoState createState() => _PersonalProfileInfoState();
}

class _PersonalProfileInfoState extends State<PersonalProfileInfo> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String? _selectedGender;
  File? _pickedIdImage;
  File? _pickedProfileImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UpdateProfileCubit, UpdateProfileState>(
        listener: (context, state) {
          if (state is UpdateProfileErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is UpdateProfileSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.successMessage),
                backgroundColor: KprimarybuttonColor,
              ),
            );
          }
        },
        child: Stack(
          children: [
            Container(color: KprimaryColor),
            Column(
              children: [
                AuthAppBar(title: 'تعديل بيانات الحساب'),

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
                                  heightFactor: 0.4,
                                  child: Image.asset(
                                    AssetsData.loginLogo,
                                    width: 290,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    'قم بتعديل بيانات حسابك',
                                    style: Styles.textStyle24.copyWith(
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
                                  labelText: 'رقم الهاتف',
                                  errorText: 'من فضلك ادخل رقم الهاتف',
                                  controller: _phoneController,
                                  keyboardType: TextInputType.phone,
                                ),
                                const SizedBox(height: 18),
                                DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    labelText: 'اختار النوع',
                                    labelStyle: Styles.textStyle15,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  initialValue: _selectedGender,
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'ذكر',
                                      child: Text('ذكر'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'أنثى',
                                      child: Text('أنثى'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedGender = value;
                                    });
                                    _formKey.currentState?.validate();
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'من فضلك اختر النوع';
                                    }
                                    return null;
                                  },
                                ),

                                const SizedBox(height: 18),
                                GestureDetector(
                                  onTap: () async {
                                    final picked = await ImageHelper.pickImage(
                                      context,
                                    );
                                    if (picked != null) {
                                      setState(() {
                                        _pickedIdImage = picked;
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 150,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1.5,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[100],
                                    ),
                                    child: _pickedIdImage == null
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Icon(
                                                Icons.add_a_photo_outlined,
                                                size: 40,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                'اضف صوره شخصية وانت بجانب البطاقة الشخصية',
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          )
                                        : ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            child: Image.file(
                                              _pickedIdImage!,
                                              width: double.infinity,
                                              height: 150,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                  ),
                                ),
                                const SizedBox(height: 18),
                                GestureDetector(
                                  onTap: () async {
                                    final picked = await ImageHelper.pickImage(
                                      context,
                                    );
                                    if (picked != null) {
                                      setState(() {
                                        _pickedProfileImage = picked;
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 150,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1.5,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[100],
                                    ),
                                    child: _pickedProfileImage == null
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Icon(
                                                Icons.add_a_photo_outlined,
                                                size: 40,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                'اضف صورة شخصية',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          )
                                        : ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            child: Image.file(
                                              _pickedProfileImage!,
                                              width: double.infinity,
                                              height: 150,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                  ),
                                ),
                                const SizedBox(height: 30),

                                const SizedBox(height: 35),
                                BlocBuilder<
                                  UpdateProfileCubit,
                                  UpdateProfileState
                                >(
                                  builder: (context, state) {
                                    final isLoading =
                                        state is UpdateProfileLoadingState;
                                    return textButtonCustom(
                                      text: isLoading
                                          ? 'جاري التعديل...'
                                          : 'تعديل البيانات',
                                      color: KprimarybuttonColor,
                                      textColor: Colors.white,
                                      onPressed: isLoading
                                          ? null
                                          : () async {
                                              if (_formKey.currentState!
                                                      .validate() &&
                                                  _selectedGender != null) {
                                                await context
                                                    .read<UpdateProfileCubit>()
                                                    .updateProfileData(
                                                      fullName: _nameController
                                                          .text
                                                          .trim(),
                                                      phoneNumber:
                                                          _phoneController.text
                                                              .trim(),
                                                      gender:
                                                          _selectedGender ==
                                                              'ذكر'
                                                          ? 'MALE'
                                                          : 'FEMALE',
                                                      dateOfBirth: '2000-01-01',
                                                      profileimage:
                                                          _pickedProfileImage,
                                                      nationalImage:
                                                          _pickedIdImage,
                                                    );
                                              }
                                            },
                                      fontsize: 25,
                                    );
                                  },
                                ),

                                const SizedBox(height: 50),
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
      ),
    );
  }
}
