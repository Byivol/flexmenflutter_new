import 'package:flutter/material.dart';

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

class SelectedFitLesson extends StatelessWidget {
  final String nameLesson;
  final Color colorBorder;
  const SelectedFitLesson(
      {super.key, required this.nameLesson, required this.colorBorder});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      titleSpacing: -1,
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      title: Text(nameLesson, style: const TextStyle(fontSize: 20)),
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
          color: colorBorder,
          height: 4.0,
        ),
      ),
    ));
  }
}
