import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';

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

  void _openAddExpenseOverlay() {

    showModalBottomSheet(
      useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              onAddExpense: _addExpense,
            ));
  }

  void _addExpense(Expense value) {
    setState(() {
      _registeredExpenses.add(value);
    });
  }

  void _removeExpense(Expense value) {
    final expenseIndex = _registeredExpenses.indexOf(value);
    setState(() {
      _registeredExpenses.remove(value);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Expense Deleted"),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, value);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text("No Expense Found. Start adding some"),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          onRemoveExpense: _removeExpense, expenses: _registeredExpenses);
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Expense Tracker"),
          actions: [
            IconButton(
                onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
          ],
        ),
        body: Center(
          child: width < 600 ?  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Chart(expenses: _registeredExpenses),

              Expanded(child: mainContent),
            ],
          ):Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Chart(expenses: _registeredExpenses)),

              Expanded(child: mainContent),
            ],),
        ));
  }
}
