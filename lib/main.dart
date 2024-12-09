import 'package:flutter/material.dart';
import 'package:friviaa/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frivia',
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color.fromRGBO(31, 31, 31, 1),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(68, 138, 255, 1)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }

}
