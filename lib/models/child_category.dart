class Children {
  final String title;
  final String id;
  final bool isParentCategory;

  Children(
      {required this.title, required this.id, required this.isParentCategory});

  factory Children.fromJson(Map<String, dynamic> json) {
    return Children(
        title: json['title'],
        id: json['id'],
        isParentCategory: json['is_parent_category']);
  }
}
