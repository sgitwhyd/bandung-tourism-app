import 'package:flutter/material.dart';

class ScrollingScreen extends StatelessWidget {
  final String message;

  const ScrollingScreen(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          color: Colors.blue,
        )),
        Expanded(
            child: Container(
          color: Colors.red,
        )),
        Expanded(
            child: Container(
          color: Colors.orange,
        ))
      ],
    );
  }
}
