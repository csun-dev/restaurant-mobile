import 'package:flutter/material.dart';
import 'package:restaurant_mobile/constants/sizes.dart';
import 'package:restaurant_mobile/features/main_navigation/main_navigation_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Matador's Fresh Slice",
      theme: ThemeData(
        primaryColor: const Color(0xFF9b1818),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: Sizes.size16 + Sizes.size2,
              fontWeight: FontWeight.w600,
            )),
        useMaterial3: false,
      ),
      home: const MainNavigationScreen(),
    );
  }
}
