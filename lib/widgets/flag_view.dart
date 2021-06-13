import 'package:dog_breeds_app/constants.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class FlagView extends StatelessWidget {
  final String countryCode;

  FlagView(this.countryCode);

  @override
  Widget build(BuildContext context) {
    print(countryCode);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: countryCode != null
          ? Flag(
              countryCode,
              height: kFlagViewSize,
              width: kFlagViewSize,
            )
          : Container(
              height: kFlagViewSize,
              width: kFlagViewSize,
              child: Icon(
                Icons.broken_image,
                size: kFlagViewSize,
              ),
            ),
    );
  }
}
