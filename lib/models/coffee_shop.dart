import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  final List<Coffee> shop = [
    Coffee(
        name: 'Black Coffee', price: '5.25', imagePath: 'lib/images/coffee.png'),
    Coffee(
        name: 'Espresso', price: '5.10', imagePath: 'lib/images/expresso.png'),
    Coffee(
        name: 'Iced Coffee',
        price: '5.55',
        imagePath: 'lib/images/cold-coffee.png'),
    Coffee(name: 'latte', price: '5.25', imagePath: 'lib/images/latte.png'),
  ];

  final List<Coffee> _userCart = [];
  List<Coffee> get coffeeShop => shop;
  List<Coffee> get userCart => _userCart;

  void addItemtoCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  void removeItemtoCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
