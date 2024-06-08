import 'package:expense_tracker/widgets/expenses-list/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {required this.onRemoveExpense, required this.expenses, super.key});
  final List<Expense> expenses;
 final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.45),
            margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal,
                vertical: Theme.of(context).cardTheme.margin!.vertical),
          ),
          key: ValueKey(expenses[index].id),
          onDismissed: (direction) => {onRemoveExpense(expenses[index])},
          child: ExpensesItem(expense: expenses[index])),
      itemCount: expenses.length,
    );
  }
}
