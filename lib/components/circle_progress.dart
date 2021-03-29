import 'package:flutter/material.dart';

class CircleProgress extends StatelessWidget {
  final String message;

  CircleProgress({@required this.message});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          children: [
            CircularProgressIndicator(),
            Text(
              message,
              style: TextStyle(color: Colors.grey[500]),
            )
          ],
        ),
      ),
    );
  }
}
