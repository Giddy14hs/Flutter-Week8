import 'package:flutter/material.dart';
import 'package:tracker_expense/widgets/expense_form.dart';
import 'package:tracker_expense/widgets/expense_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _expenses = [];

  void _addExpense(String name, double amount) {
    setState(() {
      _expenses.add({'name': name, 'amount': amount});
    });
  }

  void _deleteExpense(int index) {
    setState(() {
      _expenses.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: Column(
        children: [
          ExpenseForm(onAddExpense: _addExpense),
          Expanded(child: ExpenseList(expenses: _expenses, onDeleteExpense: _deleteExpense)),
        ],
      ),
    );
  }
}
