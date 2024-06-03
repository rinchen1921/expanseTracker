// ignore_for_file: prefer_const_constructors

import 'package:expancetracker/screens/account/account_screen.dart';
import 'package:expancetracker/screens/landing/home.dart';
import 'package:expancetracker/screens/profile/profile_layout.dart';
import 'package:expancetracker/screens/transaction/add_transaction.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _selectedIndex = 0;

  List<String> titles = ['Home', 'Account', 'Add', 'Profile'];
  List<Widget> screens = [
    Home(),
    AccountScreen(),
    AddTransaction(),
    ProfileLayout(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (val) {
          setState(
            () {
              _selectedIndex = val;
            },
          );
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Color.fromARGB(255, 243, 105, 41),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit_document), label: 'Account'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
