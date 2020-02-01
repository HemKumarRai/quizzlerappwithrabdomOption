import 'package:flutter/material.dart';
import 'main.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Answer"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                questionBrain.knowAnswer(),
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
