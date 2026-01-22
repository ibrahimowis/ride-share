import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kosom_chat_gpt/core/shared/widgets/image_helper.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';

class VisaScreen extends StatefulWidget {
  const VisaScreen({super.key});

  @override
  State<VisaScreen> createState() => _VisaScreenState();
}

class _VisaScreenState extends State<VisaScreen> {
  File? _pickImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: const Color.fromARGB(255, 111, 3, 174)),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 150,
                  color: const Color.fromARGB(255, 111, 3, 174),
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
                          icon: CircleAvatar(
                            backgroundColor: Colors.grey[100],
                            radius: 25,
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 30,
                              color: const Color.fromARGB(255, 111, 3, 174),
                            ),
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 111, 3, 174),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.arrow_back_rounded,
                                      size: 35,
                                      color: const Color.fromARGB(
                                        255,
                                        111,
                                        3,
                                        174,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'تأكيد الرصيد المراد اضافته',
                                          style: Styles.textStyle19.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'سيتم اضافة الرصيد في محفظتك',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Styles.textStyle16.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 15,
                                  child: Icon(
                                    Icons.flash_on,
                                    color: Color.fromARGB(115, 255, 0, 0),
                                    size: 35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'المبلغ',

                          style: Styles.textStyle24.copyWith(
                            color: const Color.fromARGB(255, 111, 3, 174),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.5),
                                blurRadius: 0.3,
                                spreadRadius: 0.5,
                              ),
                            ],
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'اضافه رصيد',
                                  style: Styles.textStyle30.copyWith(
                                    color: const Color.fromARGB(
                                      255,
                                      111,
                                      3,
                                      174,
                                    ),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextField(
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      111,
                                      3,
                                      174,
                                    ),
                                    fontSize: 30,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'EGP 0.00',
                                    hintStyle: TextStyle(
                                      color: const Color.fromARGB(
                                        255,
                                        111,
                                        3,
                                        174,
                                      ).withValues(alpha: 0.3),
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                    ),

                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: const Color.fromARGB(
                                          255,
                                          111,
                                          3,
                                          174,
                                        ),
                                        width: 3,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'ملاحظات (اختياري)',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 111, 3, 174),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.3),
                                blurRadius: 0.5,
                                spreadRadius: 0.2,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: '...اكتب ملاحظاتك هنا',
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey[500],
                                ),
                              ),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                              ),
                              maxLines: 5,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'صورة الايصال',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 111, 3, 174),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),

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
                            decoration: BoxDecoration(
                              color: Colors.white,

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.5),
                                  blurRadius: 5,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: _pickImage == null
                                ? Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.add_photo_alternate_outlined,
                                          size: 40,
                                          color: const Color.fromARGB(
                                            255,
                                            111,
                                            3,
                                            174,
                                          ),
                                        ),

                                        SizedBox(height: 5),
                                        Text(
                                          'صورة الايصال',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                              255,
                                              111,
                                              3,
                                              174,
                                            ),
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                      ],
                                    ),
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
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 111, 3, 174),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.arrow_back_rounded,
                                      size: 35,
                                      color: const Color.fromARGB(
                                        255,
                                        111,
                                        3,
                                        174,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'تأكيد الرصيد المراد اضافته',
                                          style: Styles.textStyle19.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'سيتم اضافة الرصيد في محفظتك',
                                          style: Styles.textStyle16.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
