part of '../screens.dart';

class MySchedule extends StatefulWidget {
  @override
  State<MySchedule> createState() => MyScheduleState();
}

class MyScheduleState extends State<MySchedule> {
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
        body: ListView(children: selectedFitLesson));
  }
}
