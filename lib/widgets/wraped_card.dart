import 'package:dog_breeds_app/constants.dart';
import 'package:flutter/material.dart';

class WrappedCard extends StatelessWidget {
  final Widget child;

  WrappedCard({this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        color: kAccentColor[100],
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: child,
        ),
      ),
    );
  }
}
