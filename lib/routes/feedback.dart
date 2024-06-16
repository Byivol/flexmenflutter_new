import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class FeedbackTF extends StatefulWidget {
  const FeedbackTF({super.key});

  @override
  State<FeedbackTF> createState() => _FeedbackTFState();
}

class _FeedbackTFState extends State<FeedbackTF> {
  final TextEditingController controller = TextEditingController();
  final _textFieldController = TextEditingController();
  final _IntlPhoneController = TextEditingController();
  final _controller = TextEditingController();
  int _selectedFruit = 0;
  double _kItemExtent = 32.0;
  List<String> _fruitNames = <String>[
    'Вопрос',
    'Жалоба',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Center(
        child: DefaultTextStyle(
            style: TextStyle(
              color: CupertinoColors.label.resolveFrom(context),
              fontSize: 22.0,
            ),
            child: Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      'Нам важно ваше мнение',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 32, 32, 32),
                          fontWeight: FontWeight.w400),
                    )),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: <Widget>[
                      DefaultTextStyle(
                        style:
                            TextStyle(color: Color.fromARGB(255, 19, 19, 19)),
                        child: Text(
                          '  Тема обращения:  ',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => _showDialog(
                          CupertinoPicker(
                            magnification: 1.22,
                            squeeze: 1.2,
                            useMagnifier: true,
                            itemExtent: _kItemExtent,
                            scrollController: FixedExtentScrollController(
                              initialItem: _selectedFruit,
                            ),
                            onSelectedItemChanged: (int selectedItem) {
                              setState(() {
                                _selectedFruit = selectedItem;
                              });
                            },
                            children: List<Widget>.generate(_fruitNames.length,
                                (int index) {
                              return Center(child: Text(_fruitNames[index]));
                            }),
                          ),
                        ),
                        child: DefaultTextStyle(
                          style:
                              TextStyle(color: Color.fromARGB(255, 29, 29, 29)),
                          child: Text(
                            _fruitNames[_selectedFruit],
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _textFieldController,
                  cursorColor: const Color.fromARGB(255, 31, 31, 31),
                  decoration: InputDecoration(
                    labelText: 'Начните набирать текст',
                    labelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(
                          width: 1.1,
                          color: Color.fromARGB(172, 173, 173, 173)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(
                          width: 1.1,
                          color: Color.fromARGB(172, 173, 173, 173)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(
                          width: 1.1,
                          color: Color.fromARGB(172, 173, 173, 173)),
                    ),
                  ),
                  maxLines: 8,
                  onChanged: (text) {},
                ),
                Transform.translate(
                  offset: Offset(-37, 0),
                  child: Transform.scale(
                    scale: 0.8,
                    child: IntlPhoneField(
                      controller: _IntlPhoneController,
                      searchText: 'Поиск стран',
                      disableLengthCheck: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      initialCountryCode: 'RU',
                      onChanged: (phone) {},
                      style: TextStyle(fontSize: 23),
                    ),
                  ),
                ),
                SizedBox(height: 0),
                TextField(
                  cursorColor: const Color.fromARGB(255, 31, 31, 31),
                  controller: _controller..text = 'fololeevamk@icloud.com',
                  onSubmitted: (String value) async {
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Ваша почта'),
                          content: Text(value),
                        );
                      },
                    );
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail_outline),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(
                          width: 1.2,
                          color: Color.fromARGB(172, 173, 173, 173)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(
                          width: 1.2,
                          color: Color.fromARGB(172, 173, 173, 173)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(
                          width: 1.2,
                          color: Color.fromARGB(172, 173, 173, 173)),
                    ),
                  ),
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 0, 0, 0)),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      TextStyle(fontSize: 20),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                    ),
                    backgroundColor: WidgetStateProperty.all<Color>(
                        Color.fromARGB(255, 255, 216, 87)),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide.none,
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (_IntlPhoneController.text == '' ||
                        _controller.text == '' ||
                        _textFieldController == '') {
                      IconSnackBar.show(
                        context,
                        snackBarType: SnackBarType.alert,
                        snackBarStyle: const SnackBarStyle(
                          maxLines: 1,
                        ),
                        label: 'Ошибка! Укажите данные',
                      );
                    } else {
                      showCupertinoDialog(
                        context: context,
                        useRootNavigator: false,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                          title: Text("Отправить?"),
                          actions: [
                            CupertinoDialogAction(
                              child: Text("Да",
                                  style: TextStyle(color: Colors.black)),
                              onPressed: () {
                                _textFieldController.clear();
                                _IntlPhoneController.clear();
                                _controller.clear();
                                Navigator.pop(context);
                                IconSnackBar.show(
                                  context,
                                  snackBarType: SnackBarType.success,
                                  snackBarStyle: const SnackBarStyle(
                                    maxLines: 1,
                                  ),
                                  label: 'Сообщение успешно отправлено!',
                                );
                              },
                            ),
                            CupertinoDialogAction(
                              child: Text("Нет",
                                  style: TextStyle(color: Colors.red)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      );
                    }
                  },
                  child: Text('Отправить'),
                ),
              ],
            )),
      ),
    );
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(left: 0.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}
