import 'package:flutter/material.dart';
import 'package:sport1/widgets/searchbar/post_search.dart';
import 'package:sport1/widgets/searchbar/team_search.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key}) : super(key: key);

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
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 15, top: 20),
            child: const Text('קבוצות וליגות',
                style: TextStyle(
                  fontSize: 20,
                )),
          ),
          const TeamsSearch(),
          const SizedBox(
            height: 10,
          ),
          Container(
              margin: const EdgeInsets.only(right: 15, top: 20),
              child:
                  const Text('חדשות ותקצירים', style: TextStyle(fontSize: 20))),
          const NewsSearch(),
        ],
      ),
    );
  }
}
