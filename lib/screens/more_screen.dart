import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);
  static const routeName = '/more';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("more"),
      ),
      body: const Text("more"),
    );
  }
}
