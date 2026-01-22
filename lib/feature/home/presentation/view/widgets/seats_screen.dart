import 'package:flutter/material.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';

class SeatsScreen extends StatefulWidget {
  final int? seatCount;
  const SeatsScreen({super.key, this.seatCount});

  @override
  SeatsScreenState createState() => SeatsScreenState();
}

class SeatsScreenState extends State<SeatsScreen> {
  int? seatCount;

  @override
  void initState() {
    super.initState();
    seatCount = widget.seatCount;
  }

  void updateseats(int count) {
    setState(() {
      seatCount = count;
    });
  }

  int? getseats() => seatCount;
  @override
  Widget build(BuildContext context) {
    return Container(
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
            const Icon(Icons.arrow_back_ios_new, size: 25, color: Colors.black),
            const SizedBox(width: 15),
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'اختار عدد المقاعد',
                      style: Styles.textStyle19.copyWith(color: Colors.black),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      seatCount != null
                          ? 'عدد المقاعد المطلوبة: $seatCount'
                          : 'حدد عدد المقاعد المطلوبة',
                      style: Styles.textStyle16.copyWith(color: Colors.black),
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
              child: const Icon(Icons.event_seat, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
