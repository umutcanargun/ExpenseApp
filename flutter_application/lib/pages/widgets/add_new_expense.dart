import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // Controller
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime date = DateTime.now();
  List<String> list = <String>['Food', 'Education', 'Travel', 'Work'];
  String selectedCategory = '';

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
          const Spacer(),
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
          const Spacer(),
          Row(
            children: [
              Text('Kategori Seciniz:',
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      color: Color.fromARGB(255, 110, 110, 110))),
              const Spacer(),
              DropdownButton<String>(
                value: list[0],
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    selectedCategory = value!;
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              print("Kayıt başarılı: ${_nameController.text}");
            },
            child: const Text(("Kaydet"),
                style: TextStyle(
                    fontFamily: 'Raleway',
                    color: Color.fromARGB(255, 255, 255, 255))),
            style: ElevatedButton.styleFrom(shape: StadiumBorder()),
          ),
        ],
      ),
    );
  }
}
