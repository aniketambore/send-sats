import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  const CustomTextField(
      {Key? key, required this.controller, required this.text})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: Theme.of(context).textTheme.headline2,
      decoration: InputDecoration(
        fillColor: Colors.black.withOpacity(0.3),
        filled: true,
        hintText: widget.text,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        labelText: widget.text,
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        suffix: const SizedBox(
          height: 30,
          child: Image(
            image: AssetImage(
              'assets/sats.png',
            ),
          ),
        ),
      ),
    );
  }
}
