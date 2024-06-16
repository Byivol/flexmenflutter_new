import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:theflexmen/screens.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:theflexmen/additional/checkmark.dart';

import 'package:theflexmen/routes/schedule.dart';
import 'package:theflexmen/routes/feedback.dart';
import 'package:theflexmen/routes/account.dart';
import 'package:theflexmen/routes/qrcode.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController controller = CarouselController();
  int _current = 0;
  final List<String> _imgList = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
  ];
  List<Image> imgListObj = [];
  @override
  void initState() {
    super.initState();
    for (var element in _imgList) {
      imgListObj.add(Image.asset(element));
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (Image element in imgListObj) {
      precacheImage(element.image, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: -1,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Center(
          child: RichText(
            overflow: TextOverflow.ellipsis,
            text: const TextSpan(
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              children: [
                TextSpan(
                    text: 'THE',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2,
                    )),
                TextSpan(
                  text: ' ',
                  style: TextStyle(fontSize: 25, letterSpacing: -2),
                ),
                TextSpan(
                    text: 'FLEX ',
                    style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 17,
                        fontWeight: FontWeight.w600)),
                TextSpan(
                    text: 'men | Тюмень',
                    style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 17,
                        fontWeight: FontWeight.w300)),
              ],
            ),
          ),
        ),
        elevation: 4.0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QrCode(),
                ),
              );
            },
            icon: const Icon(Icons.qr_code_scanner)),
        actions: [
          IconButton(
              onPressed: makePhoneCall,
              icon: const Icon(
                Icons.call,
                size: 26,
              )),
          IconButton(
              onPressed: () {
                pushWithNavBar(context,
                    MaterialPageRoute(builder: (context) => Notifications()));
              },
              icon: const Icon(
                Icons.notifications,
                size: 30,
              )),
        ],
      ),
      body: CheckMarkIndicator(
        child: SafeArea(
          child: ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        height: 300,
                        viewportFraction: 1,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                    items: _imgList
                        .map((item) => Center(
                            child: Image.asset(item,
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height)))
                        .toList(),
                  ),
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _imgList
                            .asMap()
                            .entries
                            .map((entry) => GestureDetector(
                                  onTap: () =>
                                      controller.animateToPage(entry.key),
                                  child: Container(
                                    width: 12.0,
                                    height: 12.0,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 4.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: (Theme.of(context).brightness ==
                                                    Brightness.dark
                                                ? Colors.white
                                                : Colors.black)
                                            .withOpacity(_current == entry.key
                                                ? 0.9
                                                : 0.4)),
                                  ),
                                ))
                            .toList(),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 8, left: 6, right: 6),
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: FloatingActionButton.extended(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        elevation: 0.3,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Schedule(),
                            ),
                          );
                        },
                        backgroundColor:
                            const Color.fromARGB(255, 255, 216, 87),
                        foregroundColor: Colors.black,
                        label: const Text('Расписание',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 20)),
                        icon: const Icon(Icons.assignment),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 8, left: 6, right: 6),
                height: MediaQuery.of(context).size.height * 0.06,
                color: Colors.white,
                child: Row(children: <Widget>[
                  Expanded(
                    child: FloatingActionButton.extended(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 0.1,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FeedbackTF(),
                          ),
                        );
                      },
                      backgroundColor: const Color.fromARGB(255, 255, 216, 87),
                      foregroundColor: Colors.black,
                      label: const Text(
                        'Обратная связь',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      icon: const Icon(Icons.sms_outlined),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: FloatingActionButton.extended(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 0.1,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Account(),
                          ),
                        );
                      },
                      backgroundColor: const Color.fromARGB(255, 255, 216, 87),
                      foregroundColor: Colors.black,
                      label: const Text('Личный кабинет',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      icon: const Icon(Icons.account_circle_rounded),
                    ),
                  ),
                ]),
              ),
              const Row(
                children: [Expanded(child: ExpansionTileListView())],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ExpansionTileListView extends StatelessWidget {
  const ExpansionTileListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ExpansionTile(
            initiallyExpanded: true,
            shape: const Border(
                top: BorderSide.none,
                bottom:
                    BorderSide(color: Color.fromARGB(122, 0, 0, 0), width: 0)),
            onExpansionChanged: (e) {},
            title: const Text("Ближайшие занятия:"),
            children: lessons.getLessonsForDate(DateTime.now()).toList()));
  }
}
