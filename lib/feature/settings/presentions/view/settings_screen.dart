import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/feature/auth/presentation/view_model/auth_cubit.dart';
import 'package:kosom_chat_gpt/feature/settings/presentions/view/widgets/aboutApp_screen.dart';
import 'package:kosom_chat_gpt/feature/settings/presentions/view/widgets/deleteapp_screen.dart';
import 'package:kosom_chat_gpt/feature/settings/presentions/view/widgets/help_screen.dart';
import 'package:kosom_chat_gpt/feature/settings/presentions/view/widgets/language_screen.dart';
import 'package:kosom_chat_gpt/feature/settings/presentions/view/widgets/personal_profile.dart';
import 'package:kosom_chat_gpt/feature/settings/presentions/view/widgets/policy_screen.dart';
import 'package:kosom_chat_gpt/feature/settings/presentions/view/widgets/setting_appbar_screen.dart';
import 'package:kosom_chat_gpt/feature/settings/presentions/view/widgets/settings_info.dart';

class Settings_Screen extends StatelessWidget {
  const Settings_Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        settingsAppBarScreen(),

        Text(
          context.read<AuthCubit>().myLoginModel?.data?.user?.id?.toString() ??
              "",
        ),

        Expanded(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 110,
                  color: KprimaryColor,
                ),
                Positioned.fill(
                  top: 55,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          spreadRadius: 1,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      settingsInfoScreen(),
                      SizedBox(height: 30),
                      PersonalProfile(),
                      SizedBox(height: 30),

                      LanguageScreen(),
                      SizedBox(height: 20),
                      HelpScreen(),
                      SizedBox(height: 20),
                      AboutappScreen(),
                      SizedBox(height: 20),
                      PolicyScreen(),
                      SizedBox(height: 40),
                      DeleteappScreen(),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
