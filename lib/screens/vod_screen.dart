import 'package:flutter/material.dart';
import 'package:sport1/screens/inside_screen.dart';
import 'package:sport1/screens/onboarding_screen.dart';

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
                  builder: (ctx) => OnbordingScreen(),
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
