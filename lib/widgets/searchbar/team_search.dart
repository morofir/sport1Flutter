
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport1/models/teams.dart';
import 'package:sport1/providers/search_provider.dart';

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
      height: 120,
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
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 35.0,
                                child: Container(
                                    height: 160,
                                    width: 114,
                                    child: Image.network(data![index].logo)),
                              ),
                            ),
                            Center(child: Text(data[index].name)),
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