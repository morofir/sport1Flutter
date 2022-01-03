import 'package:flutter/material.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({Key? key}) : super(key: key);
  static const routeName = '/live';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text("live"),
    );
  }
}
