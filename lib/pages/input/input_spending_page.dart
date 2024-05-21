import 'package:flutter/material.dart';

class InputSpendingPage extends StatelessWidget {
  const InputSpendingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('STGs Simulator'),
      ),
      body: Form(
        child: Column(children: [
          const Text('支出を入力してください'),
          const Text('合計金額:1000円'),
          const Text('支出1'),
          Row(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '名前',
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: '金額',
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('決定'),
          ),
        ]),
      ),
    );
  }
}
