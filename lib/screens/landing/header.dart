// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:expancetracker/api/api_service.dart';
import 'package:expancetracker/models/summary_model.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  late Future<SummaryModel> _summaryData;

  @override
  void initState() {
    super.initState();
    _summaryData =
        ApiService().getSummary().then((data) => SummaryModel.fromJson(data));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SummaryModel>(
      future: _summaryData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          var summary = snapshot.data!;

          return Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Image.asset('assets/images/headerimage.png',
                            fit: BoxFit.cover),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: SizedBox(
                              child: Image.asset(
                                'assets/images/logo.png',
                                color: Colors.white,
                                width: 120,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  size: 32.0,
                                  semanticLabel:
                                      'Text to announce in accessibility modes',
                                ),
                                SizedBox(width: 20),
                                CircleAvatar(
                                  radius: 22.0,
                                  backgroundImage:
                                      AssetImage('assets/images/profile.jpg'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                          height: 1,
                          width: double.infinity,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Current Balance',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 14),
                                ),
                                Text(
                                  'Nu. ${summary.openingBalance}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 213, 213, 213)
                                    .withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 100,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.arrow_downward_outlined,
                                            size: 30,
                                            color: const Color.fromARGB(
                                                255, 0, 136, 5)),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Total Income",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 79, 79, 79),
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          Text(
                                            "Nu. ${summary.totalIncome}",
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.arrow_upward_outlined,
                                            color: const Color.fromARGB(
                                                255, 181, 12, 0),
                                            size: 30)
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Total Expenses",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 41, 41, 41),
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          Text(
                                            "Nu. ${summary.totalExpenses}",
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: Color.fromARGB(
                                                  255, 41, 41, 41),
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Poppins',
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        }
        return Center(child: Text('No data available'));
      },
    );
  }
}
