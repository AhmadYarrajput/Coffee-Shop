import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      child: GNav(
        tabMargin: const EdgeInsets.all(1),
        onTabChange: (value) => onTabChange!(value),
        color: Colors.grey[700],
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.black,
        tabBackgroundColor: Colors.grey.shade300,
        tabBorderRadius: 20,
        tabBorder: Border.all(color: Colors.brown),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Shop',
          ),
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: 'Cart',
          ),
        ],
      ),
    );
  }
}
