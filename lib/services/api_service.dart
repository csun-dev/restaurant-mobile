import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_mobile/models/menu_model.dart';

class ApiService {
  static const String baseUrl = "http://127.0.0.1:8000";
  static const String mainRoute = "menus";

  static Future<List<MenuModel>> getMenus() async {
    List<MenuModel> menuInstances = [];

    final url = Uri.parse('$baseUrl/$mainRoute');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> menus = jsonDecode(response.body);
      for (var menu in menus) {
        final toon = MenuModel.fromJson(menu);
        menuInstances.add(toon);
      }

      return menuInstances;
    }

    throw Error();
  }

  static Future<MenuModel> getMenuById(int mid) async {
    final url = Uri.parse('$baseUrl/$mainRoute/$mid');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final menu = MenuModel.fromJson(jsonDecode(response.body));
      return menu;
    }

    throw Error();
  }
}
