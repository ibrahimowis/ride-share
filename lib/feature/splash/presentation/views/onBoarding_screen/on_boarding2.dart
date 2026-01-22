import 'package:flutter/material.dart';
import 'package:kosom_chat_gpt/core/assets/images/image_assets.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned.fill(child: Image.asset(AssetsData.OnBoarding2Logo)),
        Positioned(
          top: screenHight * 0.5,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Image.asset(
                AssetsData.OnBoarding2Line,
                color: Colors.white,
                width: screenWidth * .15,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 10),
              Text(' تأكيد الرحلة', style: Styles.textStyle30),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  textAlign: TextAlign.center,
                  ' "بعد اختيار المسار, سيتم عرض اقتراح يتضمن السياره المناسبه, التكلفة, و وقت الوصول المتوقع"',
                  style: Styles.textStyle16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
