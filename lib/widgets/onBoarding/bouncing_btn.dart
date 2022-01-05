import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sport1/main.dart';
import 'package:sport1/screens/tab_screen.dart';

class BouncingBtn extends StatefulWidget {
  @override
  _BouncingBtnState createState() => _BouncingBtnState();
}

class _BouncingBtnState extends State<BouncingBtn> {
  late double marginTop;
  late double start;
  late double end;
  late double increment;

  void bounce(Timer t) async {
    if (marginTop > end) {
      setState(() {
        marginTop -= increment;
      });
    } else {
      t.cancel();
    }
  }

  void interpolate(double start, double end) {
    setState(() {
      increment = (start - end) / 60; //60 fps
    });
  }

  @override
  void initState() {
    super.initState();
    marginTop = 100;
    start = 100;
    end = 40;
    interpolate(start, end);
    Timer.periodic(const Duration(milliseconds: 16), bounce);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromRGBO(232, 232, 232, 1),
      child: Container(
        margin: EdgeInsets.only(top: marginTop),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  width: 187.0,
                  height: 46.0,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(2, 247, 132, 1))), //todo
                      child: const Text('קחו אותי פנימה',
                          style: TextStyle(fontSize: 20)),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const AuthWrapper()));
                      }),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color.fromRGBO(2, 247, 132, 1),
                  ),
                ),
                const Text('כבר יש לי משתמש',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontFamily: 'NarkissBlock')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
