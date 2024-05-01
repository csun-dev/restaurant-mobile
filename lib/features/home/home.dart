import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_mobile/constants/gaps.dart';
import 'package:restaurant_mobile/constants/sizes.dart';
import 'package:restaurant_mobile/models/menu_model.dart';
import 'package:restaurant_mobile/services/api_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<MenuModel> menus = [];

  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    fetchSpecialDealMenu();

    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < menus.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void fetchSpecialDealMenu() async {
    for (var i = 1; i < 4; i++) {
      final MenuModel menu = await ApiService.getMenuById(i);
      menus.add(menu);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Gaps.v24,
            Container(
              height: Sizes.size216 + Sizes.size216,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Sizes.size10,
                ),
              ),
              child: PageView.builder(
                controller: _pageController,
                itemCount: menus.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            width: Sizes.size216 + Sizes.size96,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.network(
                              menus[index].imageUrl,
                              headers: const {
                                'User-Agent':
                                    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: Sizes.size12,
                            ),
                            child: Text(
                              menus[index].name,
                              style: const TextStyle(
                                fontSize: Sizes.size24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gaps.v10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Special Deals \$ 6.99",
                            style: TextStyle(
                              fontSize: Sizes.size32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Gaps.h10,
                          FaIcon(
                            FontAwesomeIcons.solidHeart,
                            color: Theme.of(context).primaryColor,
                          )
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            const Text(
              "Hours",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gaps.v32,
            const Column(
              children: [
                Text(
                  "Downtown LA - 9:00 AM To 10:00PM Monday",
                  style: TextStyle(
                    fontSize: Sizes.size14,
                  ),
                ),
                Gaps.v32,
                Text(
                  "Northridge - 9:00 AM To 10:00 PM Monday Thru Saturday",
                  style: TextStyle(
                    fontSize: Sizes.size14,
                  ),
                ),
                Gaps.v32,
                Text(
                  "Simi Valley - 9:00 AM To 10:00 PM Monday Thru Saturday",
                  style: TextStyle(
                    fontSize: Sizes.size14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
