import 'package:flutter/material.dart';

class MySpacer extends StatelessWidget {
  const MySpacer({Key? key, this.height = 18}) : super(key: key);
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
