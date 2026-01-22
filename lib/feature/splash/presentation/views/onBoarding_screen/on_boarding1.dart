import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/assets/images/image_assets.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWigth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(AssetsData.OnBoarding1Logo, fit: BoxFit.cover),
        ),
        Positioned(
          top: 30,
          right: 10,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: KprimarybuttonColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  context.replace('/loginViewScreen');
                },
                child: Text(
                  'تخطي',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: screenHight * 0.5,
          left: screenWigth * 0,
          right: screenWigth * 0,
          child: Column(
            children: [
              HugeIcon(
                icon: HugeIcons.strokeRoundedLocation09,
                size: 44,
                color: Colors.white,
              ),

              SizedBox(height: 15),
              Text(
                'اختيار المسار',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '" حدد وجهتك التي تريد الذهاب اليها, ثم اختر الوقت المناسب, وانطلق في رحلتك"',
                  textAlign: TextAlign.center,
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
