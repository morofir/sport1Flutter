import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:sport1/screens/inside_screen.dart';
import 'package:sport1/screens/login/login_screen.dart';
import 'package:sport1/services/auth_service.dart';

class VodScreen extends StatelessWidget {
  const VodScreen({Key? key}) : super(key: key);
  static const routeName = '/vod';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("VOD"),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InsideScreen()),
                );
              },
              child: const Text('Inside Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                try {
                  context.read<AuthService>().signOut().then((_) =>
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen())));
                } catch (e) {
                  print(e.toString());
                }
              },
              child: const Text('Log Out'),
            )
          ],
        ),
      ),
    );
  }
}
