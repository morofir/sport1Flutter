import 'package:flutter/foundation.dart';

class ChildData with ChangeNotifier {
  final String title;
  final num id;
  final bool is_parent_category;

  ChildData({
    required this.title,
    required this.id,
    required this.is_parent_category,
  });
}
