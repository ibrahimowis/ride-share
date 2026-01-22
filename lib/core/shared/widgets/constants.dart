import 'package:flutter/material.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';

import 'package:kosom_chat_gpt/feature/splash/presentation/views/onBoarding_screen/bottom_navigation.dart';

Widget onBordingBottomNavigation({
  required PageController controller,
  required int currentPage,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 27, left: 23, right: 25),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: KprimarybuttonColor,
          borderRadius: BorderRadius.circular(70),
        ),
        child: BottomNavigation(
          controller: controller,
          currentPage: currentPage,
        ),
      ),
    ),
  );
}

Widget textButtonCustom({
  required String text,
  required color,
  required textColor,
  required VoidCallback? onPressed,
  required double fontsize,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      height: 60,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.9), blurRadius: 1),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontsize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
