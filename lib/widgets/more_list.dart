import 'package:flutter/material.dart';
import 'package:sport1/main.dart';
import 'package:sport1/models/category.dart';
import 'package:sport1/services/categories_network_service.dart';

class MoreList extends StatefulWidget {
  @override
  State<MoreList> createState() => _MoreListState();
}

class _MoreListState extends State<MoreList> {
  final CategoriesNetworkService categoriesService = CategoriesNetworkService();
  late Future<List<Categories>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = categoriesService.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Scaffold(
        body: Center(
          child: RefreshIndicator(
            //pull to refreshe
            onRefresh: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                    pageBuilder: (a, b, c) => MyApp(),
                    transitionDuration: const Duration(seconds: 0)),
              );
              return Future.value(false);
            },
            child: FutureBuilder<List<Categories>>(
                future: futureData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Categories>? data =
                        snapshot.data; //this is my fetched Categories
                    return ListView.builder(
                        itemCount: data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: ExpansionTile(
                              title: Text(data![index].title),
                              children: <Widget>[
                                //if child exists generate list tile
                                ...?data[index].children?.map(
                                    (e) => ListTile(title: Text(e.title))),
                              ],
                            ),
                          );
                        });
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
          ),
        ),
      ),
    );
  }
}
