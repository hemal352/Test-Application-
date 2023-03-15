import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyPage()));
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final Random _random = Random();

  Color _color = const Color(0xFFFFFFFF);

  void changeColor() {
    setState(() {
      _color = Color.fromARGB(
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  "Hemal Gunasinghe",
                ),
                accountEmail: Text("hemal.gunasingha0105@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  radius: 35.0,
                  backgroundImage: NetworkImage(
                      'https://media.licdn.com/dms/image/D5603AQGHMenhckMLlg/profile-displayphoto-shrink_200_200/0/1672342317651?e=1684368000&v=beta&t=h-BFi1cFh2AuYquV3JAj6SHyGO-YnYuqzeR5qTXv5JE'),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
            title: const Text('Test Application'),
            centerTitle: true,
            backgroundColor: Colors.blueAccent,
            actions: [
              PopupMenuButton(itemBuilder: (context) {
                return [
                  const PopupMenuItem<int>(
                    child: Text("menu Item 1"),
                  ),
                  const PopupMenuItem<int>(
                    child: Text("menu item 2"),
                  ),
                  const PopupMenuItem<int>(
                    child: Text("menu item 3"),
                  ),
                ];
              }),
            ]),
        body: InkWell(
          onTap: changeColor,
          child: Container(
            color: _color,
            child: const Center(
                child: Text('Hey There!!!',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30))),
          ),
        ));
  }
}
