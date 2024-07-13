import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({super.key, required this.options, required this.next});
  final String options;
  final void Function() next;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: next,
        child: Text(
          options,
          textAlign: TextAlign.center,
        )
        );
  }
}
