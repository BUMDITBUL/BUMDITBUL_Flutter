import 'package:bumditbul_flutter/const/bumditbul_colors.dart';
import 'package:bumditbul_flutter/const/bumditbul_text_style.dart';
import 'package:flutter/material.dart';

class Tasklist extends StatefulWidget {
  const Tasklist({super.key});

  @override
  State<Tasklist> createState() => _TasklistState();
}

class _TasklistState extends State<Tasklist> {
  List<Task> tasks = [
    Task(
        title: "수학",
        time: "19:25 ~ 20:55",
        score: "96 ~ 106p",
        icon: Icons.calculate_outlined),
    Task(
        title: "영어",
        time: "21:05 - 22:40",
        score: "81 ~ 85p",
        icon: Icons.abc_outlined),
    Task(
        title: "과학",
        time: "22:50 - 24:00",
        score: "95 ~ 106p",
        icon: Icons.science_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BumditbulColors.black900,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskCard(
                    task: tasks[index],
                    onToggle: () {
                      setState(() {
                        tasks[index].isCompleted = !tasks[index].isCompleted;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: BumditbulColors.black900,
        child: Icon(Icons.add, color: BumditbulColors.green200),
      ),
    );
  }
}

class Task {
  String title;
  String time;
  String score;
  IconData icon;
  bool isCompleted;

  Task({
    required this.title,
    required this.time,
    required this.score,
    required this.icon,
    this.isCompleted = false,
  });
}

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;

  const TaskCard({
    super.key,
    required this.task,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: BumditbulColors.black800,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(task.icon, color: BumditbulColors.green200, size: 25),
        title: Text(
          task.title,
          style: BumditbulTextStyle.TaskName(color: BumditbulColors.white),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.time, style: BumditbulTextStyle.TaskTime(color: BumditbulColors.white)),
            Text(task.score, style: BumditbulTextStyle.TaskRange(color: BumditbulColors.white)),
          ],
        ),
        trailing: GestureDetector(
          onTap: onToggle,
          child: Icon(
            Icons.check,
            color: task.isCompleted ? BumditbulColors.green200 : BumditbulColors.black600,
            size: 20,
          ),
        ),
      ),
    );
  }
}