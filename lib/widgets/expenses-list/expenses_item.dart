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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title,style: Theme.of(context).textTheme.titleLarge,),
            const SizedBox(height: 4,),
            Row(
              children: [

                Text("Rs.${expense.amount}",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category],color: Theme.of(context).colorScheme.primary,),
                    const SizedBox(width: 4,),
                    Text(expense.formattedDate,style: TextStyle(color: Theme.of(context).colorScheme.primary),),
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
