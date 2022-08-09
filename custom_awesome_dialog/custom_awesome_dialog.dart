import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

///Create a successfully pop-up in case of [isSuccessOperation] be true. Otherwise return
///an error pop-up.
AwesomeDialog customAwesomeDialog({
  required BuildContext context,
  required String message,
  required bool isSuccessOperation,
}) =>
    AwesomeDialog(
        context: context,
        dismissOnTouchOutside: false,
        animType: AnimType.TOPSLIDE,
        dialogType: isSuccessOperation ? DialogType.SUCCES : DialogType.ERROR,
        title: message,
        btnOkIcon: Icons.check_circle,
        btnOkColor: isSuccessOperation ? Colors.greenAccent : Colors.redAccent,
        btnOkOnPress: () {
          Navigator.pop(context, isSuccessOperation);
        });
