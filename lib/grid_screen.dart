import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:playwords/widget/text_field.dart';

String inputWord = '';

class GridScreen extends StatefulWidget {
  final int rows;
  final int columns;
  final String alphabets;

  const GridScreen(
      {Key? key,
      required this.rows,
      required this.columns,
      required this.alphabets})
      : super(key: key);

  @override
  _GridScreenState createState() => _GridScreenState();
}

TextEditingController playController = TextEditingController();

class _GridScreenState extends State<GridScreen> {
  List<List<String>> grid = [];
  List<List<bool>> visited = [];

  @override
  void dispose() {
    playController.clear();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    visitedFalse();
  }

  @override
  Widget build(BuildContext context) {
    log(visited.toString());
    log(inputWord);
    List<String> alphabetList = widget.alphabets.split('');

    // Divide the alphabets into rows and columns
    grid = List.generate(
      widget.rows,
      (_) => List.filled(widget.columns, ''),
    );
    int index = 0;
    for (int i = 0; i < widget.rows; i++) {
      for (int j = 0; j < widget.columns; j++) {
        grid[i][j] = alphabetList[index];
        index++;
        if (index >= alphabetList.length) {
          break;
        }
      }
      if (index >= alphabetList.length) {
        break;
      }
      print(grid);
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('Grid'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            CustomTextField(
              myControler: playController,
              label: 'Play Text',
              keyboardType: TextInputType.name,
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: grid.length * grid[0].length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: grid[0].length),
                itemBuilder: (context, index) {
                  int row = index ~/ grid[0].length;
                  int col = index % grid[0].length;
                  return Container(
                    margin: EdgeInsets.all(2),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: visited[row][col]
                          ? Colors.green
                          : Color.fromARGB(255, 143, 198, 244),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        grid[row][col],
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              child: Text('Search'),
              onPressed: () {
                bool found = false;

                for (int i = 0; i < grid.length; i++) {
                  for (int j = 0; j < grid[0].length; j++) {
                    if (grid[i][j] == inputWord[0] && !visited[i][j]) {
                      found = findWord(inputWord, i, j);
                      if (found) break;
                    }
                  }
                  if (found) break;
                }

                setState(() {});
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            visited.clear();
            visitedFalse();
            log(visited.toString());
            playController.clear();
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  visitedFalse() {
    for (int i = 0; i < widget.rows; i++) {
      visited.add([]);
      for (int j = 0; j < widget.columns; j++) {
        visited[i].add(false);
      }
    }
  }

  bool findWord(String word, int i, int j) {
    if (word.length == 0) {
      return true;
    }

    // check if i, j is within the grid and not visited
    if (i < 0 ||
        j < 0 ||
        i >= widget.rows ||
        j >= widget.columns ||
        visited[i][j]) {
      return false;
    }

    // check if the current letter matches the next letter of the word
    if (grid[i][j] != word[0]) {
      return false;
    }

    // mark the current cell as visited
    visited[i][j] = true;

    // check all adjacent cells in all directions
    bool found = false;
    found = findWord(word.substring(1), i - 1, j) ||
        findWord(word.substring(1), i + 1, j) ||
        findWord(word.substring(1), i, j - 1) ||
        findWord(word.substring(1), i, j + 1) ||
        findWord(word.substring(1), i - 1, j - 1) ||
        findWord(word.substring(1), i - 1, j + 1) ||
        findWord(word.substring(1), i + 1, j - 1) ||
        findWord(word.substring(1), i + 1, j + 1);

    if (!found) {
      visited[i][j] = false;
    }

    return found;
  }
}
