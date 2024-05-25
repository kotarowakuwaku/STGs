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
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
          ),
          child: Text(
            "収入",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        const Text(
          '10,000円',
          style: TextStyle(
            fontSize: 30,
          )
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          child: Row(
              children: [
                SizedBox(width: 50),
                Text('時給'),
                SizedBox(width: 50), // 適切な間隔を追加するために使用することもできます
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                    ),
                    controller: incomeController,
                  ),
                ),
                SizedBox(width: 10),
                Text('円'),
                SizedBox(width: 50),
              ],
            ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          child: Row(
            children: [
              SizedBox(width: 50),
              Text('時間'),
              SizedBox(width: 50), // 適切な間隔を追加するために使用することもできます
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                  ),
                  controller: timeController,
                ),
              ),
              SizedBox(width: 10),
              Text('h'),
              SizedBox(width: 50),
            ],
          ),
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
