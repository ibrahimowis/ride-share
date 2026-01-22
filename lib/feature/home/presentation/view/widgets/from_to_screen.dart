import 'package:flutter/material.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';

class FromToScreen extends StatefulWidget {
  const FromToScreen({super.key});

  @override
  State<FromToScreen> createState() => _FromToScreenState();
}

class _FromToScreenState extends State<FromToScreen> {
  String? _selectedlocation;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
              ),
            ],
          ),
          height: 92,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => _locationType(context),

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
                          ' من ',
                          style: Styles.textStyle19.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          _selectedlocation ?? ' مدينة الواسطي ',
                          style: Styles.textStyle16.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: KprimaryColor,
                  radius: 28,
                  child: Icon(Icons.location_on, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _locationType(BuildContext context) {
    final List<String> Locations = [
      'مدينة الواسطي ',
      'مدينه ببا',
      'مدينة الفشن',
      'مدينة ناصر',
      'مدينة سمسطا',
      'مدينة بني سويف',
    ];
    showModalBottomSheet(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,

      builder: (context) {
        double itemHight = 60;
        double totlaHight = itemHight * Locations.length;
        double maxHight = MediaQuery.of(context).size.height * 0.4;
        double sheetHight = totlaHight < maxHight ? totlaHight : maxHight;

        return Container(
          height: sheetHight,
          child: SafeArea(
            child: ListView.separated(
              itemBuilder: (context, index) {
                final location = Locations[index];
                return InkWell(
                  onTap: () {
                    setState(() => _selectedlocation = location);
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 8,
                    ),
                    child: Center(
                      child: Text(
                        location,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (_, _) =>
                  Divider(color: Colors.grey[300], thickness: 1, height: 1),
              itemCount: Locations.length,
            ),
          ),
        );
      },
    );
  }
}
