import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class settingsInfoScreen extends StatefulWidget {
  const settingsInfoScreen({super.key});

  @override
  State<settingsInfoScreen> createState() => _settingsInfoScreenState();
}

class _settingsInfoScreenState extends State<settingsInfoScreen> {
  String? _username;
  String? _userImage;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username');
      _userImage = prefs.getString('userImage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Positioned.fill(
          child: Center(
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[300],
              child: CircleAvatar(
                radius: 56,
                backgroundColor: Colors.white,
                backgroundImage: _userImage != null
                    ? FileImage(File(_userImage!))
                    : null,
                child: (_userImage == null || _userImage!.isEmpty)
                    ? Icon(Icons.person, size: 50, color: Colors.white)
                    : null,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        if (_username != null)
          Text(
            _username!,
            style: Styles.textStyle19.copyWith(color: KprimarybuttonColor),
          )
        else
          Text(
            'اسم المستخدم',
            style: Styles.textStyle19.copyWith(color: KprimarybuttonColor),
          ),
      ],
    );
  }
}
