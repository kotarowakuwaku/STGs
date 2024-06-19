import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int outcomeData;
  final int incomeData;

  ResultPage({Key? key, required this.outcomeData, required this.incomeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('STGs Simulator'),
      ),
      body: Center(
        child: Text("リザルトページ $outcomeData $incomeData"),
      ),
    );
  }
}