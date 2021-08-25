import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;
  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text,
        enteredAmout = int.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmout <= 0 || _selectedDate == null) {
      return;
    }
    widget.addNewTransaction(
      enteredTitle,
      enteredAmout,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatPicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          // elevation: 0,
          child: Container(
            padding: EdgeInsets.only(
              left: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
              right: 10,
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: "Title"),
                  controller: _titleController,
                  onSubmitted: (_) => _submitData(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Amount"),
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => _submitData(),
                ),
                Container(
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _selectedDate == null
                              ? 'No Date Chosen'
                              : 'Picked Date: ${DateFormat.yMMMd().format(_selectedDate)}',
                        ),
                      ),
                      FlatButton(
                        onPressed: _presentDatPicker,
                        child: Text(
                          "Chose Date",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        textColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: _submitData,
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).textTheme.button.color,
                  child: Text("Add Transaction"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
