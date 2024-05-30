// transaction_layout.dart

// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class TransactionLayout extends StatelessWidget {
  final String title;
  final String date;
  final double amount;

  const TransactionLayout({
    required this.title,
    required this.date,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(fontFamily: "Poppins"),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Text(
                    "Nu. $amount",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
