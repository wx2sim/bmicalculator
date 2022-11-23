import 'package:flutter/material.dart';

class RoundIconBotton extends StatelessWidget {
  RoundIconBotton({this.icon, this.OnPressed});
  final IconData icon;
  final Function OnPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: OnPressed,
      elevation: 0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
