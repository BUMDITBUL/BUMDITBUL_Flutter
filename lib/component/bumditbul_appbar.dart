import 'package:bumditbul_flutter/const/bumditbul_colors.dart';
import 'package:bumditbul_flutter/const/bumditbul_text_style.dart';
import 'package:bumditbul_flutter/view/mypage_screen.dart';
import 'package:flutter/material.dart';

class BumditbulAppbar extends StatelessWidget implements PreferredSizeWidget {

  const BumditbulAppbar({super.key,});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: BumditbulColors.black900,
      elevation: 0,
      centerTitle: false,
      title: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          'BUMDITBUL',
          style: BumditbulTextStyle.BarLogo(color: BumditbulColors.green400),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MypageScreen()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.account_circle_rounded,
              color: BumditbulColors.green400,
              size: 20,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}