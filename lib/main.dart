
import 'package:flutter/material.dart';


import 'form_screen.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Form',
      theme: ThemeData(
        backgroundColor: Colors.blue.shade900,
        ),


      home: FormScreen(),
    );
  }
}