// recent_transaction.dart

// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';
import 'package:expancetracker/screens/landing/transaction_layout/transaction_layout.dart';
import 'package:expancetracker/api/api_service.dart';
import 'package:expancetracker/models/transaction_model.dart';

class RecentTransaction extends StatefulWidget {
  const RecentTransaction({Key? key}) : super(key: key);

  @override
  State<RecentTransaction> createState() => _RecentTransactionState();
}

class _RecentTransactionState extends State<RecentTransaction> {
  late Future<List<TransactionModel>> _futureTransactions;

  @override
  void initState() {
    super.initState();
    _futureTransactions = ApiService().fetchTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            "Recent Transactions",
            style: TextStyle(
                color: Color.fromARGB(255, 243, 105, 41),
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                fontSize: 16),
          ),
          SizedBox(height: 10),
          FutureBuilder<List<TransactionModel>>(
            future: _futureTransactions,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                List<TransactionModel> transactions = snapshot.data!;
                return SingleChildScrollView(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    children: transactions.map((transaction) {
                      return TransactionLayout(
                        title: transaction.title,
                        date: transaction.createdAt.toString(),
                        amount: transaction.amount,
                      );
                    }).toList(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
