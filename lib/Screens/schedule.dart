part of '../screens.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -1,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Мои занятия', style: TextStyle(fontSize: 20)),
        leadingWidth: 100,
        centerTitle: true,
      ),
    );
  }
}
