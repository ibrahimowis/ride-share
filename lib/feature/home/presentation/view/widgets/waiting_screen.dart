import 'package:flutter/material.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: KprimaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 155,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: Icon(Icons.access_time, size: 35, color: KprimaryColor),
              ),
            ),
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'الحساب قيد المراجعة',
                      style: Styles.textStyle19.copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'حساب قيد المراجعة حاليا,سيتم اشعارك بمجرد اكمال المراجعة',
                      style: Styles.textStyle16.copyWith(color: Colors.white),
                    ),
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
