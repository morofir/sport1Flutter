import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);
  static const routeName = '/scores';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("ScoreScreen"),
    );
  }
}
