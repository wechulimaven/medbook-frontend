import 'package:flutter/material.dart';

enum SnackTypes { success, error, information }

class Snack {
  // error snack
  static void error(String message, BuildContext ctx) {
    snack(SnackTypes.error, message, ctx);
  }

  static void success(String message, BuildContext ctx) {
    snack(SnackTypes.success, message, ctx);
  }

  static void info(String message, BuildContext ctx) {
    snack(SnackTypes.information, message, ctx);
  }

  static void snack(SnackTypes type, String message, BuildContext ctx) {
    final scaffold = ScaffoldMessenger.of(ctx);
    scaffold.showSnackBar(
      SnackBar(
        margin: EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        backgroundColor: snackProperties(type)['color'],
        content: Row(
          children: [
            Icon(
              snackProperties(type)['icon'],
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(child: Text(message))
          ],
        ),
      ),
    );
  }

  static Map snackProperties(SnackTypes types) {
    var sProperties = {};
    switch (types) {
      case SnackTypes.error:
        sProperties['color'] = Colors.red;
        sProperties['icon'] = Icons.error;
        break;
      case SnackTypes.information:
        sProperties['color'] = Colors.orange;
        sProperties['icon'] = Icons.info;
        break;
      case SnackTypes.success:
        sProperties['color'] = Colors.green;
        sProperties['icon'] = Icons.done;
        break;
      default:
        throw 'Select snack type';
    }
    return sProperties;
  }
}
