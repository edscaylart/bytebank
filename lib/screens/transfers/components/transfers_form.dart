import 'package:flutter/material.dart';

class TransfersForm extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final Widget label;
  final String hintText;
  final String prefixText;
  final IconData fabIcon;
  final Color fabColor;
  final Function onPressed;
  final TextInputType keyboardType;

  TransfersForm(
      {this.controller,
      this.title = 'Who do you want to transfer to?',
      this.label,
      this.hintText,
      this.prefixText,
      this.fabIcon = Icons.chevron_right,
      this.fabColor = Colors.cyan,
      this.onPressed,
      this.keyboardType = TextInputType.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[800],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Image.asset('images/logo-min.png', height: 30)],
        ),
        backgroundColor: Colors.cyan[800],
        elevation: 0,
      ),
      body: Container(
        height: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.cyan[50],
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 32, left: 16, right: 16),
          child: Column(
            children: [
              Text(
                this.title,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              this.label != null ? this.label : SizedBox(),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 40),
                  child: TextField(
                    autofocus: true,
                    controller: this.controller,
                    decoration: InputDecoration(
                      hintText: this.hintText,
                      prefixText: this.prefixText,
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                    keyboardType: this.keyboardType,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: this.fabColor,
        child: Icon(this.fabIcon),
        onPressed: this.onPressed,
      ),
    );
  }
}
