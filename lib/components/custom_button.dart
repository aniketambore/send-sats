import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback callback;
  final Color? buttonColor;
  final bool extendIt;
  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.callback,
    this.buttonColor,
    this.extendIt = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ElevatedButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: buttonColor ?? Colors.indigo,
        minimumSize:
            extendIt ? Size(size.width, 55) : Size(size.width * 0.1, 45),
      ),
      onPressed: callback,
      icon: const Icon(
        Icons.bolt_outlined,
        color: Colors.yellow,
      ),
      label: Text(
        buttonText,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
