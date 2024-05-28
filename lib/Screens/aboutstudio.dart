part of '../screens.dart';

class AboutStudios extends StatefulWidget {
  const AboutStudios({super.key});

  @override
  State<AboutStudios> createState() => _AboutStudiosState();
}

class _AboutStudiosState extends State<AboutStudios> {
  final List<bool> _selectedWeather = <bool>[true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                          Text('Тюмень    ',
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
                                  child: const Icon(Icons.format_list_bulleted,
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
                      hintStyle: const TextStyle(color: Colors.black),
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
                          color: Color.fromARGB(226, 0, 0, 0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
