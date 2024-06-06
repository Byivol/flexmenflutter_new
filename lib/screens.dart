//Package
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:theflexmen/routes/schedule.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';

//Additional
import 'additional/checkmark.dart';
import 'package:theflexmen/additional/lessons.dart';
//Routes
import 'routes/feedback.dart';
import 'routes/account.dart';
import 'routes/lesson.dart';
import 'routes/qrcode.dart';

//Screens
part 'Screens/more.dart';
part 'Screens/aboutstudio.dart';
part 'Screens/notifications.dart';
part 'Screens/myschedule.dart';

List<Widget> selectedFitLesson = [];
