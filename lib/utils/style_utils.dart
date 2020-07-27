import 'package:flutter/material.dart';

class StyleUtils {
  static getTitleTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.headline5.copyWith(
      fontWeight: FontWeight.w700
    );
  }

  static getDescTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.headline6.copyWith(
        fontWeight: FontWeight.w300
    );
  }
}