import 'package:bytebank/components/balance.dart';
import 'package:bytebank/components/credit_card.dart';
import 'package:bytebank/components/page_button.dart';
import 'package:bytebank/screens/contact_list_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[800],
      appBar: AppBar(
        title: Image.asset(
          'images/logo.png',
          height: 35,
        ),
        backgroundColor: Colors.teal[800],
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'Hi, Edson',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Balance(3567),
                CreditCard('Edson F Souza', '3759•••••2100')
              ],
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            height: 110,
            child: ListView(
              padding: EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              children: [
                PageButton(
                  title: 'Manage contacts',
                  color: Colors.cyan,
                  icon: Icons.people,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ContactListPage(),
                      ),
                    );
                  },
                ),
                PageButton(
                  title: 'Transfers',
                  color: Colors.green,
                  icon: Icons.monetization_on,
                  onTap: () {},
                ),
                PageButton(
                  title: 'History',
                  color: Colors.deepOrange,
                  icon: Icons.history,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
