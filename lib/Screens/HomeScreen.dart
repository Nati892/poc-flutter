import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int x = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Text("home screen"),
      TextButton(
          onPressed:(() =>  setState(() {
            x++;
          })),
          child: Text('$x'))
    ]));
  }
}
