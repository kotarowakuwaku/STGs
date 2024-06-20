import 'package:flutter/material.dart';
import 'package:save_towards_your_goal_simulator/pages/input/input_%20income_page.dart';
import 'package:save_towards_your_goal_simulator/pages/title_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TitlePage(),
    );
  }
}
