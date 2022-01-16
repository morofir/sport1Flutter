import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport1/models/posts.dart';
import 'package:sport1/providers/search_provider.dart';

class NewsSearch extends StatefulWidget {
  const NewsSearch({required this.searchKey});
  final String searchKey;

  @override
  State<NewsSearch> createState() => _NewsSearchState();
}

class _NewsSearchState extends State<NewsSearch> {
  late Future<List<Posts>> PostsData;

  @override
  void initState() {
    super.initState();
    PostsData = Provider.of<SearchProvider>(context, listen: false)
        .fetchPosts(this.widget.searchKey);
  }

  @override
  Widget build(BuildContext context) {
    var noImage =
        'https://thumbs.dreamstime.com/z/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg';
    //vertical listview
    return SizedBox(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
        body: Center(
          child: FutureBuilder<List<Posts>>(
              future: PostsData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Posts>? data = snapshot.data; //this is my fetched posts
                  if (data?.length == 0) {
                    return Container(
                      padding: const EdgeInsets.all(50),
                      child: const Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                            'לא נמצאו קבוצות או ליגות התואמות את החיפוש',
                            style: TextStyle(fontSize: 16, color: Colors.grey)),
                      ),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              margin: const EdgeInsets.all(8),
                              elevation: 8,
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade100, width: 1)),
                              child: Row(
                                children: [
                                  Container(
                                    width: 180,
                                    height: 118,
                                    child: Image.network(
                                        data![index].featuredImage ?? noImage,
                                        fit: BoxFit.fill),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.all(10),
                                      width: 150,
                                      height: 100,
                                      child: Text(data[index].title,
                                          overflow: TextOverflow.fade,
                                          maxLines: 7,
                                          softWrap: true,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ))),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }
}
