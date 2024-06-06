import 'package:flutter/material.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:intl/intl.dart';
import 'package:theflexmen/additional/lessons.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  final CalendarWeekController _controller = CalendarWeekController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: -1,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: const Text('Расписание', style: TextStyle(fontSize: 20)),
          leadingWidth: 100,
          leading: Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Закрыть',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)))),
          centerTitle: true,
        ),
        body: ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              Column(children: [
                Card(
                  child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 1)
                      ]),
                      child: CalendarWeek(
                        backgroundColor: Colors.white,
                        todayDateStyle: TextStyle(),
                        dayOfWeekStyle: TextStyle(),
                        dateStyle: TextStyle(fontSize: 16),
                        weekendsStyle: TextStyle(),
                        dayShapeBorder: BoxShape.circle,
                        pressedDateBackgroundColor: Colors.black,
                        pressedDateStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        month: [
                          'ЯНВАРЬ',
                          'ФЕВРАЛЬ',
                          'МАРТ',
                          'АПРЕЛЬ',
                          'МАЙ',
                          'ИЮНЬ',
                          'ИЮЛЬ',
                          'АВГУСТ',
                          'СЕНТЯБРЬ',
                          'ОКТЯБРЬ',
                          'НОЯБРЬ',
                          'ДЕКАБРЬ'
                        ],
                        dayOfWeek: ['ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ', 'ВС'],
                        controller: _controller,
                        height: 110,
                        showMonth: true,
                        minDate: DateTime.now().add(
                          Duration(days: -3),
                        ),
                        maxDate: DateTime.now().add(
                          Duration(days: 10),
                        ),
                        onDatePressed: (DateTime datetime) {
                          setState(() {});
                        },
                        onDateLongPressed: (DateTime datetime) {},
                        onWeekChanged: () {},
                        monthViewBuilder: (DateTime time) => Align(
                          alignment: FractionalOffset.center,
                          child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                DateFormat.yMMMM().format(time),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w600),
                              )),
                        ),
                      )),
                ),
                Column(
                  children: Lessons()
                              .getLessonsForDate(_controller.selectedDate)
                              ?.isNotEmpty ==
                          true
                      ? Lessons().getLessonsForDate(_controller.selectedDate)!
                      : [
                          Center(
                              child: Text(
                            'Нет расписания на выбранный день',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
                        ],
                )
              ]),
            ]));
  }
}
