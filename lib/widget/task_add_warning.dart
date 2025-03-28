import 'package:flutter/material.dart';
import '../const/bumditbul_colors.dart';
import '../const/bumditbul_text_style.dart';

class TaskAddWarning extends StatelessWidget {
  const TaskAddWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '시험 범위를 입력 해 주세요.\n',
            style: BumditbulTextStyle.MyPageTextWhite(color: BumditbulColors.white),
          ),
          TextSpan(
            text: '입력하지 않은 과목은 ',
            style: BumditbulTextStyle.MyPageTextWhite(color: BumditbulColors.white),
          ),
          TextSpan(
            text: '제외',
            style: BumditbulTextStyle.MyPageTextGreen(color: BumditbulColors.green400),
          ),
          TextSpan(
            text: '되며, 난이도는 ',
            style: BumditbulTextStyle.MyPageTextWhite(color: BumditbulColors.white),
          ),
          TextSpan(
            text: '자동으로 중',
            style: BumditbulTextStyle.MyPageTextGreen(color: BumditbulColors.green400),
          ),
          TextSpan(
            text: '으로 설정 됩니다.',
            style: BumditbulTextStyle.MyPageTextWhite(color: BumditbulColors.white),
          ),
        ],
      ),
    );
  }
}
