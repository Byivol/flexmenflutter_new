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
    );
  }
}
