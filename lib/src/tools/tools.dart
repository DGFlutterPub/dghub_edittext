import 'package:flutter/material.dart';

class Tools {
  static bool isDarkTheme(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark;
  }
}
