
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport1/models/posts.dart';
import 'package:sport1/providers/search_provider.dart';

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
      height: 380,
      child: Scaffold(
        body: Center(
          child: FutureBuilder<List<Posts>>(
              future: PostsData,
              builder: (context, snapshot) {
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
                                      fit: BoxFit.fitWidth),
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
