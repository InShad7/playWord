import 'package:flutter/material.dart';
import 'package:playwords/grid_screen.dart';
import 'package:playwords/widget/text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

TextEditingController rowController = TextEditingController();
TextEditingController columnController = TextEditingController();
TextEditingController alphaControler = TextEditingController();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: black,
        title: Text('Enter Grid Size'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Enter the numbers of Rows, Columns and the Alphabhets",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                CustomTextField(
                  myControler: rowController,
                  label: 'Rows',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(width: 50),
                CustomTextField(
                  myControler: columnController,
                  label: 'Columns',
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
            AlphaTextField(
              myControler: alphaControler,
              label: "Alphabhets",
              keyboardType: TextInputType.name,
            ),
            ElevatedButton.icon(
              onPressed: () {
                int row = int.tryParse(rowController.text) ?? 0;
                int column = int.tryParse(columnController.text) ?? 0;
                String alpha = alphaControler.text;
                alpha.isNotEmpty
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GridScreen(
                            rows: row,
                            columns: column,
                            alphabets: alpha,
                          ),
                        ),
                      )
                    : null;
                rowController.clear();
                columnController.clear();
                alphaControler.clear();
              },
              icon: const Icon(Icons.tag),
              label: const Text('Make Grid'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}


