import 'package:flutter/material.dart';
import 'package:restaurant_mobile/constants/gaps.dart';
import 'package:restaurant_mobile/features/menu/widgets/menu_widget.dart';
import 'package:restaurant_mobile/models/menu_model.dart';
import 'package:restaurant_mobile/services/api_service.dart';

class Menu extends StatelessWidget {
  Menu({super.key});

  final Future<List<MenuModel>> menus = ApiService.getMenus();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: menus,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Expanded(
                    child: makeList(snapshot),
                  ),
                ],
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<MenuModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemBuilder: (context, index) {
        var menu = snapshot.data![index];
        return MenuData(
          name: menu.name,
          description: menu.description,
          imageUrl: menu.imageUrl,
          id: menu.id,
          price: menu.price,
        );
      },
      separatorBuilder: (context, index) {
        return Gaps.v48;
      },
    );
  }
}
