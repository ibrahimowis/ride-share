import 'package:flutter/material.dart';
import 'package:kosom_chat_gpt/core/shared/widgets/constants.dart';

class DeleteappScreen extends StatelessWidget {
  const DeleteappScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: textButtonCustom(
            text: 'حذف الحساب',

            color: Colors.red,
            textColor: Colors.white,
            onPressed: () {},
            fontsize: 17,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: textButtonCustom(
            text: 'تسجيل الخروج',

            color: Colors.red,
            textColor: Colors.white,
            onPressed: () {},
            fontsize: 17,
          ),
        ),
      ],
    );
  }
}
