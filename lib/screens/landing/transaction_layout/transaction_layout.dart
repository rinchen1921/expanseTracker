// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class TransactionLayout extends StatefulWidget {
  const TransactionLayout({super.key});

  @override
  State<TransactionLayout> createState() => _TransactionLayoutState();
}

class _TransactionLayoutState extends State<TransactionLayout> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22.0,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text("Family Dinner",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("2nd June, 2024"),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Text("Nu. 4000",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
