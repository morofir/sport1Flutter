import 'package:flutter/material.dart';

class OnbordingData extends StatefulWidget {
  final imagePath;
  final title;
  final desc;

  OnbordingData({this.imagePath, this.title, this.desc});

  @override
  _OnbordingDataState createState() =>
      _OnbordingDataState(this.imagePath, this.title, this.desc);
}

class _OnbordingDataState extends State<OnbordingData> {
  final imagePath;
  final title;
  final desc;
  _OnbordingDataState(this.imagePath, this.title, this.desc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(232, 232, 232, 1),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Image(
              fit: BoxFit.none,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.450,
              image: AssetImage(imagePath),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: 'NarkissBlock'),
                  ),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.all(10),
                width: 60,
                height: 4,
                color: const Color.fromRGBO(2, 247, 132, 1)),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  desc,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      fontFamily: 'NarkissBlock'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
