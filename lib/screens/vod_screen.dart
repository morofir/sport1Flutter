import 'package:flutter/material.dart';

class VodScreen extends StatelessWidget {
  const VodScreen({Key? key}) : super(key: key);
  static const routeName = '/vod';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VOD"),
      ),
      body: const Text("VOD"),
    );
  }
}
