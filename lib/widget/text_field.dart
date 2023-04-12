import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:playwords/grid_screen.dart';
import 'package:playwords/main.dart';
import 'package:playwords/widget/check_index.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.myControler,
      required this.label,
      required this.keyboardType,
      });
  final TextEditingController myControler;
  final String label;
  final TextInputType keyboardType;
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: TextFormField(
         onChanged: (value) {
                  inputWord = value.toString();
                },
        controller: myControler,
        cursorColor: black,
        style: TextStyle(color: black),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          counter: null,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: black, width: 2)),
          border: const OutlineInputBorder(),
          labelText: label,
          labelStyle: TextStyle(fontSize: 16, color: black),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          contentPadding: const EdgeInsets.all(5),
        ),
      ),
    );
  }
}

class AlphaTextField extends StatefulWidget {
  const AlphaTextField({
    super.key,
    required this.myControler,
    required this.label,
    required this.keyboardType,
  });
  final TextEditingController myControler;
  final String label;
  final TextInputType keyboardType;

  @override
  State<AlphaTextField> createState() => _AlphaTextFieldState();
}

int val = 1;

class _AlphaTextFieldState extends State<AlphaTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      onTap: () {
        log('aaaa');
        setState(() {
          int rows = int.parse(rowController.text);
          int columns = int.parse(columnController.text);
          val = rows * columns;
          // alphaControler.text = '';
        });
      },
     
      maxLength: val,
      controller: widget.myControler,
      cursorColor: black,
      style: TextStyle(color: black),
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        counter: null,
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: black, width: 2)),
        border: const OutlineInputBorder(),
        labelText: widget.label,
        labelStyle: TextStyle(fontSize: 16, color: black),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding: const EdgeInsets.all(5),
      ),
    );
  }
}

Color black = Colors.black;
