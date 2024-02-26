// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:coffeecrazeapp/models/drink.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrinkTile extends StatelessWidget {
  final Drink drink;
  void Function()? onPressed;

  final Widget icon;

  DrinkTile({
    super.key, 
    required this.drink, 
    required this.onPressed,
    required this.icon,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12)
      ),
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        title: Text(drink.name, style: GoogleFonts.poppins(fontSize: 15)),
        // ignore: prefer_interpolation_to_compose_strings
        subtitle: Text("\$" + drink.price.toStringAsFixed(2), style: GoogleFonts.poppins()),
        leading: Image.asset(drink.imagePath),
        trailing: IconButton(
          onPressed: onPressed, 
          icon: icon,
          ),
      ),
    );
  }
}