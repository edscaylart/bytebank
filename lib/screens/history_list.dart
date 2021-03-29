import 'package:bytebank/components/circle_progress.dart';
import 'package:bytebank/components/transaction_item.dart';
import 'package:bytebank/models/models.dart';
import 'package:bytebank/services/repository/transaction_repository.dart';
import 'package:bytebank/utils/route.dart';
import 'package:flutter/material.dart';

class HistoryListPage extends StatefulWidget with NamedRoute {
  @override
  _HistoryListPageState createState() => _HistoryListPageState();

  @override
  String get routeName => '/history-list';
}

class _HistoryListPageState extends State<HistoryListPage> {
  final TransactionRepository _repository = TransactionRepository();

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
        width: double.maxFinite,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Transactions feed',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FutureBuilder(
                initialData: [],
                future: _repository.fetchTransactions(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      break;
                    case ConnectionState.waiting:
                      return CircleProgress(message: 'loading transactions');
                    case ConnectionState.active:
                      break;
                    case ConnectionState.done:
                      final List<Transaction> transactions = snapshot.data;
                      if (transactions.length == 0) {
                        return Center(
                          child: Text('No transaction found'),
                        );
                      }
                      return Expanded(
                        child: ListView.builder(
                          itemCount: transactions.length,
                          itemBuilder: (context, index) {
                            final Transaction transaction = transactions[index];
                            return TransactionItem(transaction: transaction);
                          },
                        ),
                      );
                  }
                  return Center(
                    child: Text('Error to list all transactions'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
