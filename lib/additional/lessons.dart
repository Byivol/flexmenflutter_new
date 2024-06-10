import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:intl/intl.dart';
import 'package:theflexmen/screens.dart';

class FitLesson extends StatefulWidget {
  final String nameLesson;
  final String timeLesson;
  final int countFree;
  final String nameTrainer;
  final Color colorColumn;
  bool isSelected;

  FitLesson(
      {required this.nameLesson,
      required this.timeLesson,
      this.countFree = 0,
      required this.nameTrainer,
      required this.colorColumn,
      this.isSelected = false});

  @override
  State<FitLesson> createState() => _FitLessonState();
}

class _FitLessonState extends State<FitLesson> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 80,
      child: InkWell(
        onTap: () {
          if (widget.isSelected == true) {
            print(widget.isSelected);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DelObjectDetailsScreen(this.widget, () {
                setState(() {
                  widget.isSelected = false;
                });
              });
            }));
          } else {
            print(widget.isSelected);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AddObjectDetailsScreen(this.widget, () {
                setState(() {
                  widget.isSelected = true;
                });
              });
            }));
          }
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                  width: 4, height: 60, color: this.widget.colorColumn),
            ),
            const SizedBox(width: 20),
            Text(
              this.widget.timeLesson,
              style: const TextStyle(
                  height: 0,
                  fontSize: 14,
                  color: Color.fromARGB(169, 0, 0, 0),
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(width: 30),
            RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                children: [
                  TextSpan(
                      text: this.widget.nameLesson,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                      )),
                  TextSpan(
                      text: '\nСвобоно: ${this.widget.countFree}',
                      style: const TextStyle(
                          color: Color.fromARGB(169, 0, 0, 0),
                          fontSize: 13,
                          fontWeight: FontWeight.w100)),
                  TextSpan(
                      text: '\n${this.widget.nameTrainer}',
                      style: const TextStyle(
                          color: Color.fromARGB(169, 0, 0, 0),
                          fontSize: 13,
                          fontWeight: FontWeight.w100)),
                ],
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: Color.fromARGB(153, 0, 0, 0),
            ),
          ],
        ),
      ),
    );
  }
}

class AddObjectDetailsScreen extends StatefulWidget {
  final FitLesson object;
  final VoidCallback onChanged;

  AddObjectDetailsScreen(this.object, this.onChanged);

  @override
  State<AddObjectDetailsScreen> createState() => _AddObjectDetailsScreenState();
}

class _AddObjectDetailsScreenState extends State<AddObjectDetailsScreen> {
  bool isAlertDialog = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -1,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(widget.object.nameLesson,
            style: const TextStyle(fontSize: 20)),
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
                    color: Colors.white)),
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: widget.object.colorColumn,
            height: 4.0,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.object.nameLesson),
            Text(widget.object.hashCode.toString()),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                setState(() {
                  selectedFitLesson.add(widget.object);
                });
                widget.onChanged();
                if (!isAlertDialog) {
                  IconSnackBar.show(
                    context,
                    snackBarType: SnackBarType.success,
                    snackBarStyle: const SnackBarStyle(
                      maxLines: 1,
                    ),
                    label: 'Вы записались на занятие!',
                  );
                  isAlertDialog = true;
                } else {
                  isAlertDialog = false;
                }
                Navigator.pop(context);
                print(selectedFitLesson);
              },
              child: Text(
                'Записаться',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DelObjectDetailsScreen extends StatefulWidget {
  final FitLesson object;
  final VoidCallback onChanged;

  DelObjectDetailsScreen(this.object, this.onChanged);

  @override
  State<DelObjectDetailsScreen> createState() => _DelObjectDetailsScreenState();
}

class _DelObjectDetailsScreenState extends State<DelObjectDetailsScreen> {
  bool isAlertDialog = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -1,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(widget.object.nameLesson,
            style: const TextStyle(fontSize: 20)),
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
                    color: Colors.white)),
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: widget.object.colorColumn,
            height: 4.0,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.object.nameLesson),
            Text(widget.object.hashCode.toString()),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                setState(() {
                  selectedFitLesson.remove(widget.object);
                });
                widget.onChanged();
                if (!isAlertDialog) {
                  IconSnackBar.show(
                    context,
                    snackBarType: SnackBarType.alert,
                    snackBarStyle: const SnackBarStyle(
                      maxLines: 1,
                    ),
                    label: 'Вы отписались от занятия!',
                  );
                  isAlertDialog = true;
                } else {
                  isAlertDialog = false;
                }
                Navigator.pop(context);
              },
              child: Text(
                'Отписаться',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Lessons {
  List<Widget> getLessonsForDate(DateTime date) {
    String formattedDate = DateFormat.yMd().format(date);
    return mapScheduleDate[formattedDate] as List<Widget>;
  }

  Map<String, List<FitLesson>> getLessonsMap() {
    return mapScheduleDate;
  }

  static Map<String, List<FitLesson>> mapScheduleDate = {
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
