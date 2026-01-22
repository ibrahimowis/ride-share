import 'package:flutter/material.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 8),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => _languageType(context),
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  'اللغة',
                  style: Styles.textStyle24.copyWith(color: Colors.black),
                ),
                SizedBox(height: 5),
                Text(
                  'العربية',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.language, size: 40, color: KprimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}

String selectedlang = 'العربية';
void _languageType(BuildContext context) {
  final List<String> language = ['English', 'العربية'];

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: 250,
        child: Column(
          children: [
            SizedBox(height: 10),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'اختر اللغة',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 40),
            Expanded(
              child: ListView.separated(
                itemCount: language.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      selectedlang = language[index];
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          if (selectedlang == language[index])
                            Icon(
                              Icons.check_circle_outline_outlined,
                              color: KprimaryColor,
                            ),
                          Spacer(),
                          Text(
                            language[index],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
              ),
            ),
          ],
        ),
      );
    },
  );
}
