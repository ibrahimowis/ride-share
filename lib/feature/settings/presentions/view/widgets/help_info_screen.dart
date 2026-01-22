import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kosom_chat_gpt/core/shared/widgets/constants.dart';
import 'package:kosom_chat_gpt/core/shared/widgets/image_helper.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';
import 'package:kosom_chat_gpt/feature/home/presentation/view/widgets/home_app_bar.dart';
import 'package:kosom_chat_gpt/feature/settings/presentions/view/widgets/contact_us_screen.dart';

class HelpInfoScreen extends StatefulWidget {
  const HelpInfoScreen({super.key});

  @override
  State<HelpInfoScreen> createState() => _HelpInfoScreenState();
}

class _HelpInfoScreenState extends State<HelpInfoScreen> {
  final TextEditingController nameController = TextEditingController();
  File? _pickImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KprimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 170, child: HomeAppBar()),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),

              child: Padding(
                padding: const EdgeInsets.only(top: 35.0, left: 20, right: 20),
                child: Column(
                  children: [
                    ContactUsScreen(),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        'الدعم الفني',
                        style: Styles.textStyle30.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: Text(
                        'نحن هنا لمساعدتك! أخبرنا كيف يمكننا المساعدة ',
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.rtl,
                        style: Styles.textStyle16.copyWith(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'نوع التقرير',
                        style: Styles.textStyle19.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: nameController,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        hintText: 'نوع التقرير',
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        ' رسالتك',
                        style: Styles.textStyle19.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextField(
                        maxLines: 5,
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          hintText:
                              'اكتب رسالتك هنا... صف المشكلة او الاستفسار بالتفصيل',
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        ' ارفاق صور (اختياري)',
                        style: Styles.textStyle19.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    GestureDetector(
                      onTap: () async {
                        final picker = await ImageHelper.pickImage(context);
                        if (picker != null) {
                          setState(() {
                            _pickImage = picker;
                          });
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.5),
                              blurRadius: 5,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: _pickImage == null
                            ? Column(
                                children: [
                                  Icon(
                                    Icons.add_photo_alternate_outlined,
                                    size: 40,
                                    color: KprimarybuttonColor,
                                  ),

                                  SizedBox(height: 5),
                                  Text(
                                    'اضغط لاضافة الصورة',
                                    style: TextStyle(
                                      color: KprimaryColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'يمكنك اضافه عدة صور لتوضيح المشكلة',
                                    style: TextStyle(
                                      fontSize: 17,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  _pickImage!,
                                  width: double.infinity,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),

                    SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
                          child: textButtonCustom(
                            text: '  محادثة',

                            color: KprimarybuttonColor,
                            textColor: Colors.white,
                            onPressed: () {},
                            fontsize: 17,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: textButtonCustom(
                            text: ' ارسال التقرير',

                            color: KprimarybuttonColor,
                            textColor: Colors.white,
                            onPressed: () {},
                            fontsize: 17,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
