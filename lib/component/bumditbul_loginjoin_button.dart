import 'package:bumditbul_flutter/const/bumditbul_colors.dart';
import 'package:bumditbul_flutter/const/bumditbul_text_style.dart';
import 'package:flutter/material.dart';

class LoginJoinButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final double? width, heigh;
  final String text;

  const LoginJoinButton({
    super.key,
    required this.onTap,
    this.width,
    this.heigh,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: heigh ?? 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: BumditbulColors.green400,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: BumditbulTextStyle.JoinLogin(color: BumditbulColors.black50),
        ),
      ),
    );
  }
}

