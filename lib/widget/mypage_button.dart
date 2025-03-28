import 'package:bumditbul_flutter/const/bumditbul_colors.dart';
import 'package:bumditbul_flutter/const/bumditbul_text_style.dart';
import 'package:flutter/material.dart';

class MypageButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const MypageButton({
    super.key,
    required this.text,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 70,
          height: 20,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: BumditbulColors.black800,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            text,
            style: BumditbulTextStyle.MyPageTextWhite(
                color: BumditbulColors.white
            ),
          ),
        ),
      ),
    );
  }
}
