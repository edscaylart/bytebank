import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  final String _name;
  final String _cardNumber;

  CreditCard(this._name, this._cardNumber);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: (MediaQuery.of(context).size.width * 0.5),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20),
              ),
            ),
          ),
          Container(
            height: 100,
            width: 130,
            decoration: BoxDecoration(
                color: Colors.amber[100],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(100))),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 0, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'images/mastercard.png',
                  height: 40,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(_name.toUpperCase()),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                        ),
                        child: Text(
                          _cardNumber,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
