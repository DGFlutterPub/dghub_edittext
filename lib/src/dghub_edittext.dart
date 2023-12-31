import 'package:dghub_edittext/dghub_edittext.dart';
import 'package:dghub_edittext/src/edittexts/default_edittext.dart';
import 'package:flutter/material.dart';

import 'edittexts/card_edittext.dart';

class DGHubEditText extends StatelessWidget {
  final DGHubEditTextType type;
  final EditTextConfig config;
  const DGHubEditText(
      {required this.config,
      this.type = DGHubEditTextType.defaultDesign,
      super.key});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case DGHubEditTextType.card:
        return CardEditText(
          config: config,
        );

      default:
        return DefaultEditText(
          config: config,
        );
    }
  }
}
