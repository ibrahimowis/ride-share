import 'package:flutter/material.dart';
import 'package:kosom_chat_gpt/core/assets/images/image_assets.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned.fill(child: Image.asset(AssetsData.OnBoarding3Logo)),
        Positioned(
          top: screenHight * 0.5,
          right: 0,
          left: 0,
          child: Column(
            children: [
              Icon(Icons.location_on_outlined, size: 44, color: Colors.white),
              SizedBox(height: 15),
              Text('تتبع رحلتك', style: Styles.textStyle30),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  textAlign: TextAlign.center,
                  ' "شبكة توصيل ضخمة , تساعدك علي العثور علي رحلة مريحة وامنة ورخيصة"',
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
