import 'package:flutter/material.dart';
import 'package:sport1/models/category.dart';
import 'package:sport1/models/child_category.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

String api = 'https://sp1dv.maariv.co.il/wp-json/sport1/v1/navigation';

class CategoriesProvider with ChangeNotifier {
  //mix in - merge some of the props (like extend but weaker link)
  final List<Categories> _categories = []; //is not final, changes

  List<Categories> get getCategories {
    //filter logic in the WIDGETS!!
    return [..._categories]; //copy of my list
  }

  List<Categories> get getParentCategories {
    return _categories.where((item) => item.isParentCategory).toList();
  }

  void addCategory(String title, String id, bool isParentCategory,
      List<Children>? children) {
    _categories.add(Categories(
        title: title,
        id: id,
        isParentCategory: isParentCategory,
        children: children));
    notifyListeners(); //must notify listeners
  }

  Categories filterById(num id) {
    return _categories.firstWhere((cat) => cat.id == id);
  }

  Future<List<Categories>> fetchCategories() async {
    final response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return jsonResponse['categories'].map<Categories>((data) {
        return Categories.fromJson(data);
      }).toList();
    } else {
      throw Exception("Something went wront, ${response.statusCode}");
    }
  }
}
