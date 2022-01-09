import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sport1/models/posts.dart';
import 'package:sport1/models/teams.dart';

String searchAPI =
    'https://sp1dv.maariv.co.il/wp-json/sport1/v1/search?s='; //+ ${searchText}

class SearchProvider with ChangeNotifier {
  final List<Teams> _teams = []; //is not final, changes
  final List<Posts> _posts = [];
  final String _searchText = "";

  List<Teams> get getTeams {
    //filter logic in the WIDGETS!!
    return [..._teams]; //copy of my list
  }

  List<Posts> get getPosts {
    //filter logic in the WIDGETS!!
    return [..._posts]; //copy of my list
  }

  // void addTeams(String title, String id, bool isParentCategory,
  //     List<Children>? children) {
  //   _teams.add(Teams(
  //       title: title,
  //       id: id,
  //       isParentCategory: isParentCategory,
  //       children: children));
  //   notifyListeners(); //must notify listeners
  // }

  Teams filterTeamsById(num id) {
    return _teams.firstWhere((team) => team.id == id);
  }

  Posts filterPostsById(String id) {
    return _posts.firstWhere((post) => post.id == id);
  }

  Future<List<Teams>> fetchTeams(String? searchText) async {
    final response = await http.get(Uri.parse(searchAPI + searchText!));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return jsonResponse['results']['teams_and_leagues']['teams']
          .map<Teams>((data) {
        return Teams.fromJson(data);
      }).toList();
    } else {
      throw Exception("Something went wront, ${response.statusCode}");
    }
  }

  Future<List<Posts>> fetchPosts(String? searchText) async {
    final response = await http.get(Uri.parse(searchAPI + searchText!));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      // print(jsonResponse['results']['posts']);

      return jsonResponse['results']['posts'].map<Posts>((data) {
        return Posts.fromJson(data);
      }).toList();
    } else {
      throw Exception("Something went wront, ${response.statusCode}");
    }
  }
}
