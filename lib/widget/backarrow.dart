import 'package:bumditbul_flutter/const/bumditbul_colors.dart';
import 'package:flutter/material.dart';

class Backarrow extends StatelessWidget implements PreferredSizeWidget{
  const Backarrow({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: BumditbulColors.black900,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: BumditbulColors.green400,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
