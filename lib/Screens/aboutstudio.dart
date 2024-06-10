part of '../screens.dart';

class AboutStudios extends StatefulWidget {
  const AboutStudios({super.key});

  @override
  State<AboutStudios> createState() => _AboutStudiosState();
}

class _AboutStudiosState extends State<AboutStudios> {
  final List<bool> _selectedWeather = <bool>[true, false];
  bool isAlertDialog = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120.0),
          child: AppBar(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Column(
                children: [
                  Stack(
                    children: [
                      const Center(
                        heightFactor: 0.7,
                        child: Column(
                          children: [
                            Text('О студии',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                            Text(' Тюмень',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 223, 223, 223))),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 34,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 16, 16, 16),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: ToggleButtons(
                              constraints: BoxConstraints(
                                  minWidth:
                                      (MediaQuery.of(context).size.width - 35) /
                                          9),
                              isSelected: _selectedWeather,
                              onPressed: (int index) {
                                setState(() {
                                  for (int i = 0;
                                      i < _selectedWeather.length;
                                      i++) {
                                    _selectedWeather[i] = !_selectedWeather[i];
                                  }
                                });
                              },
                              color: Colors.white,
                              selectedColor: Colors.white,
                              fillColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              renderBorder: false,
                              children: <Widget>[
                                Container(
                                    decoration: BoxDecoration(
                                        color: _selectedWeather[0]
                                            ? Colors.black
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8)),
                                    height: 32,
                                    width: 38,
                                    child: const Icon(
                                        Icons.format_list_bulleted,
                                        size: 25)),
                                Container(
                                    decoration: BoxDecoration(
                                        color: _selectedWeather[1]
                                            ? Colors.black
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8)),
                                    height: 32,
                                    width: 38,
                                    child: const Icon(Icons.place_outlined,
                                        size: 25)),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20)
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 5), // отсуп между кнопкой и текстом
                  Container(
                    height: 54,
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, bottom: 15),
                    child: TextField(
                      cursorColor: const Color.fromARGB(255, 31, 31, 31),
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      decoration: InputDecoration(
                        focusColor: Colors.black,
                        hintText: 'Поиск',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(127, 0, 0, 0)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.white)),
                        contentPadding: const EdgeInsets.only(left: 16.0),
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        filled: true,
                        suffixStyle: const TextStyle(
                            color: Colors.black), // Введенный текст
                        suffixIcon: const Icon(Icons.search,
                            color: Color.fromARGB(127, 0, 0, 0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: InkWell(
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
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            "THE FLEX | Тюмень | Горького",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Тюмень, ул. Максима Горького, 44к2",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                  height: 20,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: Color.fromARGB(255, 0, 167, 6),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.home,
                                        color: Color.fromARGB(123, 0, 0, 0),
                                        size: 16,
                                      ),
                                      Text(
                                        'МОЯ СТУДИЯ',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              206, 255, 255, 255),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ]),
                    Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Color.fromARGB(153, 0, 0, 0),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 0)
          ],
        ));
  }
}
