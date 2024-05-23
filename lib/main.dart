import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'Screens/schedule.dart';
import 'Screens/aboutstudios.dart';
import 'Screens/notifications.dart';
import 'Screens/more.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _App();
}

class _App extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PersistentTabView(
        tabs: [
          PersistentTabConfig(
              screen: const HomeScreen(),
              item: ItemConfig(
                  activeForegroundColor: Colors.black,
                  icon: const Icon(Icons.home_filled),
                  title: "Главная")),
          PersistentTabConfig(
              screen: Schedule(),
              item: ItemConfig(
                  activeForegroundColor: Colors.black,
                  icon: const Icon(Icons.directions_run),
                  title: "Мои занятия")),
          PersistentTabConfig(
              screen: const AboutStudios(),
              item: ItemConfig(
                  activeForegroundColor: Colors.black,
                  icon: const Icon(Icons.business),
                  title: "О студии")),
          PersistentTabConfig(
              screen: Notifications(),
              item: ItemConfig(
                  activeForegroundColor: Colors.black,
                  icon: const Icon(Icons.notifications_outlined),
                  title: "Уведомления")),
          PersistentTabConfig(
              screen: More(),
              item: ItemConfig(
                  activeForegroundColor: Colors.black,
                  icon: const Icon(Icons.format_list_bulleted),
                  title: "Ещё")),
        ],
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
        ),
      ),
    );
  }
}
