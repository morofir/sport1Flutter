import 'package:flutter/material.dart';
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
          child: FutureBuilder<List<Categories>>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Categories>? data =
                      snapshot.data; //this is my fetched Categories
                  return ListView.builder(
                      itemCount: data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ExpansionTile(
                          title: Text(data![index].title),
                          // children: data[index].isParentCategory
                          //     ? <Widget>[
                          //         ...data[index]
                          //             .children
                          //             .map<Widget>((e) => ListTile(
                          //                   title: Text(e.title),
                          //                 ))
                          //       ]
                          //     : <Widget>[const SizedBox(height: 0, width: 0)],
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
