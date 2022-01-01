import 'package:flutter/material.dart';
import 'package:sport1/widgets/header.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header(context),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.black,
            brightness: Brightness.light,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.white,
            textTheme: Theme.of(context).textTheme.copyWith(
                  caption: const TextStyle(color: Colors.red),
                ),
          ), // sets the inactive color of the `BottomNavigationBar`

          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: 0, // this will be set when a new tab is tapped
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.menu, color: Colors.grey),
                label: 'More',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_sharp, color: Colors.grey),
                label: 'Scores',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_fill, color: Colors.grey),
                label: 'Vod',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.score_rounded, color: Colors.grey),
                label: 'Broadcast',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.grey),
                label: 'Home',
              ),
            ],
          ),
        ));
  }
}
