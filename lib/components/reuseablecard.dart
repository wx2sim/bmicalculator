import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  ReuseableCard({this.Coloor, this.CardChild});
  final Color Coloor;
  final Widget CardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Coloor,
      ),
      height: 200,
    );
  }
}
