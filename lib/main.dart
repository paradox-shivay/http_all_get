import 'package:flutter/material.dart';
import 'package:http_youtube/Home.dart';
import 'package:http_youtube/Home2.dart';
import 'package:http_youtube/Home4.dart';
import 'package:http_youtube/home3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Home2(),
    );
  }
}

