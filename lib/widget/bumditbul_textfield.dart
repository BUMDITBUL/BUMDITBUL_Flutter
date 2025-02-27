import 'package:bumditbul_flutter/const/bumditbul_colors.dart';
import 'package:bumditbul_flutter/const/bumditbul_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool password;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    required this.password,
    this.suffixIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: BumditbulColors.black300,
      ),
    );

    return TextField(
      controller: widget.controller,
      obscureText: widget.password,
      style: BumditbulTextStyle.HintTxt(color: BumditbulColors.black300),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: BumditbulTextStyle.HintTxt(color: BumditbulColors.black300),
        enabledBorder: border,
        focusedBorder: border,
        disabledBorder: border,
        focusedErrorBorder: border,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        suffixIcon: widget.suffixIcon,
      ),
      keyboardType: TextInputType.text,
    );
  }
}