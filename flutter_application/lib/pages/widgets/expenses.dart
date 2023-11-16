import 'package:flutter_application/models/expense_model.dart';

List<Expense> expenses = [
  Expense(
      name: "Yiyecek",
      price: 200.524,
      date: DateTime.now(),
      category: Category.Food),
  Expense(
      name: "Flutter Udemy Course",
      price: 200,
      date: DateTime.now(),
      category: Category.Education),
];
