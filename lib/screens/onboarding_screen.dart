import 'package:flutter/material.dart';
import 'package:sport1/main.dart';
import 'package:sport1/screens/login/login_screen.dart';
import 'package:sport1/screens/tab_screen.dart';
import 'package:sport1/widgets/onBoarding/intro_screem.dart';
import 'package:sport1/widgets/onBoarding/on_boarding_data.dart';

class OnbordingScreen extends StatelessWidget {
  /*here we have a list of OnbordingScreen which we want to have, each OnbordingScreen have a imagePath,title and an desc.
      */
  final List<OnbordingData> list = [
    OnbordingData(
      imagePath: "assets/images/caro1.png",
      title: "1האפליקציה החדשה של ספורט!",
      desc: "ברוך הבא לאפליקציית הספורט הראשונה בישראל שמותאמת במיוחד עבורך",
    ),
    OnbordingData(
      imagePath: "assets/images/caro2.png",
      title: "וידאו ללא הגבלה",
      desc: "צפה בליגות הטובות בעולם בספריית ה-vod הגדולה בישראל",
    ),
    OnbordingData(
      imagePath: "assets/images/caro3.png",
      title: "מה מעניין אותך?",
      desc: "בחר את הקבוצות והליגות שלך ותהנה מחוויה מותאמת אישית, בחינם.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    /* remove the back button in the AppBar is to set automaticallyImplyLeading to false
  here we need to pass the list and the route for the next page to be opened after this. */
    return IntroScreen(
      list,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
