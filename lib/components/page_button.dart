import 'package:flutter/material.dart';

class PageButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final MaterialColor color;
  final Function() onTap;

  PageButton({
    @required this.title,
    @required this.icon,
    @required this.color,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.0),
      child: Material(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: color[500],
        child: InkWell(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          onTap: onTap,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: color[500],
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 16, left: 16),
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 16, right: 16),
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    icon,
                    color: color[100],
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
