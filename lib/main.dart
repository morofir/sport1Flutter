import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport1/providers/categories_provider.dart';
import 'package:sport1/screens/home_screen.dart';
import 'package:sport1/screens/inside_screen.dart';
import 'package:sport1/screens/onboarding_screen.dart';
import 'package:sport1/screens/tab_screen.dart';
import 'package:sport1/screens/vod_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/login/login_screen.dart';
import 'services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

int? initScreen; //false
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  initScreen = pref.getInt('initScreen');
  await pref.setInt('initScreen', 1); //1-true if loaded the application already
  print(initScreen);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //provider cleans old data automatically
    return MultiProvider(
      //2 providers of auth,one for categories
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authStateChanges,
          initialData: null,
        ),
        ListenableProvider<CategoriesProvider>(
            create: (_) => CategoriesProvider()),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          fontFamily: 'NarkissBlock',
          primaryColor: Colors.black,
          secondaryHeaderColor: Colors.black,
          primarySwatch: Colors.grey,
        ),
        home: initScreen == 1
            ? AuthWrapper()
            : OnbordingScreen(), //if user saw go to authWrapper
        routes: {
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          VodScreen.routeName: (ctx) => const VodScreen(),
          InsideScreen.routeName: (ctx) => const InsideScreen(),
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    print('user: ' + firebaseUser.toString());

    if (firebaseUser != null) {
      print('login success: ' + firebaseUser.toString());
      return TabsScreen();
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => const TabsScreen()));
    } else {
      print('logged out');
      return LoginScreen();
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }
}
