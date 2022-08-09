import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

AwesomeDialog customAlertDialog({
  required BuildContext context,
  required String message,
  dynamic returnValue,
}) =>
    AwesomeDialog(
      context: context,
      dismissOnTouchOutside: false,
      animType: AnimType.TOPSLIDE,
      dialogType: DialogType.INFO,
      title: message,
      btnOkIcon: Icons.check_circle,
      btnOkColor: Colors.blue[200],
      btnOkOnPress: () {
        Navigator.pop(context, returnValue);
      },
    );
