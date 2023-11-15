import 'package:flutter_application/pages/widgets/expense_list.dart';
import 'package:flutter_application/pages/widgets/add_new_expense.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 119, 236, 123),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          "Expense App",
          style: TextStyle(
              fontFamily: 'Raleway', color: Color.fromARGB(255, 110, 110, 110)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context, builder: (ctx) => NewExpense());
              },
              icon: const Icon(Icons.add,
                  color: Color.fromARGB(255, 110, 110, 110))),
        ],
      ),
      body: ExpenseList(),
    );
  }
}
