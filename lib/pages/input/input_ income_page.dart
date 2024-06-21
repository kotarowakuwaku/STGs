import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:save_towards_your_goal_simulator/pages/input/input_outcome_page.dart';

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

  void calculateResult() {
    if (incomeController.text.isNotEmpty && timeController.text.isNotEmpty) {
      final int incomeValue = int.parse(incomeController.text);
      final int timeValue = int.parse(timeController.text);
      setState(() {
        result = incomeValue * timeValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF68B4),
        centerTitle: true,
        title: Image.asset(
          'images/stgs.jpeg',
          height: 50, // Adjust the height of the image
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: const Text(
              "収入",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 53,
                  fontWeight: FontWeight.bold,
                backgroundColor: Color(0xFF008001),
              ),
            ),
          ),
          (incomeController.text.isNotEmpty && timeController.text.isNotEmpty)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF008001)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          '$result',
                          style: const TextStyle(
                            fontSize: 27,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      '円',
                      style: TextStyle(
                        fontSize: 27,
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF008001)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          '                 ',
                          style: TextStyle(
                            fontSize: 27,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      '円',
                      style: TextStyle(
                        fontSize: 27,
                      ),
                    ),
                  ],
                ),
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 50),
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF45B1E1)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  // Optional: Add some padding around the text
                  child: Text(
                    '時給',
                    style: TextStyle(
                      fontSize: 27,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                const SizedBox(width: 50),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF45B1E1)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF45B1E1)),
                      ),
                    ),
                    controller: incomeController,
                    onChanged: (value) {
                      setState(() {
                        income = value;
                      });
                      calculateResult();
                    },
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  '円',
                  style: TextStyle(
                    fontSize: 27,
                  ),
                ),
                const SizedBox(width: 50),
              ],
            ),
          ),
          const Center(
            child: Text("×", style: TextStyle(fontSize: 27)),
          ),
          Row(
            children: [
              const SizedBox(width: 50),
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFFFBF00)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  // Optional: Add some padding around the text
                  child: Text(
                    '時間',
                    style: TextStyle(
                      fontSize: 27,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                const SizedBox(width: 50),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFFFBF00)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFFFBF00)),
                      ),
                    ),
                    controller: timeController,
                    onChanged: (value) {
                      setState(() {
                        time = value;
                      });
                      calculateResult();
                    },
                  ),
                ),
                const SizedBox(width: 10),
                const Text('時間',
                    style: TextStyle(
                      fontSize: 24,
                    )),
                const SizedBox(width: 50),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InputOutcomePage(incomeData: result),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: const Color(0xFF02FDFF),
              backgroundColor: const Color(0xFFE6F6FB),
              side: const BorderSide(color: Color(0xFF5395D1), width: 1),
            ),
            child: const Text('支出入力へ'),
          ),
        ],
      ),
    );
  }
}
