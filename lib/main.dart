import 'package:flutter/material.dart';
import 'my_home_page.dart';
import 'Theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jota',
      theme: ThemeData(accentColor: primaryColor, fontFamily: 'Montserrat'),
      home: Scaffold(body: MyHomePage(title: 'João Pedro Coutinho')),
    );
  }
}