import 'package:flutter/material.dart';
import 'package:sport1/widgets/searchbar/post_search.dart';
import 'package:sport1/widgets/searchbar/team_search.dart';
import 'package:sport1/widgets/header.dart';

class SearchResult extends StatefulWidget {
  final String searchKey;
  SearchResult({Key? key, required this.searchKey}) : super(key: key);

  @override
  _SearchResultState createState() => _SearchResultState();
}

@override
void initState() {
  // super.initState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String search = this.widget.searchKey;

    return Scaffold(
      appBar: header(context),
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 15, top: 20, bottom: 10),
            child: const Text('קבוצות וליגות',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(100, 100, 100, 1),
                )),
          ),
          TeamsSearch(searchKey: search),
          const SizedBox(
            height: 10,
          ),
          Container(
              margin: const EdgeInsets.only(right: 15, top: 20, bottom: 10),
              child: const Text(
                'חדשות ותקצירים',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(100, 100, 100, 1),
                ),
              )),
          SizedBox(height: height * 0.58, child: NewsSearch(searchKey: search)),
        ],
      ),
    );
  }
}
