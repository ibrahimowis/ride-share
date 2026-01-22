import 'package:flutter/material.dart';
import 'package:kosom_chat_gpt/core/assets/images/image_assets.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';

class AuthAppBar extends StatelessWidget {
  final String title;
  AuthAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: KprimaryColor,
          child: Padding(
            padding: const EdgeInsets.only(left: 100.0),
            child: Image.asset(
              AssetsData.LaunchScreenframe2,
              fit: BoxFit.contain,
              width: 450,
              height: 170,
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 39.0, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                Text(title, style: Styles.textStyle19),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
