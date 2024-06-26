import 'package:flutter/material.dart';

class FeedbackTF extends StatefulWidget {
  const FeedbackTF({super.key});

  @override
  State<FeedbackTF> createState() => _FeedbackTFState();
}

class _FeedbackTFState extends State<FeedbackTF> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          titleSpacing: -1,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: const Text('Обратная связь', style: TextStyle(fontSize: 20)),
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
        body: const Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 14.0),
              child: Center(
                child: Text(
                  'Нам важно Ваше мнение',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
            Align(alignment: Alignment.centerLeft, child: Text('  ')),
            TextField(
              decoration: InputDecoration(
                hintText: 'Начните набирать текст',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
