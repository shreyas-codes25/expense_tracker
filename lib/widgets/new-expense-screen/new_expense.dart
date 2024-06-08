
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/models/expense.dart';
class NewExpense extends StatefulWidget {
  const NewExpense({required this.onAddExpense, super.key});

  final Function(Expense expense) onAddExpense;
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.other;
  final formatter = DateFormat.yMd();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final date = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
      initialDate: now,
    );
    setState(() {
      _selectedDate = date;
    });
  }
  void _submitExpenseData(){

    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
      if(_titleController.text.trim().isEmpty || amountIsInvalid || _selectedDate == null){
        showDialog(context: context, builder: (ctx)=>AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text("Please make sure a valid title, amount, date and category are entered"),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(ctx);
            }, child: const Text("Okay"))
          ],
        ));

      }

    widget.onAddExpense(Expense(
      title: _titleController.text,
      amount: _amountController.text,
      date: _selectedDate!,
      category: _selectedCategory,
    ));
    Navigator.of(context).pop();
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Enter Title"),


            ),style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(

                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: "Rs.",
                    label: Text("Enter Amount"),
                  ),
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_selectedDate == null
                        ? "No Selected Date"
                        : formatter.format(_selectedDate!),style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_month))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16,),
          Row(
            children: [
              DropdownButton(
                icon: Icon(Icons.arrow_drop_down,color: Theme.of(context).colorScheme.primary),
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        alignment: AlignmentDirectional.center,
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                elevation: 16,
                dropdownColor: Theme.of(context).colorScheme.secondaryContainer,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text("Add Expense"),
              ),
              const SizedBox(
                width: 12,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"))
            ],
          )
        ],
      ),
    );
  }
}
