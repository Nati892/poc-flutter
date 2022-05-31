import 'package:flutter/material.dart';

class MainNavigationBar extends StatefulWidget {
  final String some_param;
  final Function someFunc;
  const MainNavigationBar(
      {Key? key, required this.some_param, required this.someFunc})
      : super(key: key);

  @override
  State<MainNavigationBar> createState() => _MainNavigationBarState();
}

class _MainNavigationBarState extends State<MainNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Center(child: TextButton(child: Text("press me"),onPressed: () => {widget.someFunc(4)}));
  }
}
