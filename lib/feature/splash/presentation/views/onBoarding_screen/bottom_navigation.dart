// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BottomNavigation extends StatelessWidget {
  final controller;
  final int currentPage;
  const BottomNavigation({
    Key? key,
    required this.currentPage,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: currentPage == 0
                  ? null
                  : () {
                      controller.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
              child: Text(
                'رجوع',
                style: TextStyle(
                  color: currentPage == 0 ? Colors.grey : Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: SmoothPageIndicator(controller: controller, count: 3),
              ),
            ),

            TextButton(
              onPressed: () {
                if (currentPage == 2) {
                  context.replace('/loginViewScreen');
                } else {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Text(
                currentPage == 2 ? 'ابدا' : 'استمر',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
