import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';

class PersonalProfile extends StatelessWidget {
  const PersonalProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 8),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                context.push('/personalProfileInfo');
              },
              icon: Icon(Icons.arrow_back_ios_new),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AutoSizeText(
                    minFontSize: 20,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    'الملف الشخصي',
                    style: Styles.textStyle24.copyWith(color: Colors.black),
                  ),
                  SizedBox(height: 5),
                  AutoSizeText(
                    minFontSize: 10,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    'عرض وتعديل بيانات الملف الشخصي',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey[300],
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(3.14),
                child: Icon(
                  Icons.person_2_outlined,
                  size: 40,
                  color: KprimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
