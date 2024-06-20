import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'input/input_ income_page.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF68B4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // アプリ内から画像を表示
            Image.asset(
              'images/stgs.jpeg',
              width: double.infinity,
            ),
            const SizedBox(height: 60), // Optional: Add some space between the image and the button
            TextButton(
              child: const Text('-スタート-'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.yellow,
                textStyle: const TextStyle(
                  fontSize: 24, // Text size
                ),
              ),

              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InputIncomePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
