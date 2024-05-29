// ignore_for_file: prefer_const_constructors, file_names

import 'package:expancetracker/screens/landing/transaction_layout/transaction_layout.dart';
import 'package:flutter/material.dart';

class Recenttransaction extends StatefulWidget {
  const Recenttransaction({super.key});

  @override
  State<Recenttransaction> createState() => _RecenttransactionState();
}

class _RecenttransactionState extends State<Recenttransaction> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 20),
          Text(
            "Recent Transactions",
            style: TextStyle(
              color: Color.fromARGB(255, 243, 105, 41),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                TransactionLayout(),
                TransactionLayout(),
                TransactionLayout(),
                TransactionLayout(),
                TransactionLayout(),
                TransactionLayout(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
