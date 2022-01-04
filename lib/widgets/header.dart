import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

AppBar header(context) {
  return AppBar(
    backgroundColor: Colors.black,
    leading: IconButton(
      icon: Image.asset('assets/images/group3.png'),
      onPressed: () async {
        print('clear SharedPreferences');
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.clear();
      },
    ),
    title: Image.asset('assets/images/sport1small.png',
        fit: BoxFit.fill, width: 85.0, height: 23.0),
    actions: <Widget>[
      Navigator.canPop(context) //show only if i can pop back (navigation)
          ? IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
            )
          : const SizedBox.shrink(),
    ],
  );
}
