import 'package:flutter/material.dart';
import 'package:sport1/widgets/searchbar/search_result.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();
  String _searchText = "";

  _SearchBarState() {
    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _searchText = "";
        });
      } else {
        setState(() {
          _searchText = _controller.text;
        });
      }
    });
  }
  void showSearch(String _searchText) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SearchResult(searchKey: _searchText)),
    );
  }

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
                onSubmitted: (String str) {
                  setState(() {
                    _searchText = str;
                    showSearch(_searchText);
                  });
                },
                controller: _controller,
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
