import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Material;

///Use **ActionButton** has children to **ExpandableFab**
@immutable
class ActionButton extends StatelessWidget {
  const ActionButton(
      {Key? key,
      required this.onPressed,
      required this.icon,
      required this.color,
      required this.title})
      : super(key: key);

  final VoidCallback onPressed;
  final Widget icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Material(
        clipBehavior: Clip.antiAlias,
        color: color,
        borderRadius: BorderRadius.circular(30),
        elevation: 4.0,
        child: SizedBox(
          height: 40,
          width: 160,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(title,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: CupertinoColors.white,
                      fontSize: 15)),
              icon
            ],
          ),
        ),
      ),
    );
  }
}
