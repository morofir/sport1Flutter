import 'package:flutter/material.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({Key? key}) : super(key: key);
  static const routeName = '/live';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("live"),
      ),
      body: const Text("live"),
    );
  }
}
