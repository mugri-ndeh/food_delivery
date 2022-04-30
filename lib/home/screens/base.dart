import 'package:delivery_app/home/screens/home.dart';
import 'package:delivery_app/home/screens/profile.dart';
import 'package:delivery_app/util/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BaseScreen extends StatefulWidget {
  BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  List<Widget> _pages = [
    Home(),
    Profile(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 1),
                color: Palette.primaryGreen.withOpacity(0.4),
                blurRadius: 4),
          ],
        ),
        padding: const EdgeInsets.all(8),
        child: GNav(
            haptic: false, // haptic feedback
            tabBorderRadius: 30, // tab button border
            curve: Curves.linear, // tab animation curves
            duration:
                const Duration(milliseconds: 500), // tab animation duration
            gap: 8, // the tab button gap between icon and text
            color: Colors.black, // unselected icon color
            activeColor: Palette.primaryGreen, // selected icon and text color
            iconSize: 24, // tab button icon size
            tabBackgroundColor: Palette.secondaryColor
                .withOpacity(0.4)
                .withOpacity(0.1), // selected tab background color
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 5), // navigation bar padding
            tabs: [
              GButton(
                padding: const EdgeInsets.all(10),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                icon: Icons.home_outlined,
                text: 'Home',
              ),
              GButton(
                padding: const EdgeInsets.all(10),
                onPressed: () {
                  setState(() {
                    // _selectedIndex = 1;
                  });
                },
                icon: Icons.shopping_cart_outlined,
                text: 'Cart',
              ),
              GButton(
                padding: const EdgeInsets.all(10),
                onPressed: () {
                  setState(() {
                    // _selectedIndex = 2;
                  });
                },
                icon: Icons.message_outlined,
                text: 'Messages',
              ),
              GButton(
                padding: const EdgeInsets.all(10),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                icon: Icons.person_outline_outlined,
                text: 'Profile',
              )
            ]),
      ),
    );
  }
}
