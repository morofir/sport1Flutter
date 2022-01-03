import 'package:flutter/material.dart';
import 'package:sport1/widgets/header.dart';

class InsideScreen extends StatelessWidget {
  const InsideScreen({Key? key}) : super(key: key);
  static const routeName = '/inside';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context),
      body: const Center(child: Text("Inside Screen")),
    );
  }
}
