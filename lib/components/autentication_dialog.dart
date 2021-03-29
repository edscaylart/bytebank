import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthenticationDialog extends StatefulWidget {
  final Function(String password) onConfirm;

  AuthenticationDialog({@required this.onConfirm});

  @override
  _AuthenticationDialogState createState() => _AuthenticationDialogState();
}

class _AuthenticationDialogState extends State<AuthenticationDialog> {
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter your 4 digit password'),
      content: TextField(
        autofocus: true,
        controller: _controller,
        obscureText: true,
        maxLength: 4,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(border: OutlineInputBorder()),
        style: TextStyle(
          fontSize: 40,
          letterSpacing: 32,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            widget.onConfirm(_controller.text);
            Navigator.pop(context);
          },
          child: Text('Confirm'),
        ),
      ],
    );
  }
}

// class PasswordBox extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       width: 50,
//       child: Center(
//         child: Text(
//           '•',
//           style: TextStyle(
//             fontSize: 32,
//           ),
//         ),
//       ),
//       decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey[500], width: 2),
//           borderRadius: BorderRadius.all(Radius.circular(10))),
//     );
//   }
// }
