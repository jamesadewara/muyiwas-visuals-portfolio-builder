import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppHelpers {
  static String formatDate(DateTime date) {
    return DateFormat('MMM d, y').format(date);
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static String getInitials(String name) {
    List<String> names = name.split(' ');
    String initials = '';
    if (names.length > 1) {
      initials = '${names[0][0]}${names[1][0]}';
    } else if (name.isNotEmpty) {
      initials = names[0][0];
    }
    return initials.toUpperCase();
  }
}