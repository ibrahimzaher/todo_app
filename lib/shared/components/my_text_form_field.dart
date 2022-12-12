import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField(
      {Key? key,
      this.maxLines = 1,
      required this.hintText,
      required this.controller,
      required this.inValid})
      : super(key: key);
  final int maxLines;
  final String hintText;
  final TextEditingController controller;
  final String inValid;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyText1,
      ),
      style: Theme.of(context).textTheme.headline6,
      validator: (value) {
        if (value == null || value.trim().isEmpty) return inValid;
        return null;
      },
    );
  }
}
