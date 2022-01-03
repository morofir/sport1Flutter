import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sport1/models/category.dart';
import 'package:sport1/models/child_category.dart';

String api = 'https://sp1dv.maariv.co.il/wp-json/sport1/v1/navigation';

class CategoriesNetworkService {
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
