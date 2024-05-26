import 'package:flutter/material.dart';

class InputOutcomePage extends StatefulWidget {
  const InputOutcomePage({Key? key}) : super(key: key);

  @override
  _InputOutcomePageState createState() => _InputOutcomePageState();
}

class _InputOutcomePageState extends State<InputOutcomePage> {
  List<TextEditingController> _textEditingControllers = [];

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
              itemCount: (_textEditingControllers.length / 2).ceil(),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: _textFormField(
                          textEditingController: _textEditingControllers[index * 2],
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: _textFormField(
                          textEditingController: _textEditingControllers[index * 2 + 1],
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
                    _textEditingControllers.add(TextEditingController());
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFormField({required TextEditingController textEditingController}) {
    return TextFormField(
      controller: textEditingController,
      maxLength: null,
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
      child: const Text("+"),
    );
  }
}
