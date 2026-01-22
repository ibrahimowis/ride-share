import 'package:flutter/material.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';

class GenderScreen extends StatefulWidget {
  final String selectedGender;
  final void Function(String) onGenderSelected;
  const GenderScreen({
    super.key,
    required this.selectedGender,
    required this.onGenderSelected,
  });

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? _selectedGender;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 8),
        ],
      ),
      height: 92,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            IconButton(
              onPressed: () => _genderType(context),
              icon: Icon(Icons.arrow_back_ios_new),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'اختر نوع المرافقين  ',
                      style: Styles.textStyle19.copyWith(color: Colors.black),
                    ),
                    SizedBox(height: 5),
                    Text(
                      _selectedGender ?? 'ذكر / انثي',
                      style: Styles.textStyle16.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 28,
              backgroundColor: KprimarybuttonColor,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  void _genderType(BuildContext context) {
    final List<String> genders = ['ذكر', 'انثي'];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) {
        double itemHeight = 60;
        double totalHeight = genders.length * itemHeight;
        double maxHeight = MediaQuery.of(context).size.height * 0.4;
        double sheetHeight = totalHeight < maxHeight ? totalHeight : maxHeight;

        return SafeArea(
          child: Container(
            height: sheetHeight,
            child: ListView.separated(
              itemCount: genders.length,
              separatorBuilder: (_, __) =>
                  Divider(color: Colors.grey[300], thickness: 1, height: 1),
              itemBuilder: (context, index) {
                final gender = genders[index];
                return InkWell(
                  onTap: () {
                    setState(() => _selectedGender = gender);
                    widget.onGenderSelected(gender);
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 8,
                    ),
                    child: Center(
                      child: Text(
                        gender,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
