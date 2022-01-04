library flutteronboardingscreens;

import 'package:flutter/material.dart';
import 'package:sport1/widgets/onBoarding/bouncing_btn.dart';
import 'package:sport1/widgets/onBoarding/on_boarding_data.dart';

/// A IntroScreen Class.

class IntroScreen extends StatefulWidget {
  final List<OnbordingData> onbordingDataList;
  final MaterialPageRoute pageRoute;
  IntroScreen(this.onbordingDataList, this.pageRoute);

  void skipPage(BuildContext context) {
    Navigator.of(context).pushReplacement(pageRoute); //todo check
    // Navigator.push(context, pageRoute);.
  }

  @override
  IntroScreenState createState() {
    return IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  final PageController controller = PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == widget.onbordingDataList.length - 1) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  //dots widgets
  Widget _buildPageIndicator(int page) {
    return Container(
      margin: const EdgeInsets.only(right: 3, left: 3),
      height: 9.0,
      width: 9.0,
      decoration: BoxDecoration(
        color: page == currentPage
            ? const Color.fromRGBO(2, 247, 132, 1)
            : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(232, 232, 232, 1),
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.topLeft,
            child: TextButton(
              child: const Text("דלג",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 20.0)),
              onPressed: () => widget.skipPage(
                context,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: PageView(
              reverse: true,
              children: widget.onbordingDataList,
              controller: controller,
              onPageChanged: _onPageChanged,
            ),
          ),
          currentPage == 2
              ? Expanded(
                  flex: 1,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[BouncingBtn()]))
              : Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: [
                            _buildPageIndicator(2),
                            _buildPageIndicator(1),
                            _buildPageIndicator(0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
