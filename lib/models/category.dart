import 'package:flutter/foundation.dart';
import 'child_category.dart';

class CategoryData with ChangeNotifier {
  final String title;
  final num id;
  final bool is_parent_category;
  final ChildData children;

  CategoryData({
    required this.title,
    required this.id,
    required this.is_parent_category,
    required this.children,
  });
}
