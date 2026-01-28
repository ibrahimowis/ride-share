import 'package:flutter/material.dart';
import 'package:kosom_chat_gpt/core/utils/styles.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final Color? textColor;
  final String? errorText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final IconData? prefixIcon;
  final double? hight;
  final double? width;
  final bool readOnly;
  final VoidCallback? onTap;

  const CustomTextFormField({
    required this.labelText,
    this.errorText,
    required this.controller,
    this.prefixIcon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.hight,
    this.width,
    this.textColor,
    this.readOnly = false,
    this.onTap,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final fieldKey = GlobalKey<FormFieldState>();
  late bool obscureText;
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.hight,
      width: widget.width,
      child: TextFormField(
        key: fieldKey,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: obscureText,
        style: Styles.textStyle15,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: Styles.textStyle15.copyWith(color: widget.textColor),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.grey[100],
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
          prefixIcon: widget.prefixIcon != null
              ? Icon(widget.prefixIcon, color: widget.textColor)
              : null,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                )
              : null,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return widget.errorText ?? widget.labelText;
          }
          return null;
        },
        onChanged: (value) {
          fieldKey.currentState?.validate();
        },
      ),
    );
  }
}
