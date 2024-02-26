// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffeecrazeapp/components/drink_tile.dart';
import 'package:coffeecrazeapp/models/drink.dart';
import 'package:coffeecrazeapp/models/drink_shop.dart';
import 'package:coffeecrazeapp/screens/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {

  // Add to drink to cart
  void addToCart(Drink drink) {
    Provider.of<DrinkShop>(context, listen: false).addItemToCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DrinkShop>(
      builder: (context, value, child) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom:25.0, left: 25.0, right: 25.0),
        child: Column( // ListView instead of column
          children: [

            // Welcome message
            Text("Hi, Arboy!\nWhat would you like today?", style: GoogleFonts.poppins(fontSize: 20), textAlign: TextAlign.center,),

            SizedBox(height: 25),

            // List of Drinks to buy
            Expanded(
              child: ListView.builder(
                itemCount: value.drinkShop.length,
                itemBuilder: (context, index) {
                // Get individual drink
                Drink eachDrink = value.drinkShop[index];

                // Return the tile for this drink
                return DrinkTile(
                  drink: eachDrink, 
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                  //onPressed: () => addToCart(eachDrink),
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => OrderScreen(drink: eachDrink,)));
                  },
                  );
                
              },
              ),
              ),
          ],
        ),
      ),
    )
    );
  }
}