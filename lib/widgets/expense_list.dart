import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  final List<Map<String, dynamic>> expenses;
  final Function(int) onDeleteExpense;

  ExpenseList({required this.expenses, required this.onDeleteExpense});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: ListTile(
            title: Text(expenses[index]['name']),
            subtitle: Text('\$${expenses[index]['amount'].toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              color: Theme.of(context).colorScheme.error,
              onPressed: () => onDeleteExpense(index),
            ),
          ),
        );
      },
    );
  }
}
