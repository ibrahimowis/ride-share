import 'package:flutter/material.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';

class ChoseTimeScreen extends StatefulWidget {
  final DateTime? selectedDateTime;
  final void Function(DateTime) onDateTimeSelected;
  const ChoseTimeScreen({
    super.key,
    required this.onDateTimeSelected,
    this.selectedDateTime,
  });
  @override
  State<ChoseTimeScreen> createState() => _ChoseTimeScreenState();
}

class _ChoseTimeScreenState extends State<ChoseTimeScreen> {
  DateTime? selectedDateTime;
  @override
  void initState() {
    super.initState();
    selectedDateTime = widget.selectedDateTime;
  }

  Future<void> pickDateTime() async {
    DateTime? gate = await showDatePicker(
      context: context,
      initialDate: selectedDateTime ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (gate == null) return;
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: selectedDateTime != null
          ? TimeOfDay(
              hour: selectedDateTime!.hour,
              minute: selectedDateTime!.minute,
            )
          : TimeOfDay.now(),
    );
    if (time == null) return;
    final dateTime = DateTime(
      gate.year,
      gate.month,
      gate.day,
      time.hour,
      time.minute,
    );
    setState(() {
      selectedDateTime = dateTime;
    });
    widget.onDateTimeSelected (dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        InkWell(
          onTap: pickDateTime,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8),
              ],
            ),
            height: 92,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios_new_sharp,
                    size: 25,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'اختر الوقت',
                            style: Styles.textStyle19.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            selectedDateTime != null
                                ? '${selectedDateTime!.day}/${selectedDateTime!.month}/${selectedDateTime!.year}  '
                                      '${selectedDateTime!.hour.toString().padLeft(2, '0')}:${selectedDateTime!.minute.toString().padLeft(2, '0')}'
                                : 'حدد الوقت والتاريخ المناسب لك',
                            style: Styles.textStyle16.copyWith(
                              color: Colors.black,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: KprimaryColor,
                    radius: 28,
                    child: const Icon(Icons.access_time, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
