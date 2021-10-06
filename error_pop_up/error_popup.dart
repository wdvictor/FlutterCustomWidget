import 'package:flutter/material.dart';

class ErrorPopUp extends StatefulWidget {
  const ErrorPopUp(
      {Key? key,
      // @required required this.exceptionPhrase,
      @required required this.exceptionCode,
      this.previousPageContext})
      : super(key: key);
  // final String exceptionPhrase;
  final String exceptionCode;

  /// If the **[previousPageContext]** is not null , then
  /// the close function of the popUp will pop the
  /// page that called the pop-up.
  ///    Usefully when the page that called the popup
  /// can't work without the error disappears.
  final BuildContext? previousPageContext;

  @override
  _ErrorPopUpState createState() => _ErrorPopUpState();
}

class _ErrorPopUpState extends State<ErrorPopUp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: RichText(
        text: TextSpan(
            text: 'Um erro aconteceu!\n\n',
            children: <InlineSpan>[
              const TextSpan(
                text: '',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.normal),
              ),
              TextSpan(
                text: '\t\t(${widget.exceptionCode})',
                style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.normal,
                    fontSize: 9.5),
              )
            ],
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15.0)),
      ),
      actions: <Widget>[
        TextButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) => Colors.white),
                backgroundColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) => Colors.blue[900])),
            onPressed: () {
              Navigator.pop(context);
              if (widget.previousPageContext != null) {
                Navigator.pop(widget.previousPageContext!);
              }
            },
            child: const Text('OK'))
      ],
    );
  }
}
