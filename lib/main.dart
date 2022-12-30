import 'package:flutter/material.dart';
import 'package:sharecipe/core/widgets/main_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Sharecipe',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(),
    home: MainScreen(),
  ));
}
