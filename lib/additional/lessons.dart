import 'package:flutter/material.dart';
import 'package:theflexmen/routes/lesson.dart';
import 'package:intl/intl.dart';

class Lessons {
  List<Widget>? getLessonsForDate(DateTime date) {
    String formattedDate = DateFormat.yMd().format(date);
    return Lessons().mapScheduleDate[formattedDate];
  }

  Map<String, List<Widget>> getLessonsMap() {
    return mapScheduleDate;
  }

  Map<String, List<Widget>> mapScheduleDate = {
    DateFormat.yMd().format(DateTime.now().add(Duration(days: -3))): [],
    DateFormat.yMd().format(DateTime.now().add(Duration(days: -2))): [],
    DateFormat.yMd().format(DateTime.now().add(Duration(days: -1))): [],
    DateFormat.yMd().format(DateTime.now()): [
      FitLesson(
          nameLesson: 'KICKBOXING',
          timeLesson: 'Сегодня\n17:00\n60 мин',
          nameTrainer: 'Егоров Василий',
          countFree: 10,
          colorColumn: Color.fromARGB(255, 253, 88, 88)),
      FitLesson(
          nameLesson: 'CYCLING',
          timeLesson: 'Сегодня\n17:00\n60 мин',
          nameTrainer: 'Динар Айдаров',
          countFree: 2,
          colorColumn: Color.fromARGB(137, 17, 255, 156)),
      FitLesson(
          nameLesson: 'TRX',
          timeLesson: 'Сегодня\n17:00\n60 мин',
          nameTrainer: 'Егоров Василий',
          countFree: 1,
          colorColumn: Color.fromARGB(131, 255, 195, 126)),
    ],
    DateFormat.yMd().format(DateTime.now().add(Duration(days: 1))): [
      FitLesson(
          nameLesson: 'CYCLING',
          timeLesson: 'Сегодня\n17:00\n60 мин',
          nameTrainer: 'Динар Айдаров',
          countFree: 2,
          colorColumn: Color.fromARGB(137, 17, 255, 156)),
    ],
    DateFormat.yMd().format(DateTime.now().add(Duration(days: 2))): [],
    DateFormat.yMd().format(DateTime.now().add(Duration(days: 3))): [],
    DateFormat.yMd().format(DateTime.now().add(Duration(days: 4))): [],
    DateFormat.yMd().format(DateTime.now().add(Duration(days: 5))): [
      FitLesson(
          nameLesson: 'CYCLING',
          timeLesson: 'Сегодня\n17:00\n60 мин',
          nameTrainer: 'Динар Айдаров',
          countFree: 2,
          colorColumn: Color.fromARGB(137, 17, 255, 156)),
    ],
    DateFormat.yMd().format(DateTime.now().add(Duration(days: 6))): [],
    DateFormat.yMd().format(DateTime.now().add(Duration(days: 7))): [],
    DateFormat.yMd().format(DateTime.now().add(Duration(days: 8))): [],
    DateFormat.yMd().format(DateTime.now().add(Duration(days: 9))): [],
    DateFormat.yMd().format(DateTime.now().add(Duration(days: 10))): [],
  };
}
