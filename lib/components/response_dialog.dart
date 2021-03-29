import 'package:flutter/material.dart';

class ResponseDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final IconData icon;
  final Color color;

  ResponseDialog({
    this.title,
    this.message,
    this.buttonText = 'Ok',
    this.icon = Icons.info,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 60,
              width: 60,
              child: Icon(
                icon,
                color: color,
                size: 32,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: color,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(100)),
            ),
            Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              message,
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),
            ElevatedButton(
              child: Text(buttonText),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}

class SuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;

  SuccessDialog(
    this.message, {
    this.title = 'Success',
    this.icon = Icons.done,
  });

  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
      title: title,
      message: message,
      icon: icon,
      color: Colors.green,
    );
  }
}

class FailureDialog extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;

  FailureDialog(
    this.message, {
    this.title = 'Failure',
    this.icon = Icons.warning,
  });

  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
      title: title,
      message: message,
      icon: icon,
      color: Colors.red,
    );
  }
}
