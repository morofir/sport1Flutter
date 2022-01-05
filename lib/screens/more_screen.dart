import 'package:flutter/material.dart';
import 'package:sport1/widgets/more_list.dart';
import 'package:sport1/widgets/searchbar/search_bar.dart';
import 'package:sport1/widgets/searchbar/search_result.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);
  static const routeName = '/more';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(height: 600, child: SearchResult(),),
        // Container(height: 60, child: SearchBar()),
        // MoreList(),
        Expanded(
          child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                  color: Colors.grey.shade200,
                  height: 80,
                  child: Image.asset('assets/images/bymoveo.png'))),
        ),
      ],
    ));
  }
}
