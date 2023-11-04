import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final VoidCallback onPressed;

  PrimaryButton(
      {required this.text, required this.iconData, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData),
            SizedBox(
              width: 10.0,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 17.0),
            )
          ],
        ));
  }
}
