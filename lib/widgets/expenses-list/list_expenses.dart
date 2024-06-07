import 'package:expense_tracker/widgets/expenses-list/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({required this.expenses, super.key});
  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(itemBuilder: (context,index)=>  ExpensesItem(expense: expenses[index]),itemCount: expenses.length,);
  }
}
