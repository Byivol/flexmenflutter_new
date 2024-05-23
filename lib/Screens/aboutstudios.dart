import 'package:flutter/material.dart';

class AboutStudios extends StatefulWidget {
  const AboutStudios({super.key});

  @override
  State<AboutStudios> createState() => _AboutStudiosState();
}

class _AboutStudiosState extends State<AboutStudios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  titleSpacing: -1,
  backgroundColor: Colors.black,
  foregroundColor: Colors.white,
  title: const Text('О студии', style: TextStyle(fontSize: 20)),
  leadingWidth: 100,
  centerTitle: true,
      ),
      body: Container(
      margin: const EdgeInsets.only(right: 16.0),
      child: Row(
        children: [
          const SizedBox(width: 16.0),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Поиск',
                hintStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 16.0),
                fillColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
                filled: true,
                suffixIcon: const Icon(Icons.search, color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
          ),
        ],
      ),
    ),
    );

  }
}
