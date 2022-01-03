import 'package:flutter/material.dart';
import 'package:sport1/widgets/more_list.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);
  static const routeName = '/more';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        // SearchBar(), TODO
        MoreList(),
      ],
    ));
  }
}
