import 'package:flutter/material.dart';
class Textfield extends StatelessWidget {
  const Textfield({super.key, this.controller, this.hint});

  final controller;
  final hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller,
          decoration:InputDecoration(
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    fillColor: Colors.white,
    filled: true, hintText: hint,
              hintStyle: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)
    ),

    );
  }
}
