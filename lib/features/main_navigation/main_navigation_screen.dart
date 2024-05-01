import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_mobile/constants/gaps.dart';
import 'package:restaurant_mobile/constants/sizes.dart';
import 'package:restaurant_mobile/features/home/home.dart';
import 'package:restaurant_mobile/features/main_navigation/widgets/nav_tab.dart';
import 'package:restaurant_mobile/features/menu/menu.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/logo.svg',
              height: Sizes.size44,
            ),
            Gaps.h10,
            const Text(
              "CSUN Pizzeria",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              size: Sizes.size32,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const Home(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: Menu(),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
                text: "Home",
                isSelected: _selectedIndex == 0,
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                onTap: () => _onTap(0),
              ),
              NavTab(
                text: "Menu",
                isSelected: _selectedIndex == 1,
                icon: FontAwesomeIcons.pizzaSlice,
                selectedIcon: FontAwesomeIcons.pizzaSlice,
                onTap: () => _onTap(1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
