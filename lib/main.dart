import 'package:flutter/material.dart';
// import 'dashboard.dart';
import 'navbar.dart';
import 'home.dart';
void main() =>  runApp(MyApp());

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Incleair',
      theme: ThemeData(
        primaryColor: new Color(0xff622F74),
      ),
      home: HomePage(),
    );
  }
}