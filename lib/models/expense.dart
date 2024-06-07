import 'package:uuid/uuid.dart';

const uuid = Uuid();
enum Category { food, housing, transportation, utilities, medical, insurance, clothing, entertainment, personal, other }
class Expense {
  Expense({required this.title, required this.category, required this.amount, required this.date})
      : id = uuid.v4();
  final String id;
  final String title;
  final String amount;
  final DateTime date;
  final Category category;
}
