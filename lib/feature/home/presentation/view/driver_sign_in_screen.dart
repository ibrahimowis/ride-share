import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kosom_chat_gpt/core/shared/widgets/custom_text_form_field.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/assets/images/image_assets.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';
import 'package:kosom_chat_gpt/core/shared/widgets/constants.dart';

class DriverSignInScreen extends StatefulWidget {
  const DriverSignInScreen({super.key});

  @override
  State<DriverSignInScreen> createState() => _DriverSignInScreenState();
}

class _DriverSignInScreenState extends State<DriverSignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  File? _pickedCarImage;
  File? _pickedImage;
  File? _pickedDriveLicenseImage;
  File? _pickedCarLicenseImage;

  bool _isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: KprimaryColor),
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    color: KprimaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 100.0),
                      child: Image.asset(
                        AssetsData.LaunchScreenframe2,
                        fit: BoxFit.contain,
                        width: 450,
                        height: 170,
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 39.0,
                        horizontal: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_new_sharp,
                              color: Colors.white,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                          Text(
                            ' استكمال بيانات المضيف',
                            style: Styles.textStyle19,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

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
                                  '     من فضلك اكمل بياناتك الشخصية',
                                  style: Styles.textStyle16.copyWith(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(height: 25),
                              CustomTextFormField(
                                labelText: 'نوع المركبة',
                                errorText: 'من فضلك ادخل النوع',
                                controller: emailController,
                                keyboardType: TextInputType.name,
                                prefixIcon: Icons.directions_car,
                              ),

                              SizedBox(height: 18),
                              CustomTextFormField(
                                labelText: ' ماركة العربية',
                                errorText: 'من فضلك ادخل ماركة العربية',
                                controller: emailController,
                                prefixIcon: Icons.directions_car_sharp,
                              ),
                              SizedBox(height: 18),
                              CustomTextFormField(
                                labelText: '   موديل الماركة',
                                errorText: 'من فضلك ادخل موديل الماركة',
                                controller: emailController,
                              ),
                              SizedBox(height: 18),
                              CustomTextFormField(
                                labelText: ' رقم اللوحة',
                                controller: passwordController,
                                errorText: 'من فضلك ادخل رقم اللوحة ',
                                isPassword: true,
                                keyboardType: TextInputType.phone,
                              ),
                              SizedBox(height: 18),
                              CustomTextFormField(
                                labelText: '  العنوان',
                                controller: passwordController,
                                errorText: 'من فضلك ادخل عنوانك ',
                                isPassword: true,
                                keyboardType: TextInputType.name,
                              ),
                              SizedBox(height: 18),
                              GestureDetector(
                                onTap: () => _pickedCarImage,
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
                                  child: _pickedImage == null
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
                                              ' صورة المركبة       ',
                                              maxLines: 2,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 19,
                                              ),
                                            ),
                                          ],
                                        )
                                      : ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          child: Image.file(
                                            _pickedImage!,
                                            width: double.infinity,
                                            height: 150,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                ),
                              ),
                              SizedBox(height: 18),
                              GestureDetector(
                                onTap: () => _pickImage,
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
                                  child: _pickedImage == null
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
                                              ' اضف صورة شخصية بجوار رخصة القيادة',
                                              maxLines: 2,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 19,
                                              ),
                                            ),
                                          ],
                                        )
                                      : ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          child: Image.file(
                                            _pickedImage!,
                                            width: double.infinity,
                                            height: 150,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                ),
                              ),
                              SizedBox(height: 18),
                              GestureDetector(
                                onTap: () => _pickedDriveLicenseImage,
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
                                  child: _pickedImage == null
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
                                              ' اضف صورة رخصة القيادة',
                                              maxLines: 2,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 19,
                                              ),
                                            ),
                                          ],
                                        )
                                      : ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          child: Image.file(
                                            _pickedImage!,
                                            width: double.infinity,
                                            height: 150,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                ),
                              ),
                              SizedBox(height: 18),
                              GestureDetector(
                                onTap: () => _pickedCarLicenseImage,
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
                                  child: _pickedImage == null
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
                                              ' اضف صورر رخصه المركبة   ',
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        )
                                      : ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          child: Image.file(
                                            _pickedImage!,
                                            width: double.infinity,
                                            height: 150,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                ),
                              ),
                              SizedBox(height: 35),
                              textButtonCustom(
                                text: ' طلب استكمال البيانات',
                                color: KprimarybuttonColor,
                                textColor: Colors.white,
                                onPressed: () {
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
                                  if (_formKey.currentState!.validate()) {
                                    context.push('/homeScreen');
                                  }
                                },
                                fontsize: 25,
                              ),

                              SizedBox(height: 50),
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

  Future<void> _pickImage({required int imageType}) async {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
            child: Wrap(
              children: [
                ListTile(
                  leading: Icon(Icons.add_a_photo),
                  title: Text('التقاط صورة بالكاميرا'),
                  onTap: () async {
                    Navigator.pop(context);
                    final pickedFile = await _picker.pickImage(
                      source: ImageSource.camera,
                    );
                    if (pickedFile != null) {
                      setState(() {
                        _choseImage(imageType, File(pickedFile.path));
                      });
                    }
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_album),
                  title: Text('اختيار من المعرض'),
                  onTap: () async {
                    Navigator.pop(context);
                    final pickedFile = await _picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (pickedFile != null) {
                      setState(() {
                        _choseImage(imageType, File(pickedFile.path));
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _choseImage(int imageType, File imageFile) {
    switch (imageType) {
      case 1:
        _pickedImage = imageFile;
        break;
      case 2:
        _pickedCarImage = imageFile;
        break;
      case 3:
        _pickedDriveLicenseImage = imageFile;
        break;
      case 4:
        _pickedCarLicenseImage = imageFile;
        break;
    }
  }
}
