import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:theflexmen/additional/lessons.dart';
import 'package:theflexmen/screens.dart';

class FitLesson extends StatelessWidget {
  final String nameLesson;
  final String timeLesson;
  final int countFree;
  final String nameTrainer;
  final Color colorColumn;

  const FitLesson({
    super.key,
    required this.nameLesson,
    required this.timeLesson,
    this.countFree = 0,
    required this.nameTrainer,
    required this.colorColumn,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 80,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectedFitLesson(
                    nameLesson: nameLesson,
                    colorBorder: colorColumn,
                    lesson: this,
                  ),
                ),
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(width: 4, height: 60, color: colorColumn),
                ),
                const SizedBox(width: 20),
                Text(
                  timeLesson,
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
                          text: nameLesson,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                          )),
                      TextSpan(
                          text: '\nСвобоно: $countFree',
                          style: const TextStyle(
                              color: Color.fromARGB(169, 0, 0, 0),
                              fontSize: 13,
                              fontWeight: FontWeight.w100)),
                      TextSpan(
                          text: '\n$nameTrainer',
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
        ),
        const Divider(height: 0)
      ],
    );
  }
}

class SelectedFitLesson extends StatefulWidget {
  final String nameLesson;
  final Color colorBorder;

  FitLesson lesson;
  SelectedFitLesson(
      {super.key,
      required this.nameLesson,
      required this.colorBorder,
      required this.lesson});

  @override
  _SelectedFitLessonState createState() => _SelectedFitLessonState();
}

class _SelectedFitLessonState extends State<SelectedFitLesson> {
  bool _isRegistered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -1,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(widget.nameLesson, style: const TextStyle(fontSize: 20)),
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
            color: widget.colorBorder,
            height: 4.0,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 120,
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                _isRegistered = !_isRegistered;
              });
              if (_isRegistered) {
                IconSnackBar.show(
                  context,
                  snackBarType: SnackBarType.success,
                  snackBarStyle: const SnackBarStyle(
                    maxLines: 1,
                  ),
                  label: 'Успешно!',
                );
                selectedFitLesson.add(widget.lesson);
              }
            },
            child: Text(
              _isRegistered ? 'Отписаться' : 'Записаться',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
