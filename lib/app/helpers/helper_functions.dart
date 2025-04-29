import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HelperFunctions {
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static String formatDateToYear(String date) {
    return DateFormat('yyyy').format(DateTime.parse(date));
  }

  static String formatDateToDate(String date) {
    return DateFormat('dd MMM yyyy').format(DateTime.parse(date));
  }
}
