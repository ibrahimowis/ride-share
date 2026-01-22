import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kosom_chat_gpt/core/shared/widgets/custom_text_form_field.dart';
import 'package:kosom_chat_gpt/core/shared/widgets/image_helper.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/assets/images/image_assets.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';
import 'package:kosom_chat_gpt/core/shared/widgets/constants.dart';
import 'package:kosom_chat_gpt/feature/auth/presentation/view/widgets/auth_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalProfileInfo extends StatefulWidget {
  const PersonalProfileInfo({super.key});
  @override
  _PersonalProfileInfoState createState() => _PersonalProfileInfoState();
}

class _PersonalProfileInfoState extends State<PersonalProfileInfo> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _selectedGender;
  File? _pickedIdImage;
  File? _pickedProfileImage;
  bool _isAgreed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                                keyboardType: TextInputType.visiblePassword,
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
                              textButtonCustom(
                                text: 'تعديل البيانات',
                                color: KprimarybuttonColor,
                                textColor: Colors.white,
                                onPressed: () async {
                                  if (!_isAgreed) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'من فضلك وافق على شروط الخدمة أولاً',
                                        ),
                                        backgroundColor: Colors.redAccent,
                                      ),
                                    );
                                    return;
                                  }
                                  if (_formKey.currentState!.validate() &&
                                      _selectedGender != null) {
                                    await userSevedData();
                                    context.push('/checkscreen');
                                  }
                                },
                                fontsize: 25,
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
    );
  }

  Future<void> userSevedData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _nameController.text);
    await prefs.setString('gender', _selectedGender!);
    if (_pickedProfileImage != null) {
      await prefs.setString('userImage', _pickedProfileImage!.path);
    }
  }
}
