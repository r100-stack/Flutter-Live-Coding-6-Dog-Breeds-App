import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class FlagView extends StatelessWidget {
  final String countryCode;

  FlagView(this.countryCode);

  @override
  Widget build(BuildContext context) {
    print(countryCode);

    return countryCode != null
        ? Flag(
            countryCode,
            height: 40,
            width: 40,
          )
        : Container(
      height: 40,
          width: 40,
          child: Icon(
              Icons.broken_image,
              size: 40,
            ),
        );
  }
}
