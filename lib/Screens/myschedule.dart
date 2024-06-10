part of '../screens.dart';

class MySchedule extends StatefulWidget {
  @override
  State<MySchedule> createState() => _MyScheduleState();
}

class _MyScheduleState extends State<MySchedule> {
  bool isAlertDialog = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          titleSpacing: -1,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: const Text('Мои занятия', style: TextStyle(fontSize: 20)),
          leadingWidth: 100,
          centerTitle: true,
        ),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: selectedFitLesson.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Scaffold(
                                appBar: AppBar(
                                  titleSpacing: -1,
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  title: Text(
                                      selectedFitLesson[index].nameLesson,
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
                                      color:
                                          selectedFitLesson[index].colorColumn,
                                      height: 4.0,
                                    ),
                                  ),
                                ),
                                body: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(selectedFitLesson[index].nameLesson),
                                      Text(selectedFitLesson[index]
                                          .hashCode
                                          .toString()),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.black),
                                        onPressed: () {
                                          setState(() {
                                            selectedFitLesson[index]
                                                .isSelected = false;
                                            selectedFitLesson.remove(
                                                selectedFitLesson[index]);
                                          });
                                          if (!isAlertDialog) {
                                            IconSnackBar.show(
                                              context,
                                              snackBarType: SnackBarType.alert,
                                              snackBarStyle:
                                                  const SnackBarStyle(
                                                maxLines: 1,
                                              ),
                                              label:
                                                  'Вы отписались от занятия!',
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
                              )));
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                            width: 4,
                            height: 60,
                            color: selectedFitLesson[index].colorColumn),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        selectedFitLesson[index].timeLesson,
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
                                text: selectedFitLesson[index].nameLesson,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 19,
                                  fontWeight: FontWeight.w400,
                                )),
                            TextSpan(
                                text:
                                    '\nСвобоно: ${selectedFitLesson[index].countFree}',
                                style: const TextStyle(
                                    color: Color.fromARGB(169, 0, 0, 0),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w100)),
                            TextSpan(
                                text:
                                    '\n${selectedFitLesson[index].nameTrainer}',
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
                ));
          },
        ));
  }
}
