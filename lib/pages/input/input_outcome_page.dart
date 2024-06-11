import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputOutcomePage extends StatefulWidget {
  const InputOutcomePage({Key? key}) : super(key: key);

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
                        child: _textFormField(
                          textEditingController: _textEditingControllers[index],
                          onChanged: (value) {
                            _names[index] = value;
                          },
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: _numberTextFormField(
                          textEditingController: _numberEditingControllers[index],
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
              child: _textButton(
                onPressed: () {
                  setState(() {
                    _textEditingControllers.add(TextEditingController());
                    _numberEditingControllers.add(TextEditingController());
                    _names.add('');
                    _amounts.add(0);
                  });
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: _resultButton(
                onPressed: () {
                  _calculateTotalAmount();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '合計金額: $_totalAmount 円',
                style: TextStyle(
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

  Widget _textFormField({required TextEditingController textEditingController, required Function(String) onChanged}) {
    return TextFormField(
      controller: textEditingController,
      maxLength: null,
      onChanged: onChanged,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _numberTextFormField({required TextEditingController textEditingController, required Function(String) onChanged}) {
    return TextFormField(
      controller: textEditingController,
      maxLength: null,
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _textButton({required void Function() onPressed}) {
    return TextButton(
      onPressed: onPressed,
      child: const Text(
        "+",
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }
}

Widget _resultButton({required void Function() onPressed}) {
  return TextButton(
    onPressed: onPressed,
    child: const Text(
      "完了",
      style: TextStyle(
        fontSize: 30,
      ),
    ),
  );
}
