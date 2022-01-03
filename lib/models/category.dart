import 'child_category.dart';

class Categories {
  final String title;
  final String id;
  final bool isParentCategory;
  final List<Children>? children;

  String get getTitle => title;

  Categories(
      {required this.title,
      required this.id,
      required this.isParentCategory,
      this.children});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
        title: json['title'],
        id: json['id'],
        isParentCategory: json['is_parent_category'],
        children: json['children'].length > 0 //if child exists
            ? json['children']
                .map<Children>((json) => Children.fromJson(json))
                .toList()
            : null);
  }
}
