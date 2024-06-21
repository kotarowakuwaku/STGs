import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../result_page.dart';

class InputOutcomePage extends StatefulWidget {
  final int incomeData;

  const InputOutcomePage({Key? key, required this.incomeData})
      : super(key: key);

  @override
  _InputOutcomePageState createState() => _InputOutcomePageState();
}

class _InputOutcomePageState extends State<InputOutcomePage> {
  final List<TextEditingController> _textEditingControllers = [];
  final List<TextEditingController> _numberEditingControllers = [];
  final List<String> _names = [];
  final List<int> _amounts = [];
  int _totalAmount = 0;

  @override
  void initState() {
    super.initState();
    // Initialize with three rows
    for (int i = 0; i < 3; i++) {
      _textEditingControllers.add(TextEditingController());
      _numberEditingControllers.add(TextEditingController());
      _names.add('');
      _amounts.add(0);
    }
  }

  void _calculateTotalAmount() {
    setState(() {
      _totalAmount = _amounts.fold(0, (sum, item) => sum + item);
    });
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Text(
                "支出",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 53,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Color(0xFFFF0000),
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '名称',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(''),
                Text(
                  '金額',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _textEditingControllers.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildTextFormField(
                          controller: _textEditingControllers[index],
                          onChanged: (value) {
                            _names[index] = value;
                          },
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: _buildNumberFormField(
                          controller: _numberEditingControllers[index],
                          onChanged: (value) {
                            setState(() {
                              _amounts[index] = int.tryParse(value) ?? 0;
                              _calculateTotalAmount();
                            });
                          },
                        ),
                      ),
                      const Text(
                        "円",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.topRight,
              child: _buildAddRowButton(),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Text(
            //     '合計支出額: $_totalAmount 円',
            //     style: const TextStyle(
            //       fontSize: 24,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            Align(
              alignment: Alignment.center,
              child: _buildResultButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField(
      {required TextEditingController controller,
      required Function(String) onChanged}) {
    return TextFormField(
      controller: controller,
      maxLength: null,
      onChanged: onChanged,
      decoration: const InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFFBF00)),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFFBF00)),
        ),
      ),
    );
  }

  Widget _buildNumberFormField(
      {required TextEditingController controller,
      required Function(String) onChanged}) {
    return TextFormField(
      controller: controller,
      maxLength: null,
      onChanged: onChanged,
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
    );
  }

  Widget _buildAddRowButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          _textEditingControllers.add(TextEditingController());
          _numberEditingControllers.add(TextEditingController());
          _names.add('');
          _amounts.add(0);
        });
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        textStyle: const TextStyle(
          fontSize: 24,
        ),
        side: const BorderSide(color: Colors.red),
        shape: const CircleBorder(),
      ),
      child: const Text(
        "+",
      ),
    );
  }

  Widget _buildResultButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, bottom: 20.0), // Top margin
      child: TextButton(
        onPressed: () {
          _calculateTotalAmount();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultPage(
                  outcomeData: _totalAmount, incomeData: widget.incomeData),
            ),
          );
        },
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: const Color(0xFFFFFF00),
          textStyle: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          side: const BorderSide(color: Colors.black),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          padding: const EdgeInsets.all(25),
        ),
        child: const Text(
          "結果へ！！",
        ),
      ),
    );
  }
}
