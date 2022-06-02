import 'package:flutter/material.dart';
import '../Screens/ChatScreen.dart';
import '../main.dart';

Map<String, Widget Function(BuildContext)> getAppRouts() {
  return {
    '/': (context) => const MainPage(),
    '/ChatScreen': (context) => const ChatScreen(),
  };
}
