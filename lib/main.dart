import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'screens.dart';
import 'Screens/home_screen.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

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
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 2));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PersistentTabView(
        stateManagement: false,
        tabs: [
          PersistentTabConfig(
              screen: const HomeScreen(),
              item: ItemConfig(
                  activeForegroundColor: Colors.black,
                  icon: const Icon(Icons.home_filled),
                  title: "Главная")),
          PersistentTabConfig(
              screen: MySchedule(),
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
              screen: const Notifications(),
              item: ItemConfig(
                  activeForegroundColor: Colors.black,
                  icon: const Icon(Icons.notifications_outlined),
                  title: "Уведомления")),
          PersistentTabConfig(
              screen: const More(),
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
