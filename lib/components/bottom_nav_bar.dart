// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        color: Colors.grey,
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.brown[700],
        tabBackgroundColor: Color(0x4DDAC1A5),
        tabBorderRadius: 25,
        tabActiveBorder: Border.all(color: Colors.white),
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Shop',
            ),
      
          GButton(
            icon: Icons.shopping_bag_rounded,
            text: 'Cart',
            ),
      
        ]),
    );
  }
}