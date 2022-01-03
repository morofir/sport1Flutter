import 'package:flutter/material.dart';
import 'package:sport1/screens/more_screen.dart';
import 'package:sport1/screens/scores_screen.dart';
import 'package:sport1/screens/vod_screen.dart';
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

//  PageController _pageController;

  // List<Widget> tabPages = [ FUTURE USE FOR WIDGETS :
  // https://stackoverflow.com/questions/45235570/how-to-use-bottomnavigationbar-with-navigator

  //   Screen1(),
  //   Screen2(),
  //   Screen3(),
  // ];
  //  @override
  // void initState(){
  //   super.initState();
  //   _pageController = PageController(initialPage: _pageIndex);
  // }

  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    const List<Widget> _pages = <Widget>[
      //list of icons future be pages
      MoreScreen(),
      ScoreScreen(),
      VodScreen(),
      BroadScreen(),
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

          items: const [
            BottomNavigationBarItem(
              activeIcon:
                  Icon(Icons.menu, color: Color.fromRGBO(2, 247, 132, 1)),
              icon: Icon(Icons.menu, color: Colors.grey),
              label: 'More',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.calendar_today_sharp,
                  color: Color.fromRGBO(2, 247, 132, 1)),
              icon: Icon(Icons.calendar_today_sharp, color: Colors.grey),
              label: 'Scores',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.play_circle_fill,
                  color: Color.fromRGBO(2, 247, 132, 1)),
              icon: Icon(Icons.play_circle_fill, color: Colors.grey),
              label: 'Vod',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.score_rounded,
                  color: Color.fromRGBO(2, 247, 132, 1)),
              icon: Icon(Icons.score_rounded, color: Colors.grey),
              label: 'Broadcast',
            ),
            BottomNavigationBarItem(
              activeIcon:
                  Icon(Icons.home, color: Color.fromRGBO(2, 247, 132, 1)),
              icon: Icon(Icons.home, color: Colors.grey),
              label: 'Home',
            ),
          ], // this will be set when a new tab is tapped
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
