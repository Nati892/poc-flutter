import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:poc_flutter/Screens/ChatScreen.dart';

class MyZoneScreen extends StatefulWidget {
  const MyZoneScreen({Key? key}) : super(key: key);

  @override
  State<MyZoneScreen> createState() => _MyZoneScreenState();
}

class _MyZoneScreenState extends State<MyZoneScreen> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: TextButton(
          child: Text("navigate"),
          onPressed: () => {
                Navigator.pushNamed(context,'/ChatScreen')
              }),
    );
  }
}
