import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Functions {
  var belts = {
    "white": "0",
    "yellow": "10",
    "orange": "20",
    "blue": "30",
    "darkBlue": "40",
    "green": "50",
    "purple": "60",
    "brown": "70",
    "brown1": "80",
    "brown2": "90",
    "black": "100",
  };
  getBetProgress(beltName) {
    return belts[beltName];
  }

  DateTime stringToDateTime(String date, String format) {
    DateFormat mFormat = DateFormat(format);
    return mFormat.parse(date);
  }

  String dateTimeToString(DateTime date, String format) {
    DateFormat mFormat = DateFormat(format);
    return mFormat.format(date);
  }
  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
