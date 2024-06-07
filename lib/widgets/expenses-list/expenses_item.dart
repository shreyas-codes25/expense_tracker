import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';


class ExpensesItem extends StatelessWidget {
  const ExpensesItem({required this.expense, super.key});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child:Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 4,),
            Row(
              children: [

                Text("Rs.${expense.amount}"),
                const Spacer(),
                Row(
                  children: [
                   const Icon(Icons.calendar_month),
                    const SizedBox(width: 4,),
                    Text(expense.date.toString()),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
