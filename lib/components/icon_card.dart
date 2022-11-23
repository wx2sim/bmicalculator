import 'package:flutter/material.dart';

class iconcard extends StatelessWidget {
  final IconData icon;
  final String Label;
  iconcard({this.icon, this.Label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 60.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          Label,
          style: TextStyle(
              fontSize: 20, color: Color.fromARGB(255, 196, 197, 210)),
        )
      ],
    );
  }
}
