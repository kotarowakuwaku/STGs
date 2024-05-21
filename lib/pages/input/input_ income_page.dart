import 'package:flutter/material.dart';
import 'package:save_towards_your_goal_simulator/pages/input/input_spending_page.dart';

class InputIncomePage extends StatelessWidget {
  const InputIncomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController incomeController = TextEditingController();
    final TextEditingController timeController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('STGs Simulator'),
      ),
      body: Column(children: [
        const Text('合計'),
        const Text('1000円'),
        const Text('時給'),
        TextField(
          decoration: const InputDecoration(
            labelText: '時給を入力してください',
          ),
          controller: incomeController,
        ),
        const Text('時間'),
        TextField(
          decoration: const InputDecoration(
            labelText: '時間を入力してください',
          ),
          controller: timeController,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const InputSpendingPage()),
              );
            },
            child: const Text('支出入力へ')),
      ]),
    );
  }
}
