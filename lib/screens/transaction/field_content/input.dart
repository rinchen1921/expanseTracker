// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final String title;
  final String placeholder;

  const Input({
    required this.title,
    required this.placeholder,
    Key? key,
  }) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  TextEditingController _controller = TextEditingController();

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
          Padding(padding: EdgeInsets.only(top: 10)),
          Text(
            widget.title,
            style: TextStyle(
              fontFamily: "Poppins",
              color: const Color.fromARGB(255, 69, 69, 69),
            ),
          ),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide.none,
              ),
              hintText: widget.placeholder,
              hintStyle: TextStyle(
                fontFamily: "Poppins",
              ),
            ),
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: "Poppins",
            ),
            onChanged: (value) {
              // You can perform any action here with the updated input value
              print('Input value: $value');
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
