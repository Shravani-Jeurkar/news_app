import 'package:flutter/material.dart';
import 'package:news_app/views/home.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: creme,
          centerTitle: true,
        ),
        primaryColor: dBlue,
      ),
      home: const Home(),
    );
  }
}
