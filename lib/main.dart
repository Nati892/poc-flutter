import 'package:flutter/material.dart';
import 'package:poc_flutter/Navigation/Screens/ExploreScreen.dart';
import 'package:poc_flutter/Navigation/Screens/HomeScreen.dart';
import 'package:poc_flutter/Navigation/Screens/MyZoneScreen.dart';
import 'package:poc_flutter/Navigation/Screens/NotifScreen.dart';
import 'package:poc_flutter/Navigation/Screens/PostScreen.dart';

import 'Navigation/Screens/ChatScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final Screens = [
    const HomeScreen(),
    const MyZoneScreen(),
    const PostScreen(),
    const ExploreScreen(),
    const NotifScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Row(children: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);//close drawer
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatScreen()));
              },
              child: Text("navigate"))
        ]),
      ),
      appBar: AppBar(
        title: const Text('Main scaffold'),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: currentIndex,
        children: Screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: cahngeScreenIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My zone'),
          BottomNavigationBarItem(icon: Icon(Icons.upload), label: 'Post'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'notifications'),
        ],
      ),
    );
  }

  void cahngeScreenIndex(int newVal) {
    setState(() {
      currentIndex = newVal;
    });
  }
}