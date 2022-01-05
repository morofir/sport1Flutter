import 'package:flutter/material.dart';
import 'package:sport1/screens/more_screen.dart';
import 'package:sport1/screens/scores_screen.dart';
import 'package:sport1/screens/vod_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/header.dart';
import 'broadcast_screen.dart';
import 'home_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;

  // List<Widget> tabPages = [ FUTURE USE FOR WIDGETS :
  // https://stackoverflow.com/questions/45235570/how-to-use-bottomnavigationbar-with-navigator

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const List<Widget> _pages = <Widget>[
      //list of icons future be pages
      MoreScreen(),
      BroadScreen(),
      VodScreen(),
      ScoreScreen(),
      HomeScreen(),
    ];
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      appBar: header(context),
      body: Center(child: _pages.elementAt(_selectedIndex)),
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
          unselectedItemColor: Colors.white,
          selectedIconTheme:
              IconThemeData(color: Color.fromRGBO(2, 247, 132, 1)),

          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              activeIcon:
                  Icon(Icons.menu, color: Color.fromRGBO(2, 247, 132, 1)),
              icon: Icon(Icons.menu, color: Colors.grey),
              label: 'עוד',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/broadcasts.svg',
                  width: 18.0,
                  height: 18.0,
                  color: _selectedIndex == 1
                      ? const Color.fromRGBO(2, 247, 132, 1)
                      : Colors.grey),
              label: 'שידורים',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/vod1.svg',
                  height: 15.0,
                  width: 16.0,
                  allowDrawingOutsideViewBox: true,
                  color: _selectedIndex == 2
                      ? const Color.fromRGBO(2, 247, 132, 1)
                      : Colors.white),
              label: 'VOD',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/scores.svg',
                  width: 16.0,
                  height: 16.0,
                  allowDrawingOutsideViewBox: true,
                  color: _selectedIndex == 3
                      ? const Color.fromRGBO(2, 247, 132, 1)
                      : Colors.grey),
              label: 'תוצאות',
            ),
            const BottomNavigationBarItem(
              activeIcon:
                  Icon(Icons.home, color: Color.fromRGBO(2, 247, 132, 1)),
              icon: Icon(Icons.home, color: Colors.grey),
              label: 'בית',
            ),
          ], // this will be set when a new tab is tapped
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
