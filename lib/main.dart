import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/pages/home_page.dart';

void main() async{

  // start hive
  await Hive.initFlutter();

  // open a box
  var box = await Hive.openBox('mybox');

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

