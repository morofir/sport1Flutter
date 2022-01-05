import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport1/models/posts.dart';
import 'package:sport1/models/teams.dart';
import 'package:sport1/providers/search_provider.dart';

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
        children: const [
          Text('קבוצות וליגות', style: TextStyle(fontSize: 20)),
          TeamsSearch(),
          SizedBox(
            height: 10,
          ),
          Text('חדשות ותקצירים', style: TextStyle(fontSize: 20)),
          NewsSearch(),
        ],
      ),
    );
  }
}

class TeamsSearch extends StatefulWidget {
  const TeamsSearch({Key? key}) : super(key: key);

  @override
  State<TeamsSearch> createState() => _TeamsSearchState();
}

class _TeamsSearchState extends State<TeamsSearch> {
  late Future<List<Teams>> TeamsData;

  @override
  void initState() {
    super.initState();
    TeamsData =
        Provider.of<SearchProvider>(context, listen: false).fetchTeams();
  }

  @override
  Widget build(BuildContext context) {
    //horizontal listview
    return SizedBox(
      height: 200,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: FutureBuilder<List<Teams>>(
              future: TeamsData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Teams>? data = snapshot.data; //this is my fetched teams
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                                height: 160,
                                width: 114,
                                child: Image.network(data![index].logo)),
                            Text(data[index].name),
                          ],
                        );
                      });
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }
}

class NewsSearch extends StatefulWidget {
  const NewsSearch({Key? key}) : super(key: key);

  @override
  State<NewsSearch> createState() => _NewsSearchState();
}

class _NewsSearchState extends State<NewsSearch> {
  late Future<List<Posts>> PostsData;

  @override
  void initState() {
    super.initState();
    PostsData =
        Provider.of<SearchProvider>(context, listen: false).fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    var noImage =
        'https://thumbs.dreamstime.com/z/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg';
    //vertical listview
    return SizedBox(
      height: 350,
      child: Scaffold(
        body: Center(
          child: FutureBuilder<List<Posts>>(
              future: PostsData,
              builder: (context, snapshot) {
                print(snapshot);
                if (snapshot.hasData) {
                  List<Posts>? data = snapshot.data; //this is my fetched posts
                  return ListView.builder(
                      itemCount: data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: Container(
                            margin: const EdgeInsets.all(5.0),
                            height: 160,
                            width: 106,
                            child: Card(
                              margin: const EdgeInsets.all(10),
                              elevation: 8,
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade100, width: 2)),
                              child: Row(
                                children: [
                                  Image.network(
                                      data![index].featuredImage ?? noImage,
                                      fit: BoxFit.cover),
                                  Container(
                                      margin: const EdgeInsets.all(10),
                                      width: 100,
                                      height: 100,
                                      child: Text(data[index].title,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ))),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }
}
