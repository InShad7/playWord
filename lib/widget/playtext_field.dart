import 'package:flutter/material.dart';
import 'package:playwords/widget/check_index.dart';
import 'package:playwords/widget/text_field.dart';

class PlayTextField extends StatelessWidget {
  const PlayTextField({
    super.key,
    required this.myControler,
    required this.label,
    required this.keyboardType,
    required this.data,
    required this.row,
  });
  final TextEditingController myControler;
  final String label;
  final TextInputType keyboardType;
  final Map<String, List<int>> data;
  final int row;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: TextFormField(
        controller: myControler,
        cursorColor: black,
        onChanged: (value) {
          String news = value.toString();
          // print(
              // '${news[news.length-1]} --------------------------------------------------------------------------------');
          // indexcheck(data[news[news.length-1]] ?? 4, row);
        },
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
