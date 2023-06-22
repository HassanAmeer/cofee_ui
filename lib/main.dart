import 'package:flutter/material.dart';
import 'views/Home_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  MaterialColor coffeColor = const MaterialColor(
    0xFFD4A574,
    <int, Color>{
      50: Color(0xFFFFF4E5),
      100: Color(0xFFFFE1BF),
      200: Color(0xFFFFCE99),
      300: Color(0xFFFFBB73),
      400: Color(0xFFFFA84D),
      500: Color(0xFFD4A574),
      600: Color(0xFFFF913B),
      700: Color(0xFFFF7D11),
      800: Color(0xFFFF6900),
      900: Color(0xFFFF5500),
    },
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee App',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: coffeColor,
      ),
      home: const HomeScreen(),
    );
  }
}
