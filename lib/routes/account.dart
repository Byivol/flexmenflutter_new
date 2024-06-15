import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}
final List<bool> _selectedWeather = <bool>[true, false];
  bool isAlertDialog = false;
class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    titleSpacing: -1,
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    title: const Text('Личный кабинет', style: TextStyle(fontSize: 20)),
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
  body: Column(
  children: [
    Row(
      children: [
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.person_outlined, size: 30, color: const Color.fromARGB(255, 0, 0, 0)),
                SizedBox(width: 8), 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Губин Евгений Александрович",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('THE FLEX | Тюмень | Горького', style: TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  SizedBox(height: 17),
const Divider(height: 0),
SizedBox(height: 8),
Row(
  children: [
    Text("    ПАКЕТЫ", style: TextStyle(fontSize: 14),)
  ],
),
SizedBox(height: 10),
const Divider(height: 1),
InkWell(
  onTap: () {
    if (!isAlertDialog) {
      IconSnackBar.show(
        context,
        snackBarType: SnackBarType.alert,
        snackBarStyle: const SnackBarStyle(
          maxLines: 1,
        ),
        label: 'Ошибка!',
      );
      isAlertDialog = true;
    } else {
      isAlertDialog = false;
    }
  },
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 10),
      Row(
        children: [
          Icon(Icons.article_outlined, size: 30, color: const Color.fromARGB(255, 0, 0, 0)),
          SizedBox(width: 8), 
          Expanded( // Add Expanded here
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("FLEX Premium",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text("Активно до 20.06.2025", style: TextStyle(fontSize: 13, color: Color.fromARGB(255, 0, 186, 3))),
                    Text("Осталось 800 услуг", style: TextStyle(fontSize: 13, color: Color.fromARGB(255, 93, 93, 93)),)
                  ],
                ),
                Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Color.fromARGB(153, 0, 0, 0),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  ),
),
SizedBox(height: 10),
const Divider(height: 1),
  ],
  ),
);
    
  }
}
