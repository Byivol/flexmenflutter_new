import 'package:flutter/material.dart';

class AboutStudios extends StatefulWidget {
  const AboutStudios({super.key});

  @override
  State<AboutStudios> createState() => _AboutStudiosState();
}

class _AboutStudiosState extends State<AboutStudios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: PreferredSize(
  preferredSize: Size.fromHeight(120.0),
  child: Stack(
    children: [
      AppBar(
        titleSpacing: 25,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(top: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('О студии', style: TextStyle(fontSize: 20),),
              SizedBox(height: 2), 
              Text('Тюмень', style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 223, 223, 223)),),
            ],
          ),
        ),
        leadingWidth: 100,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.format_list_bulleted, color: Colors.white),
            onPressed: () {
              
            },
          ),
          IconButton(
            icon: Icon(Icons.place_outlined),
            onPressed: () {

            },
          ),
        ],
      ),
      Positioned(
        bottom: 15,
        left: 20,
        right: 20,
        child: SizedBox(
          width: 35, 
          height: 35,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Поиск',
              hintStyle: const TextStyle(color: Color.fromARGB(226, 0, 0, 0)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: const EdgeInsets.only(left: 16.0),
              fillColor: Color.fromARGB(255, 255, 255, 255),
              filled: true,
              suffixIcon: const Icon(Icons.search, color: Color.fromARGB(226, 0, 0, 0)),
            ),
          ),
        ),   
      ),
    ],
  ),
),

body: Padding(
  padding: EdgeInsets.only(top: 15, left: 15),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("THE FLEX MEN|Тюмень|Фабричная", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
      SizedBox(height:0), 
      Text("Тюмень, ул.Фабричная, 9", style: TextStyle(fontSize: 13, color: Color.fromARGB(178, 0, 0, 0)),),
      SizedBox(height: 2,),
      Text('моя студия',style: TextStyle(fontSize: 13, color: Color.fromARGB(178, 0, 0, 0)),),
      SizedBox(height: 1,),
      Divider(),
    ],
  ),

),

    );
    
  }
}
