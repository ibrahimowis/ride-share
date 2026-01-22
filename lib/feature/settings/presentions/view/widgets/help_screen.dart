import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

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
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              context.push('/helpInfoScreen');
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  'المساعدة والدعم',
                  style: Styles.textStyle24.copyWith(color: Colors.black),
                ),
                SizedBox(height: 5),
                Text(
                  ' الاسالة الشائعة والدعم الفني',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey[300],
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(3.14),
                child: Icon(
                  Icons.question_mark_sharp,
                  size: 40,
                  color: KprimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
