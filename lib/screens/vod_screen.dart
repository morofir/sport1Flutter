import 'package:flutter/material.dart';
import 'package:sport1/screens/inside_screen.dart';

class VodScreen extends StatelessWidget {
  const VodScreen({Key? key}) : super(key: key);
  static const routeName = '/vod';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("VOD"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => const InsideScreen(),
                ));
              },
              child: const Text('Inside Screen'),
            )
          ],
        ),
      ),
    );
  }
}
