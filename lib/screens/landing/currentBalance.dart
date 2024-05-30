// current_balance.dart

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expancetracker/api/api_service.dart';
import 'package:expancetracker/models/account_model.dart';

class CurrentBalance extends StatefulWidget {
  const CurrentBalance({super.key});

  @override
  State<CurrentBalance> createState() => _CurrentBalanceState();
}

class _CurrentBalanceState extends State<CurrentBalance> {
  late Future<List<AccountModel>> _futureAccounts;

  @override
  void initState() {
    super.initState();
    _futureAccounts = ApiService().fetchAccounts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Current Balance",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 243, 105, 41),
                fontFamily: "Poppins",
                fontSize: 16),
          ),
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: FutureBuilder<List<AccountModel>>(
              future: _futureAccounts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  List<AccountModel> accounts = snapshot.data!;
                  return Row(
                    children: accounts.map((account) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 231, 231, 231)
                                    .withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      account.title,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(account.img),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nu ${account.openingBalance}",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins",
                                        ),
                                      ),
                                      Text(
                                        "Nu ${account.openingBalance} this month",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: "Poppins",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
