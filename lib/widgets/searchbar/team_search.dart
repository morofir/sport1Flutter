import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport1/models/teams.dart';
import 'package:sport1/providers/search_provider.dart';

class TeamsSearch extends StatefulWidget {
  final String searchKey;
  const TeamsSearch({required this.searchKey});

  @override
  State<TeamsSearch> createState() => _TeamsSearchState();
}

class _TeamsSearchState extends State<TeamsSearch> {
  late Future<List<Teams>> TeamsData;

  @override
  void initState() {
    super.initState();
    TeamsData = Provider.of<SearchProvider>(context, listen: false)
        .fetchTeams(this.widget.searchKey);
  }

  @override
  Widget build(BuildContext context) {
    //horizontal listview
    return SizedBox(
      height: 120,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: FutureBuilder<List<Teams>>(
              future: TeamsData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Teams>? data = snapshot.data; //this is my fetched teams
                  if (data?.length == 0) {
                    return const Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text('לא נמצאו קבוצות או ליגות התואמות את החיפוש',
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    );
                  } else {
                    return ListView.builder(
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  elevation: 5,
                                  child: CircleAvatar(
                                    radius: 32.5,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 25.0,
                                      child: Image.network(
                                        data[index].logo,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(data[index].name,
                                    softWrap: true,
                                    style: const TextStyle(
                                      color: Color.fromRGBO(146, 146, 145, 1),
                                    )),
                              ),
                            ],
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
