import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key key,
    @required this.userTransaction,
    @required this.deleteItem,
  }) : super(key: key);

  final Transaction userTransaction;
  final Function deleteItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: FittedBox(
              child: Text('Rs ${userTransaction.amount}'),
            ),
          ),
        ),
        title: Text(
          userTransaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(userTransaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 420
            ? FlatButton.icon(
                textColor: Theme.of(context).errorColor,
                onPressed: () => deleteItem(userTransaction.id),
                icon: Icon(Icons.delete),
                label: Text("Delete Object"),
              )
            : IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () => deleteItem(userTransaction.id),
              ),
      ),
    );
  }
}
