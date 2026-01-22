import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  String _userName = '';
  String _gender = '';
  String? _userImagePath;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('username') ?? '';
      _gender = prefs.getString('gender') ?? '';
      _userImagePath = prefs.getString('userImage');
    });
  }

  String get _salutation {
    if (_gender == 'ذكر') return 'أستاذ';
    if (_gender == 'أنثى') return 'أستاذة';
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      color: KprimaryColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Row(
            children: [
              const Icon(Icons.notifications, color: Colors.white, size: 35),
              SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ' أهلاً $_salutation $_userName  ',
                      style: Styles.textStyle19.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      ' On Way في تطبيق ',
                      style: Styles.textStyle16.copyWith(color: Colors.white70),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 14),
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.grey.shade300,
                backgroundImage: _userImagePath != null
                    ? FileImage(File(_userImagePath!))
                    : null,
                child: _userImagePath == null
                    ? const Icon(Icons.person, color: Colors.white, size: 28)
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
