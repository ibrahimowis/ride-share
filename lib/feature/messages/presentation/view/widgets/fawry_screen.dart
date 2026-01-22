import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kosom_chat_gpt/core/assets/images/image_assets.dart';
import 'package:kosom_chat_gpt/core/shared/widgets/constants.dart';
import 'package:kosom_chat_gpt/core/shared/widgets/custom_text_form_field.dart';

class FawryScreen extends StatelessWidget {
  FawryScreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Color.fromARGB(246, 6, 86, 160)),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    height: 150,
                    color: const Color.fromARGB(246, 6, 86, 160),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'اضافة رصيد بالكارت',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 20),
                          IconButton(
                            onPressed: () {
                              context.pop();
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 250,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.5),
                                  blurRadius: 3,
                                  spreadRadius: 0.5,
                                ),
                              ],
                            ),
                            child: Image.asset(
                              AssetsData.fawry,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.5),
                                  blurRadius: 3,
                                  spreadRadius: 0.5,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentGeometry.topRight,
                                    child: Text(
                                      'بيانات الكارت',

                                      style: TextStyle(
                                        color: Color.fromARGB(246, 6, 86, 160),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: CustomTextFormField(
                                      labelText: 'رقم الكارت',
                                      textColor: Color.fromARGB(
                                        246,
                                        6,
                                        86,
                                        160,
                                      ),
                                      controller: _nameController,
                                      keyboardType: TextInputType.name,
                                      errorText: 'من فضلك ادخل رقم الكارت',
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: CustomTextFormField(
                                          width: 120,
                                          labelText: 'رمز CVV',
                                          errorText: 'من فضلك ادخل رمز CVV',
                                          textColor: Color.fromARGB(
                                            246,
                                            6,
                                            86,
                                            160,
                                          ),

                                          controller: _nameController,
                                        ),
                                      ),
                                      Spacer(),
                                      Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: CustomTextFormField(
                                          width: 120,
                                          labelText: 'تاريخ الانتهاء',
                                          textColor: Color.fromARGB(
                                            246,
                                            6,
                                            86,
                                            160,
                                          ),
                                          controller: _nameController,
                                          errorText:
                                              'من فضلك ادخل تاريخ الانتهاء',
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.5),
                                  blurRadius: 3,
                                  spreadRadius: 0.5,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentGeometry.topRight,
                                    child: Text(
                                      'المبلغ المراد ضافته',

                                      style: TextStyle(
                                        color: Color.fromARGB(246, 6, 86, 160),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: CustomTextFormField(
                                      labelText: 'ادخل المبلغ بالجنية المصري',
                                      prefixIcon: Icons.attach_money_sharp,
                                      textColor: Color.fromARGB(
                                        246,
                                        6,
                                        86,
                                        160,
                                      ),
                                      controller: _nameController,
                                      keyboardType: TextInputType.name,
                                      errorText: 'من فضلك ادخل رقم الكارت',
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          textButtonCustom(
                            text: 'تأكيد الدفع',
                            color: const Color.fromARGB(255, 242, 219, 5),
                            textColor: Color.fromARGB(246, 6, 86, 160),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print('تم التاكيد');
                              } else {}
                            },
                            fontsize: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
