import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

//11:10
class _NewExpenseState extends State<NewExpense> {
  // Controller
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            maxLength: 50,
            decoration: const InputDecoration(
                label: Text("Expense Name",
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Color.fromARGB(255, 110, 110, 110)))),
          ),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                label: Text("Amount",
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Color.fromARGB(255, 110, 110, 110))),
                prefixText: "₺"),
          ),
          IconButton(
              onPressed: () async {
                {
                  DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2023),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary: Colors.amberAccent, // <-- SEE HERE
                              onPrimary: Colors.redAccent, // <-- SEE HERE
                              onSurface: Colors.blueAccent, // <-- SEE HERE
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                foregroundColor:
                                    Colors.red, // button text color
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      });

                  if (newDate == null) return;
                  setState(() {
                    date = newDate;
                  });
                }
              },
              icon: const Icon(Icons.calendar_month)),
          const Text("Tarih Seçiniz..",
              style: TextStyle(
                  fontFamily: 'Raleway',
                  color: Color.fromARGB(255, 110, 110,
                      110))), // seçilen tarihi formatlayarak yazdırmak..
          ElevatedButton(
            onPressed: () {
              print("Kayıt başarılı: ${_nameController.text}");
            },
            child: const Text(("Kaydet"),
                style: TextStyle(
                    fontFamily: 'Raleway',
                    color: Color.fromARGB(255, 110, 110, 110))),
            style: ElevatedButton.styleFrom(shape: StadiumBorder()),
          )
        ],
      ),
    );
  }
}
