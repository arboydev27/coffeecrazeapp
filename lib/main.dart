// ignore_for_file: prefer_const_constructors

import 'package:coffeecrazeapp/models/drink_shop.dart';
import 'package:coffeecrazeapp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DrinkShop(),
      builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
    );
  }
}
