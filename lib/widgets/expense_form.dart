import 'package:flutter/material.dart';

class ExpenseForm extends StatefulWidget {
  final Function(String, double) onAddExpense;

  ExpenseForm({required this.onAddExpense});

  @override
  _ExpenseFormState createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();

  void _submitData() {
    final name = _nameController.text;
    final amount = double.tryParse(_amountController.text) ?? 0.0;

    if (name.isEmpty || amount <= 0) {
      return; // Add validation logic here
    }

    widget.onAddExpense(name, amount);
    _nameController.clear();
    _amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Expense Name'),
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _submitData,
              child: Text('Add Expense'),
            ),
          ],
        ),
      ),
    );
  }
}
