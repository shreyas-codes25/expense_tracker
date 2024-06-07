import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

import 'expenses-list/list_expenses.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(title: "flutter course", category: Category.personal, amount: "549", date: DateTime.now()),
    Expense(title: "Movie", category: Category.entertainment, amount: "300", date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("data"),
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    ));
  }
}
