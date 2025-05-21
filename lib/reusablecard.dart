import "package:flutter/material.dart";

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;

  ReusableCard(this.colour, [this.cardChild]); // cardChild is optional

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
      child: cardChild ?? Container(),
    );
  }
}
