import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class FeedbackTF extends StatefulWidget {
  const FeedbackTF({super.key});

  @override
  State<FeedbackTF> createState() => _FeedbackTFState();
}

class _FeedbackTFState extends State<FeedbackTF> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
body: Column(
  children: [
    Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child: Center(
        child: Text(
          'Нам важно Ваше мнение',
          style: TextStyle(
            fontSize: 12,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    ),
    Divider(
      thickness: 1,
      color: Color.fromARGB(255, 172, 171, 171),
      height: 25,
    ),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Начните набирать текст',
          hintStyle: TextStyle(color: const Color.fromARGB(255, 124, 124, 124), fontSize: 17),
          border: InputBorder.none,
        ),
      ),
    ),
    Divider(
      thickness: 1,
      color: Color.fromARGB(255, 172, 171, 171),
      height: 100,
    ),
    InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                print(number.phoneNumber);
              },
              onInputValidated: (bool value) {
                print(value);
              },
              selectorConfig: SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                useBottomSheetSafeArea: true,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: TextStyle(color: Colors.black),
              initialValue: PhoneNumber(isoCode: 'RU'),
              textFieldController: controller,
              formatInput: true,
              keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
              inputBorder: OutlineInputBorder(),
              onSaved: (PhoneNumber number) {
                print('On Saved: $number');
              },
            ),
  ],
)
      ),
    );
  }
}