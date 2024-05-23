import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -1,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Уведомления', style: TextStyle(fontSize: 20)),
        leadingWidth: 100,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: const TextSpan(
                text: 'Сегодня\n17:00\n60 мин.',
                style: TextStyle(
                    letterSpacing: 14,
                    height: 0,
                    fontSize: 55,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w100),
                children: <TextSpan>[
                  TextSpan(
                    text: '',
                    style: TextStyle(
                        letterSpacing: 14,
                        height: 0,
                        fontSize: 55,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              
              
              
            ),
        ],
        ),
            ),
    );
  }
}
