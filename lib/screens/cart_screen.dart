// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace

import 'package:coffeecrazeapp/components/drink_tile.dart';
import 'package:coffeecrazeapp/models/drink.dart';
import 'package:coffeecrazeapp/models/drink_shop.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  // Remove item from cart
  void removeFromCart(Drink drink) {
    Provider.of<DrinkShop>(context, listen: false).removeItemFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DrinkShop>(
      builder: (context, value, child) {
        double totalPrice = 0;
              for (var drink in value.userCart) {
                totalPrice += double.parse(drink.price.toString());
              }
      
      return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            //Heading 
            Text("Your cart", style: GoogleFonts.poppins(fontSize: 20),
            ),

            SizedBox(height: 25),

            // List of cart
            Expanded(
              child: ListView.builder(
                itemCount: value.userCart.length,
                itemBuilder: (context, index) {
                // Get individual drinls
                Drink eachDrink = value.userCart[index];

                // Return drinkTile
                return DrinkTile(
                  drink: eachDrink, 
                  onPressed: () => removeFromCart(eachDrink), 
                  icon: Icon(Icons.delete),
                  );

              },
              ),
              ),

              ListTile(
                leading: Text("Total", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
                trailing: Text("\$${totalPrice.toStringAsFixed(2)}", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              //Text("Total", style: GoogleFonts.poppins(fontSize: 20), textAlign: TextAlign.start,),

              // Container with Pay Now
              Container(
                height: 60,
                width: 350,
                child: ElevatedButton(
                  onPressed: () {}, 
                  child: Text("Pay Now", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all( Colors.brown[700]/*Color(0xFF301D0D) */
                    ),
                  ),
                  ),
              ),


          ],
        ),
      ),
    );
      }
    );
  }
}