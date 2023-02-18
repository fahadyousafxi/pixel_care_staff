import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class CurrentDate extends StatefulWidget {
  const CurrentDate({Key? key}) : super(key: key);

  @override
  State<CurrentDate> createState() => _CurrentDateState();
}

class _CurrentDateState extends State<CurrentDate> {
  DateTime _selectedDate = DateTime.now();

  List<int> _years =
      List<int>.generate(100, (int index) => DateTime.now().year + index);
  List<String> _months = [];
  List<int> _days = List<int>.generate(
      DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day,
      (int index) => index + 1);

  int _selectedYear = DateTime.now().year;

  @override
  void initState() {
    // TODO: implement initState
    _months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    _selectedMonth = _months[DateTime.now().month - 1];
    super.initState();
  }

  int _selectedDay = DateTime.now().day;
  String _selectedMonth = "";
  DropdownButton<int> _buildYearDropdown() {
    return DropdownButton<int>(
      value: _selectedYear,
      onChanged: (int? value) {
        setState(() {
          _selectedYear = value!;
          _updateDays();
        });
      },
      items: _years.map((int year) {
        return DropdownMenuItem<int>(
          value: year,
          child: Text(year.toString()),
        );
      }).toList(),
    );
  }

  DropdownButton<String> _buildMonthDropdown() {
    return DropdownButton<String>(
      value: _selectedMonth,
      onChanged: (String? value) {
        setState(() {
          _selectedMonth = value!;
          _updateDays();
        });
      },
      items: _months.map((String month) {
        return DropdownMenuItem<String>(
          value: month,
          child: Text(month),
        );
      }).toList(),
    );
  }

  DropdownButton<int> _buildDayDropdown() {
    return DropdownButton<int>(
      value: _selectedDay,
      onChanged: (int? value) {
        setState(() {
          _selectedDay = value!;
        });
      },
      items: _days.map((int day) {
        return DropdownMenuItem<int>(
          value: day,
          child: Text(day.toString()),
        );
      }).toList(),
    );
  }

  void _updateDays() {
    _days = List<int>.generate(
        DateTime(_selectedYear, _months.indexOf(_selectedMonth) + 1, 0).day,
        (int index) => index + 1);
    if (_selectedDate.isBefore(DateTime(
        _selectedYear, _months.indexOf(_selectedMonth) + 1, _selectedDay))) {
      _selectedDay = 1;
    }
  }

// DateTime now = DateTime.now();

// List<int> years = List<int>.generate(100, (int index) => DateTime.now().year - index);
// List<int> months = List<int>.generate(12, (int index) => index + 1);
// List<int> days = List<int>.generate(
//     DateTime(now.year, now.month + 1, 0).day, (int index) => index + 1);

// int selectedYear = now.year;
// int selectedMonth = now.month;
// int selectedDay = now.day;

// DropdownButton<int> buildYearDropdown() {
//   return DropdownButton<int>(
//     value: selectedYear,
//     onChanged: (int? value) {
//       setState(() {
//         selectedYear = value!;
//         selectedDay = 1;
//         if (selectedYear == now.year) {
//           months = List<int>.generate(now.month, (int index) => index + 1);
//           days = List<int>.generate(
//               DateTime(now.year, now.month, 0).day, (int index) => index + 1);
//         } else {
//           months = List<int>.generate(12, (int index) => index + 1);
//           days = List<int>.generate(
//               DateTime(selectedYear, selectedMonth + 1, 0).day,
//               (int index) => index + 1);
//         }
//       });
//     },
//     items: years.map((int year) {
//       return DropdownMenuItem<int>(
//         value: year,
//         child: Text(year.toString()),
//       );
//     }).toList(),
//   );
// }

// DropdownButton<int> buildMonthDropdown() {
//   return DropdownButton<int>(
//     value: selectedMonth,
//     onChanged: (int? value) {
//       setState(() {
//         selectedMonth = value!;
//         selectedDay = 1;
//         days = List<int>.generate(
//             DateTime(selectedYear, selectedMonth + 1, 0).day,
//             (int index) => index + 1);
//       });
//     },
//     items: months.map((int month) {
//       return DropdownMenuItem<int>(
//         value: month,
//         child: Text(month.toString()),
//       );
//     }).toList(),
//   );
// }

// DropdownButton<int> buildDayDropdown() {
//   return DropdownButton<int>(
//     value: selectedDay,
//     onChanged: (int? value) {
//       setState(() {
//         selectedDay = value!;
//       });
//     },
//     items: days.map((int day) {
//       return DropdownMenuItem<int>(
//         value: day,
//         child: Text(day.toString()),
//       );
//     }).toList(),
//   );
// }

  // TextEditingController _dateController = TextEditingController();

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     initialDatePickerMode: DatePickerMode.year,
  //     initialEntryMode: DatePickerEntryMode.input,
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime(2100),
  //   );
  //   if (picked != null)
  //     setState(() {
  //       _dateController.text = DateFormat('dd-MM-yyyy').format(picked);
  //     });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildYearDropdown(),
                SizedBox(width: 16),
                _buildMonthDropdown(),
                SizedBox(width: 16),
                _buildDayDropdown(),
              ],
            )
            //   Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       TextField(
            //         controller: _dateController,
            //         decoration: InputDecoration(
            //           labelText: 'Date',
            //           suffixIcon: IconButton(
            //             icon: Icon(Icons.calendar_today),
            //             onPressed: () {
            //               _selectDate(context);
            //             },
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // )
            ));
  }
}
