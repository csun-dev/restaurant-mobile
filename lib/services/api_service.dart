import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_mobile/models/menu_model.dart';

class ApiService {
  static const String baseUrl = "http://127.0.0.1:8000";
  static const String menus = "menus";

  static Future<List<MenuModel>> getMenus() async {
    List<MenuModel> menuInstances = [];

    final url = Uri.parse('$baseUrl/$menus');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final toon = MenuModel.fromJson(webtoon);
        menuInstances.add(toon);
      }

      return menuInstances;
    }

    throw Error();
  }
}
