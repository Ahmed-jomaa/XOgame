import 'package:flutter/material.dart';
import './home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
        primaryColor: const Color.fromARGB(255, 31, 1, 54),
        shadowColor: const Color.fromARGB(255, 91, 58, 116),
        splashColor: const Color.fromARGB(255, 131, 68, 177),
      ),
      home: const HomePage(),
    );
  }
}
