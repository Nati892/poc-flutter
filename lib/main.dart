import 'package:flutter/material.dart';
import 'package:poc_flutter/Navigation/navdata.dart';
import 'package:poc_flutter/Screens/PostScreen.dart';

import 'Navigation/navigatorScreens.dart';

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
        initialRoute: "/",
        routes: getAppRouts(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ));
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  NavData myNaver = NavData.firstInit("/");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Row(children: [
          TextButton(
              onPressed: () {
                Navigator.pop(context); //close drawer
                Navigator.pushNamed(context, '/ChatScreen');
              },
              child: Text("navigate"))
        ]),
      ),
      appBar: AppBar(
        title: const Text('Main scaffold'),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: myNaver.currentScreenIndex,
        children: getMainAppScreens(),
      ),
      bottomNavigationBar: BottomNavBar(
          navData: myNaver, changeScreenCallback: changeScreenIndex),
    );
  }

  void changeScreenIndex(int newVal) {
    if (newVal != 2) {
      setState(() {
        myNaver.currentScreenIndex = newVal;
      });
    } else {
      navToCamera();
    }
  }

  void navToCamera() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PostScreenImagePicker()));
  }

  void NavBarNavigate(int newRoute) {
    setState(() {
      myNaver.ChangeScreenIndex(newRoute);
    });
  }
}
