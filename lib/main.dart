import 'package:flutter/material.dart';
import 'package:todo/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      theme: ThemeData(
        primarySwatch:  Colors.yellow,
        scaffoldBackgroundColor: Colors.yellow.shade100,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.yellow,
        ),
        useMaterial3: true
      ),
      home: const HomePage(),
    );
  }
}

