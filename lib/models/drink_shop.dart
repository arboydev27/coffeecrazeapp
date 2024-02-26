// ignore_for_file: unused_import, prefer_final_fields

import 'package:coffeecrazeapp/models/drink.dart';
import 'package:flutter/material.dart';

class DrinkShop extends ChangeNotifier {
  // Coffee for sale list
  final List<Drink> _shop = [
    // Cappucino
    Drink(
      name: 'Cappuccino', 
      price: 3.25, 
      imagePath: "assets/drinks/cappuccino.png"
    ),

    // Expresso
    Drink(
      name: 'Expresso', 
      price: 3.00, 
      imagePath: "assets/drinks/expresso.png"
    ),

    // Frappuccino
    Drink(
      name: 'Frappuccino', 
      price: 4.25, 
      imagePath: "assets/drinks/frappuccino.png"
    ),

    // Chai-latte
    Drink(
      name: 'Chai latte', 
      price: 3.25, 
      imagePath: "assets/drinks/chai-tea.png"
    ),

    // Mocha
    Drink(
      name: 'Mocha', 
      price: 3.75, 
      imagePath: "assets/drinks/mocha.png"
    ),

    // Frozen-frappe
    Drink(
      name: 'Frozen frappe', 
      price: 4.00, 
      imagePath: "assets/drinks/frappe.png"
    ),

    // Macciato
    Drink(
      name: 'Macciato', 
      price: 3.00, 
      imagePath: "assets/drinks/macciato.png"
    ),

    // Latte
    Drink(
      name: 'Latte', 
      price: 3.25, 
      imagePath: "assets/drinks/latte.png"
    ),

  ];

  // User cart
  List<Drink> _userCart = [];

  // Get coffee list
  List<Drink> get drinkShop => _shop;

  // Get user cart
  List<Drink> get userCart => _userCart;

  // Add item to cart
  void addItemToCart(Drink drink) {
    _userCart.add(drink);
    notifyListeners();
  }

  // Remove item from cart
  void removeItemFromCart(Drink drink){
    _userCart.remove(drink);
    notifyListeners();
  }

}