import 'package:bumditbul_flutter/const/bumditbul_colors.dart';
import 'package:bumditbul_flutter/const/bumditbul_text_style.dart';
import 'package:bumditbul_flutter/component/taskList.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class MainScreenCalendar extends StatefulWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const MainScreenCalendar({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  State<MainScreenCalendar> createState() => _MainScreenCalendarState();
}

class _MainScreenCalendarState extends State<MainScreenCalendar> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  final CalendarFormat _calendarFormat = CalendarFormat.week;
  bool showFullCalendar = false;

  @override
  void initState() {
    super.initState();
    _focusedDay = widget.selectedDate;
    _selectedDay = widget.selectedDate;
  }

  DateTime _getFirstDay() {
    final now = DateTime.now();
    return DateTime(now.year - 3);
  }

  DateTime _getLastDay() {
    final now = DateTime.now();
    return DateTime(now.year + 3);
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
    widget.onDateSelected(selectedDay);
  }

  void _changeWeek(int offset) {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + offset, 1);
    });
  }

  void _toggleFullCalendar() {
    setState(() {
      showFullCalendar = !showFullCalendar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => _changeWeek(-1),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: BumditbulColors.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: _toggleFullCalendar,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  DateFormat.yMMMM('ko').format(_focusedDay),
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _changeWeek(1),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: BumditbulColors.white,
                ),
              ),
            ),
          ],
        ),
        TableCalendar(
          locale: 'ko_KR',
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          calendarFormat: _calendarFormat,
          availableCalendarFormats: const {CalendarFormat.week: 'Week'},
          headerVisible: false,
          startingDayOfWeek: StartingDayOfWeek.sunday,
          daysOfWeekVisible: true,
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: BumditbulColors.green400.withOpacity(0.4),
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: BumditbulColors.green400.withOpacity(0.4),
              shape: BoxShape.circle,
            ),
            defaultTextStyle:
                BumditbulTextStyle.MainDate(color: BumditbulColors.white),
            weekendTextStyle:
                BumditbulTextStyle.MainDate(color: BumditbulColors.white),
            outsideDaysVisible: true,
          ),
          onDaySelected: _onDaySelected,
          onPageChanged: (focusedDay) {
            setState(() {
              _focusedDay = focusedDay;
            });
          },
        ),
        Expanded(
            child: Tasklist(),
        ),
        if (showFullCalendar) ...[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: TableCalendar(
                locale: 'ko_KR',
                firstDay: _getFirstDay(),
                lastDay: _getLastDay(),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                calendarFormat: CalendarFormat.month,
                availableCalendarFormats: const {CalendarFormat.month: 'Month'},
                startingDayOfWeek: StartingDayOfWeek.sunday,
                headerStyle: HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                  titleTextStyle: BumditbulTextStyle.MainDate(
                      color: BumditbulColors.white,
                  ),
                  leftChevronIcon: Icon(
                      Icons.keyboard_arrow_left,
                      color: BumditbulColors.white,
                  ),
                  rightChevronIcon: Icon(
                      Icons.keyboard_arrow_right,
                      color: BumditbulColors.white,
                  ),
                ),
                daysOfWeekVisible: true,
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: BumditbulColors.green400.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: BumditbulColors.green400.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  defaultTextStyle:
                      BumditbulTextStyle.MainDate(color: BumditbulColors.white),
                  weekendTextStyle:
                      BumditbulTextStyle.MainDate(color: BumditbulColors.white),
                  outsideDaysVisible: true,
                ),
                onDaySelected: _onDaySelected,
                onPageChanged: (focusedDay) {
                  setState(() {
                    _focusedDay = focusedDay;
                  });
                },
              ),
            ),
          ),
        ],
      ],
    );
  }
}
