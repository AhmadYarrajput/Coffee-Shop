import 'dart:math';
import 'package:coffee_shop/components/coffee_tile.dart';
import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _controller = ConfettiController();
  bool isPlaying = false;
  bool paymentSuccessful = false;
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemtoCart(coffee);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void startConfettiAnimation() {
    _controller.play();
    setState(() {
      paymentSuccessful = true;
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        paymentSuccessful = false;
      });
      _controller.stop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topCenter,
              ),
              ConfettiWidget(
                confettiController: _controller,
                blastDirection: -pi / 2,
                gravity: 0.3,
                blastDirectionality: BlastDirectionality.explosive,
                numberOfParticles: 100,

              ),
              const Center(
                child: Text(
                  'Your Cart',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.userCart.length,
                  itemBuilder: (context, index) {
                    Coffee eachCoffe = value.userCart[index];
                    return CoffeeTile(
                      coffee: eachCoffe,
                      onPressed: () => removeFromCart(eachCoffe),
                      icon: const Icon(Icons.delete),
                    );
                  },
                ),
              ),
              Container(
                width: 280,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.brown),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (isPlaying) {
                          _controller.stop();
                        } else {
                          _controller.play();
                        }
                        isPlaying = !isPlaying;
                        startConfettiAnimation();
                      });
                    },
                    child: const Text(
                      'Pay now',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
