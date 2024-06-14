import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


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
        body: Center(
          child: CupertinoPickerExample(),
        ),
      ),
    );
  }
}

class CupertinoPickerExample extends StatefulWidget {
  const CupertinoPickerExample({super.key});

  @override
  State<CupertinoPickerExample> createState() => _CupertinoPickerExampleState();
}
final _textFieldController = TextEditingController();
final _IntlPhoneController = TextEditingController();

class _CupertinoPickerExampleState extends State<CupertinoPickerExample> {
  int _selectedFruit = 0;
  double _kItemExtent = 32.0;
  List<String> _fruitNames = <String>[
    'Вопрос',
    'Жалоба',
  ];


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
@override
Widget build(BuildContext context) {
  return CupertinoPageScaffold(
    navigationBar: const CupertinoNavigationBar(
      middle: Text('Нам важно ваше мнение', style: TextStyle(fontSize: 13, color: Color.fromARGB(255, 32, 32, 32), fontWeight: FontWeight.w400), ),
    ),
    child: DefaultTextStyle(
      style: TextStyle(
        color: CupertinoColors.label.resolveFrom(context),
        fontSize: 22.0,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 30), 
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: <Widget>[
                DefaultTextStyle(
                  style: TextStyle(color: Color.fromARGB(255, 19, 19, 19)), 
                  child: Text('  Тема обращения:  ', style: TextStyle(fontSize: 18),),
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
                      children:
                          List<Widget>.generate(_fruitNames.length, (int index) {
                        return Center(child: Text(_fruitNames[index]));
                      }),
                    ),
                  ),
                  child: DefaultTextStyle(
                    style: TextStyle(color: Color.fromARGB(255, 29, 29, 29)), 
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
SizedBox(height: 10),
TextField(
  controller: _textFieldController,
  decoration: InputDecoration(
    labelText: 'Начните набирать текст',
    labelStyle: TextStyle(color: Colors.grey), 
    
    
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 173, 173, 173)), 
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 173, 173, 173)), 
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey), 
    ),
  ),
  maxLines: 8,
  onChanged: (text) {

  },
  
),
SizedBox(height: 10,),


  IntlPhoneField(
    controller: _IntlPhoneController,
    searchText: 'Поиск стран',
    disableLengthCheck: true,
    decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
        ),
    ),
    initialCountryCode: 'RU',
    onChanged: (phone) {
    },
),
  Divider(
      thickness: 1.0,
      color: Color.fromARGB(255, 138, 138, 138),
      
    ), 
    SizedBox(height: 12),
  Column(
  children: [
    Align(
      alignment: Alignment.centerLeft,
      child: Text("  fololeevamk@icloud.com", style: TextStyle(fontSize: 19),),
    ),
  ],
),
SizedBox(height: 12),
Divider(
  thickness: 1.0,
      color: Color.fromARGB(255, 138, 138, 138),
),
SizedBox(height: 10),

TextButton(
  style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 0, 0, 0)),
    textStyle: MaterialStateProperty.all<TextStyle>(
      TextStyle(fontSize: 20), 
    ),
    padding: MaterialStateProperty.all<EdgeInsets>(
      EdgeInsets.symmetric(horizontal: 120, vertical: 20), 
    ),
    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 255, 216, 87)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), 
        side: BorderSide.none, 
      ),
    ),
  ),
onPressed: () {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Text("Отправить?"),
      actions: [
        CupertinoDialogAction(child: Text("Да"), onPressed: () {
          _textFieldController.clear();
          _IntlPhoneController.clear();
          Navigator.pop(context);
        },),
        CupertinoDialogAction(child: Text("Нет"), onPressed: () {
          Navigator.pop(context);
        },)
      ],
    ),
  );
},
  child: Text('Отправить'),
),
        ],
        
        
      ),
    ),
  );
}
}
  
  
