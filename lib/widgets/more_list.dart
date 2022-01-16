import 'package:flutter/material.dart';
import 'package:sport1/models/category.dart';
import 'package:sport1/providers/categories_provider.dart';
import 'package:sport1/screens/tab_screen.dart';
import 'package:sport1/services/categories_network_service.dart';
import 'package:provider/provider.dart';

class MoreList extends StatefulWidget {
  @override
  State<MoreList> createState() => _MoreListState();
}

class _MoreListState extends State<MoreList> {
  final CategoriesNetworkService categoriesService = CategoriesNetworkService();
  late Future<List<Categories>> futureData;
  List<Categories> myList = [];

  void initList() async {
    myList = await CategoriesProvider().fetchCategories();

    for (Categories item in myList) {
      Provider.of<CategoriesProvider>(context, listen: false).addCategory(
          item.title, item.id, item.isParentCategory, item.children);
    }
  }

  @override
  void initState() {
    super.initState();
    futureData = Provider.of<CategoriesProvider>(context, listen: false)
        .fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    initList();
    return SizedBox(
      height: 500,
      child: Scaffold(
        body: Center(
          child: RefreshIndicator(
            //pull to refresh
            onRefresh: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                    pageBuilder: (a, b, c) => const TabsScreen(),
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
                                ...?data[index].children?.map((e) => Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 0.03),
                                          color:
                                              Color.fromRGBO(240, 240, 240, 1)),
                                      child: ListTile(title: Text(e.title)),
                                    )),
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
