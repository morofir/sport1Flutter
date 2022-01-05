import 'package:flutter/material.dart';



class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(240, 240, 240, 1),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              height: 40,
              color: Colors.white,
              child: TextField(
                textAlign: TextAlign.justify,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white)),
                  hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 18,
                      fontFamily: "NarkissBlock"),
                  hintText: 'חפש קבוצות, ליגות, שחקנים...',
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
