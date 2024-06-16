//Package
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:theflexmen/routes/account.dart';
import 'package:theflexmen/routes/feedback.dart';
import 'package:theflexmen/routes/schedule.dart';
import 'package:url_launcher/url_launcher.dart';

//Additional
import 'additional/checkmark.dart';
import 'package:theflexmen/additional/lessons.dart';
//Routes

//Screens
part 'Screens/more.dart';
part 'Screens/aboutstudio.dart';
part 'Screens/notifications.dart';
part 'Screens/myschedule.dart';

PersistentTabController persistentTabController =
    PersistentTabController(initialIndex: 0);

Lessons lessons = Lessons();
List<FitLesson> selectedFitLesson = [];

//Func
Future<void> makePhoneCall() async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: '89292615056',
  );
  await launchUrl(launchUri);
}
