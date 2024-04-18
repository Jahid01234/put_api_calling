import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PUT Api Calling",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
