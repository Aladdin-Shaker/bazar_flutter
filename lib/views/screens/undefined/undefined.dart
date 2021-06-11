import 'package:flutter/material.dart';

class UndefinedScreen extends StatelessWidget {
  final String? name;
  const UndefinedScreen({
    Key? key,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
          child: Text(
        'Route for $name is not defined',
        style: const TextStyle(
          fontSize: 25.0,
        ),
      )),
    );
  }
}
