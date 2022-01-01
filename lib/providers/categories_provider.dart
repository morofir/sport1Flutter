import 'package:flutter/material.dart';
import 'package:sport1/models/category.dart';

class Categories with ChangeNotifier {
  //mix in - merge some of the props (like extend but weaker link)
  final List<CategoryData> _categories = []; //is not final, changes

  List<CategoryData> get getItems {
    //filter logic in the WIDGETS!!
    return [..._categories]; //copy of my list
  }

  List<CategoryData> get getParentCategories {
    return _categories.where((item) => item.is_parent_category).toList();
  }

  void addProduct() {
    // _categories.add(value);
    notifyListeners(); //must notify listeners
  }

  CategoryData filterById(num id) {
    return _categories.firstWhere((cat) => cat.id == id);
  }
}
