import 'package:expense_tracker/models/expense.dart';

import 'package:expense_tracker/widgets/new-expense-screen/new_expense.dart';
import 'package:flutter/material.dart';

import 'expenses-list/list_expenses.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "flutter course",
        category: Category.personal,
        amount: "549",
        date: DateTime.now()),
    Expense(
        title: "Movie",
        category: Category.entertainment,
        amount: "300",
        date: DateTime.now()),
  ];

  void _openAddExpenseOverlay(){
      showModalBottomSheet(context: context, builder: (ctx) =>const NewExpense());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const Text("Flutter Expense Tracker"),
          actions: [IconButton(onPressed:_openAddExpenseOverlay, icon: const Icon(Icons.add))],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Current Chart"),
              Expanded(child: ExpensesList(expenses: _registeredExpenses)),
            ],
          ),
        ));
  }
}
