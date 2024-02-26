// ignore_for_file: prefer_const_constructors, unused_field, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:coffeecrazeapp/components/bottom_nav_bar.dart';
import 'package:coffeecrazeapp/const.dart';
import 'package:coffeecrazeapp/screens/cart_screen.dart';
import 'package:coffeecrazeapp/screens/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

  // Navigate bottom bar
  int _selectedIndex = 0;

  // Method to update index
  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  // List of screens
  final List<Widget> _screens = [
    //Shop screens
    ShopScreen(),

    //Cart screens
    CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // This code can be removed to remove the appbar and drawer 
      appBar: _selectedIndex == 0 ? AppBar(title: Text(""), backgroundColor: backgroundColor,) : null,   // appBar: _currentIndex == 0 ? AppBar(title: Text('Page 1')) : null, For controlling Drawer visibility on other screens
      drawer: _selectedIndex == 0 ? Drawer(    //drawer: _currentIndex == 0 ? Drawer(child: Text('Drawer')) : null, For controlling Drawer visibility other screens
        child: Column(
          children: [
            // Drawer Header
            DrawerHeader(
              child: ImageIcon(
                AssetImage("assets/splashscreen/CoffeeCraze-transparent5.png"),
                color: Colors.brown[700],
                size: 200,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Shop"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ListTile(
                  leading: Icon(Icons.shopping_bag_rounded),
                  title: Text("Cart"),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ListTile(
                  leading: Icon(Icons.info),
                  title: Text("Reservations"),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ListTile(
                  leading: Icon(Icons.call),
                  title: Text("About Us"),
                ),
              ),

          ],
        ),
        backgroundColor: Color(0xFFD9D9D9),
      ) : null,
      
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _screens[_selectedIndex],
    );
  }
}