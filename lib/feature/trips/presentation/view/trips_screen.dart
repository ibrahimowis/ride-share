import 'package:flutter/material.dart';
import 'package:kosom_chat_gpt/core/assets/images/image_assets.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';
import 'package:kosom_chat_gpt/feature/home/presentation/view/widgets/home_app_bar.dart';
import 'package:kosom_chat_gpt/feature/trips/presentation/view/widgets/freetrip_screen.dart';

class Trips_screen extends StatelessWidget {
  const Trips_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenhight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(color: KprimaryColor),
        Column(
          children: [
            HomeAppBar(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      spreadRadius: 1,
                      blurRadius: 10,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 25.0,
                    right: 13,
                    left: 13,
                  ),
                  child: Column(
                    children: [
                      FreetripScreen(),
                      SizedBox(height: 10),
                      Image.asset(AssetsData.trip, height: screenhight * 0.28),
                      SizedBox(height: 10),
                      Text(
                        'لا توجد رحلات متاحة',
                        style: Styles.textStyle19.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'جرب تغير معايير البحث أو المحاولة لاحقأ',
                        style: Styles.textStyle19.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
