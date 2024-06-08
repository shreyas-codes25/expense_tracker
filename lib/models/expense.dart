import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
const uuid = Uuid();
final formatter = DateFormat.yMd();
enum Category { food, housing, transportation, utilities, medical, insurance, clothing, entertainment, personal, other }
const categoryIcons = {
  Category.food : Icons.lunch_dining,
  Category.housing : Icons.home,
  Category.transportation : Icons.train,
  Category.utilities : Icons.electric_bolt,
  Category.medical : Icons.local_hospital,
  Category.insurance : Icons.health_and_safety,
  Category.clothing : Icons.umbrella,
  Category.entertainment : Icons.movie,
  Category.personal : Icons.person,
  Category.other : Icons.more_horiz,
};
class Expense {
  Expense({required this.title, required this.category, required this.amount, required this.date})
      : id = uuid.v4();
  final String id;
  final String title;
  final String amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket{

}
