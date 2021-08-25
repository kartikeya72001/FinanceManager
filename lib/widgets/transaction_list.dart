import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransaction;
  final Function deleteItem;
  TransactionList(this.userTransaction, this.deleteItem);
  @override
  Widget build(BuildContext context) {
    return userTransaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  "No Transactions Added Yet!!!",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 70,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, idx) {
              return ListItem(
                  userTransaction: userTransaction[idx],
                  deleteItem: deleteItem);
            },
            itemCount: userTransaction.length,
          );
  }
}
