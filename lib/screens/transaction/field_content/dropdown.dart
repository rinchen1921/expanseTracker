// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";

class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String? selectedDropdownValue;
  final List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Account",
            style: TextStyle(
              fontFamily: "Poppins",
              color: const Color.fromARGB(255, 69, 69, 69),
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedDropdownValue,
              hint: Text("Select account"),
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              isExpanded: true,
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Poppins",
                fontSize: 14,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  selectedDropdownValue = newValue;
                });
              },
              items:
                  dropdownItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
