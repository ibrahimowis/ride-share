import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kosom_chat_gpt/core/assets/images/image_assets.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      NavigateToOnBoarding();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 13, 189),
      body: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                AssetsData.LaunchScreenframe,
                width: 200,
                height: 200,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(AssetsData.LaunchScreenframe2),
            ),
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                AssetsData.LaunchScreenlogo,
                width: 400.0,
                height: 400.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> NavigateToOnBoarding() async {
    await Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).pushReplacement('/splashViewBody');
    });
  }
}
