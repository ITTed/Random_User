import 'package:flutter/material.dart';
import 'package:randomuser_app/screens/user_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: MyHomePage(
        title: 'Randomiser',
      ),
    );
  }
}
