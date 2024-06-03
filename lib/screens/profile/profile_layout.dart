// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:expancetracker/screens/profile/balance_details.dart';
import 'package:expancetracker/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileLayout extends StatefulWidget {
  const ProfileLayout({super.key});

  @override
  State<ProfileLayout> createState() => _ProfileLayoutState();
}

class _ProfileLayoutState extends State<ProfileLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Profile",
          style: TextStyle(
              fontFamily: "Poppins", color: Colors.white, fontSize: 16),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            ProfileScreen(),
            BalanceDetails(),
          ],
        ),
      ),
    );
  }
}
