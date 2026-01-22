import 'package:flutter/material.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';

class PaymentRow extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentRow({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey[300] : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              size: 25,
              color: isSelected ? KprimaryColor : Colors.black,
            ),
            Spacer(),
            Text(text, style: TextStyle(color: Colors.black, fontSize: 20)),
            SizedBox(width: 15),
            Icon(Icons.wallet, color: KprimarybuttonColor, size: 25),
          ],
        ),
      ),
    );
  }
}
