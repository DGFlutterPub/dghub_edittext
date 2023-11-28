import 'package:dghub_edittext/src/model/edittext_config.dart';
import 'package:dghub_edittext/src/tools/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultEditText extends StatefulWidget {
  final EditTextConfig config;
  const DefaultEditText({required this.config, super.key});

  @override
  State<DefaultEditText> createState() => _DefaultEditTextState();
}

class _DefaultEditTextState extends State<DefaultEditText> {
  late bool isPasswordModeChanger;

  @override
  void initState() {
    isPasswordModeChanger = widget.config.isPasswordMode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: widget.config.margin,
      child: InkWell(
        onTap: widget.config.onTap,
        child: TextField(
          obscureText: isPasswordModeChanger,
          enabled: widget.config.enabled,
          maxLength: widget.config.maxLength,
          keyboardType: widget.config.textInputType,
          inputFormatters: [
            if (widget.config.isDigitMode)
              FilteringTextInputFormatter.digitsOnly,
            if (widget.config.isPhoneMode)
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            if (widget.config.isPhoneMode)
              FilteringTextInputFormatter.deny(RegExp(r'^0+'))
          ],

          maxLines: widget.config.maxLine ?? 1,
          obscuringCharacter: "*",
          controller: widget.config.controller,
          style: TextStyle(
              color: Tools.isDarkTheme(context) ? Colors.white : Colors.black,
              fontSize: 16),
          // obscureText: true,
          decoration: InputDecoration(
              prefixIconConstraints: const BoxConstraints(),
              prefixStyle: TextStyle(
                  fontSize: 16,
                  color:
                      Tools.isDarkTheme(context) ? Colors.white : Colors.black),
              contentPadding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              prefix: widget.config.countryCode == null
                  ? null
                  : Wrap(
                      direction: Axis.vertical,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: Row(
                              children: [
                                Text(widget.config.countryCode!),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  '|',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            )),
                      ],
                    ),
              errorStyle: TextStyle(
                color: Colors.red[400],
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: theme.primaryColor, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Tools.isDarkTheme(context)
                        ? Colors.grey.shade800
                        : Colors.grey,
                    width: 1.5),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Tools.isDarkTheme(context)
                        ? Colors.grey.shade800
                        : Colors.grey,
                    width: 1.5),
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Tools.isDarkTheme(context)
                          ? Colors.grey.shade800
                          : Colors.grey)),
              prefixIcon: widget.config.leftWidget,
              suffixIcon: widget.config.rightWidget == null
                  ? null
                  : GestureDetector(
                      onTap: widget.config.isPasswordMode
                          ? () => setState(() {
                                isPasswordModeChanger = !isPasswordModeChanger;
                              })
                          : null,
                      child: Container(
                          padding: const EdgeInsets.only(left: 5),
                          child: widget.config.isPasswordMode
                              ? isPasswordModeChanger
                                  ? const Icon(Icons.visibility,
                                      color: Colors.grey, size: 15)
                                  : const Icon(Icons.visibility_off,
                                      color: Colors.grey, size: 15)
                              : widget.config.rightWidget)),
              labelText: widget.config.label,
              floatingLabelStyle: TextStyle(color: theme.primaryColor),
              labelStyle: const TextStyle(color: Colors.grey),
              hintStyle: const TextStyle(fontSize: 16.0, color: Colors.grey),
              hintText: widget.config.hint),
        ),
      ),
    );
  }
}
