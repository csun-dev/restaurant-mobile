import 'package:flutter/material.dart';
import 'package:restaurant_mobile/constants/gaps.dart';
import 'package:restaurant_mobile/constants/sizes.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Gaps.v24,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: Sizes.size96 + Sizes.size96 + Sizes.size96,
                  height: Sizes.size64,
                  decoration: BoxDecoration(
                    color: const Color(0xFF424242),
                    borderRadius: BorderRadius.circular(
                      Sizes.size28,
                    ),
                  ),
                  child: const Text(
                    "CSUN Pizzeria",
                    style: TextStyle(
                      fontSize: Sizes.size36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
