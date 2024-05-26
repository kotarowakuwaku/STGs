import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:save_towards_your_goal_simulator/pages/input/input_spending_page.dart';

class InputIncomePage extends StatefulWidget {
  const InputIncomePage({Key? key}) : super(key: key);

  @override
  _InputIncomePageState createState() => _InputIncomePageState();
}

class _InputIncomePageState extends State<InputIncomePage> {
  final TextEditingController incomeController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  String income = '0';
  String time = '0';
  int result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('STGs Simulator'),
      ),
      body: Column(
        children: [
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
          (incomeController.text != '' && timeController.text != '')?Text((int.parse(incomeController.text) * int.parse(timeController.text)).toString() + '円'):Text(''),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            child: Row(
              children: [
                SizedBox(width: 50),
                Text('時給'),
                SizedBox(width: 50),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(),
                    controller: incomeController,
                    onChanged: (value){
                      setState(() {
                        income = value;
                      });
                    },
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
                SizedBox(width: 50),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(),
                    controller: timeController,
                    onChanged: (value){
                      setState(() {
                        time = value;
                      });
                    },
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
                  builder: (context) => const InputSpendingPage(),
                ),
              );
            },
            child: const Text('支出入力へ'),
          ),
        ],
      ),
    );
  }
}
