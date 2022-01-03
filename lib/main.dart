import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport1/screens/home_screen.dart';
import 'package:sport1/screens/inside_screen.dart';
import 'package:sport1/screens/tab_screen.dart';
import 'package:sport1/screens/vod_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //provider cleans old data automatically
    return ChangeNotifierProvider(
      //optional value without context, then value:...
      create: (_) => null,
      // create: (ctx) => CategoriesProvider(), //instance of a categories provider
      //the listeners will build the app of something changes
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          fontFamily: 'NarkissBlock',
          primaryColor: Colors.black,
          secondaryHeaderColor: Colors.black,
          primarySwatch: Colors.grey,
        ),
        home: const TabsScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          VodScreen.routeName: (ctx) => const VodScreen(),
          InsideScreen.routeName: (ctx) => const InsideScreen(),
        },
      ),
    );
  }
}
