// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, unused_element, must_be_immutable, prefer_const_constructors_in_immutables, sort_child_properties_last
import 'package:coffeecrazeapp/const.dart';
import 'package:coffeecrazeapp/models/drink.dart';
import 'package:coffeecrazeapp/models/drink_shop.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {

  final Drink drink;

  OrderScreen({
    super.key,
    required this.drink,
    });

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  // A varible to keep track of the quantity of items
  int quantityOfItem = 1;

  // Add drink to cart method
  void addToCart() {
    for (int i = 0; i < quantityOfItem; i++) {
      Provider.of<DrinkShop>(context, listen: false).addItemToCart(widget.drink);
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(backgroundColor: backgroundColor,),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              //Heading 
              Text("Your order", style: GoogleFonts.poppins(fontSize: 20),
              ),
          
              // Container with the image of the order, name, price and quantity
              Container(
                margin: EdgeInsets.only(top: 30),
                height: 550,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25)
                ),
          
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Image.asset(widget.drink.imagePath, height: 325, width: 325,),
                    ),
          
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text("Item: ${widget.drink.name}", style: GoogleFonts.poppins(fontSize: 17,)),
                    ),
          
                    Text("Price: \$${widget.drink.price.toStringAsFixed(2)}", style: GoogleFonts.poppins(fontSize: 17)),
          
                    Text("Quantity: $quantityOfItem", style: GoogleFonts.poppins(fontSize: 17)),
          
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
          
                        IconButton(onPressed: () {
                          setState(() {
                            if (quantityOfItem > 1){
                              --quantityOfItem;
                            }
                          });
                        }, 
                        icon: Image(image: AssetImage('assets/icons/iconsRemove.png'))
                        ),
                        
                        IconButton(
                          onPressed: () {
                            setState(() {
                              ++quantityOfItem;
                            });
                          }, 
                          icon: Image(image: AssetImage('assets/icons/iconsAdd.png'))),
          
                      ],
                    )
          
                  ],
                ),
              ),
          
              // Container with add to cart
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 60,
                width: 350,
                child: ElevatedButton(
                  onPressed: addToCart, 
                  child: Text("Add to Cart", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
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
      ),
    );
  }
}