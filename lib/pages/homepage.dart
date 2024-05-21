import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('STGs Simulator'),
      ),
      body: const Form(
        child: Column(children: [
          Text('収入'),
          TextField(
            decoration: InputDecoration(
              labelText: '収入を入力してください',
            ),
          ),
          Text('支出'),
          TextField(
            decoration: InputDecoration(
              labelText: '支出を入力してください',
            ),
          ),
          Text('貯金'),
          TextField(
            decoration: InputDecoration(
              labelText: '貯金を入力してください',
            ),
          ),
        ]),
      ),
    );
  }
}
