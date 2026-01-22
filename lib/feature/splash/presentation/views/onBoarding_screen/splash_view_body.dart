import 'package:flutter/material.dart';
import 'package:kosom_chat_gpt/core/shared/widgets/constants.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'on_boarding1.dart';
import 'on_boarding2.dart';
import 'on_boarding3.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  final controller = PageController();
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      final Page = controller.page?.round() ?? 0;
      if (Page != _currentPage) {
        setState(() {
          _currentPage = Page;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KprimaryColor,
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: const [OnBoarding1(), OnBoarding2(), OnBoarding3()],
          ),
          onBordingBottomNavigation(
            controller: controller,
            currentPage: _currentPage,
          ),
        ],
      ),
    );
  }
}
