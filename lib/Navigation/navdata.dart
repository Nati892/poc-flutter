import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:path/path.dart';
import 'package:poc_flutter/Screens/ChatScreen.dart';
import 'package:poc_flutter/main.dart';

import '../Screens/ExploreScreen.dart';
import '../Screens/HomeScreen.dart';
import '../Screens/MyZoneScreen.dart';
import '../Screens/NotifScreen.dart';
import '../Screens/PostScreen.dart';

class NavData {
  String currentRoute = "";
  int currentScreenIndex = 0;

  NavData.firstInit(String startScreen) {
    currentRoute = startScreen;
  }

  void ChangeScreenIndex(int newIndex) {
    this.currentScreenIndex = newIndex;

    print(currentScreenIndex);
  }
}

class BottomNavBar extends StatefulWidget {
  final NavData navData;
  final Function changeScreenCallback;

  const BottomNavBar(
      {Key? key, required this.navData, required this.changeScreenCallback})
      : super(key: key);

  @override
  State<BottomNavBar> createState() =>
      _BottomNavBarState(this.navData, this.changeScreenCallback);
}

class _BottomNavBarState extends State<BottomNavBar> {
  NavData myNaver;
  Function changeScreenCallback;
  _BottomNavBarState(this.myNaver, this.changeScreenCallback);

  // @override
  // Widget build(BuildContext context) {
  //   return BottomNavigationBar(
  //     type: BottomNavigationBarType.fixed,
  //     currentIndex: myNaver.currentScreenIndex,
  //     onTap: (newScr) => setState(() {
  //       changeScreenCallback(newScr);
  //     }),
  //     items: getNavBarItems(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: myNaver.currentScreenIndex,
      onTap: (newScr) => 
        changeScreenCallback(newScr)
      ,
      items: getNavBarItems(),
    );
  }





}

List<BottomNavigationBarItem> getNavBarItems() {
  return const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My zone'),
    BottomNavigationBarItem(icon: Icon(Icons.upload), label: 'Post'),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'explore'),
    BottomNavigationBarItem(
        icon: Icon(Icons.notifications), label: 'notifications')
  ];
}

List<StatefulWidget> getMainAppScreens() {
  return const [
    const HomeScreen(),
    const MyZoneScreen(),
    const PostScreenImagePicker(),
    const ExploreScreen(),
    const NotifScreen()
  ];
}



