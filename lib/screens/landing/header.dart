import 'package:flutter/material.dart';

class header extends StatelessWidget {
  const header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Column(
              children: [
                Container(
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
                        // height: MediaQuery.of(context).size.height * 0.2,
                        child: Image.asset(
                          'assets/images/strokeimage.png',
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            size: 32.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                          SizedBox(width: 20),
                          CircleAvatar(
                            radius: 22.0, // Adjust radius for desired size
                            backgroundImage: AssetImage(
                                'assets/images/profile.jpg'), // Replace with your image path
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
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Text(
                                'Current Balance',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              Text(
                                'Nu. 10,009',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text(
                                'Targeted Budget',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              Text(
                                'Nu. 50,000',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                          color: const Color.fromARGB(255, 40, 40, 40)
                              .withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Column(
                            children: [
                              Text(
                                "Total Income",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 79, 79, 79),
                                    fontFamily: 'poppins'),
                              ),
                              Text(
                                "Nu. 10,000",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Total Expenses",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 79, 79, 79),
                                    fontFamily: 'poppins'),
                              ),
                              Text(
                                "Nu. 9,000",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
