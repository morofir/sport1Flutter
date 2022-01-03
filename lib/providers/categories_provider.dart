import 'package:flutter/material.dart';
import 'package:sport1/models/category.dart';

class CategoriesProvider with ChangeNotifier {
  //mix in - merge some of the props (like extend but weaker link)
  final List<Categories> _categories = []; //is not final, changes

  List<Categories> get getItems {
    //filter logic in the WIDGETS!!
    return [..._categories]; //copy of my list
  }

  // List<Categories> get getParentCategories {
  //   return _categories.where((item) => item.isParentCategory).toList();
  // }

  void addProduct() {
    // _categories.add(value);
    notifyListeners(); //must notify listeners
  }

  Categories filterById(num id) {
    return _categories.firstWhere((cat) => cat.id == id);
  }
}
