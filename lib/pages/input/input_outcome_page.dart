import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../result_page.dart';

class InputOutcomePage extends StatefulWidget {
  final int incomeData;

  InputOutcomePage({Key? key, required this.incomeData}) : super(key: key);

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
        title: const Text('STGs Simulator'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
              ),
              child: Text(
                "支出",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '収入: ${widget.incomeData} 円',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('名称'),
                Text(''),
                Text('金額'),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _textEditingControllers.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                    ],
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.topRight,
              child: _buildAddRowButton(),
            ),
            Align(
              alignment: Alignment.center,
              child: _buildResultButton(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '合計金額: $_totalAmount 円',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField({required TextEditingController controller, required Function(String) onChanged}) {
    return TextFormField(
      controller: controller,
      maxLength: null,
      onChanged: onChanged,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildNumberFormField({required TextEditingController controller, required Function(String) onChanged}) {
    return TextFormField(
      controller: controller,
      maxLength: null,
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
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
      child: const Text(
        "+",
        style: TextStyle(fontSize: 30),
      ),
    );
  }

  Widget _buildResultButton() {
    return TextButton(
      onPressed: () {
        _calculateTotalAmount();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(outcomeData: _totalAmount, incomeData: widget.incomeData),
          ),
        );
      },
      child: const Text(
        "完了",
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
