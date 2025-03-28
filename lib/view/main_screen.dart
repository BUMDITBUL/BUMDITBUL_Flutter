import 'package:bumditbul_flutter/component/bumditbul_appbar.dart';
import 'package:bumditbul_flutter/widget//main_screen_banner.dart';
import 'package:bumditbul_flutter/component/main_screen_calendar.dart';
import 'package:bumditbul_flutter/const/bumditbul_colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BumditbulAppbar(),
      backgroundColor: BumditbulColors.black900,
      body: Column(
        children: [
          MainScreenBanner(),
          Flexible(
              child: MainScreenCalendar(
                selectedDate: DateTime.now(),
                onDateSelected: (date) {},
              ),
          ),
        ],
      ),
    );
  }
}