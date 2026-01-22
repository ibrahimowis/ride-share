import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';

class settingsAppBarScreen extends StatelessWidget {
  const settingsAppBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: KprimaryColor,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
              ),
              Spacer(),
              Text(
                'الأعدادات',
                style: Styles.textStyle19.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
