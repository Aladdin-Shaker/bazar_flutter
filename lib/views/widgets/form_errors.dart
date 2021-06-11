import 'package:bazar/config/sizes.dart';
import 'package:flutter/material.dart';

class FormViewErrors extends StatelessWidget {
  final List<String> errors;

  const FormViewErrors({
    Key? key,
    required this.errors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            errors.length, (index) => _buildRowError(error: errors[index])));
  }

  Row _buildRowError({required String error}) {
    return Row(
      children: <Widget>[
        const Icon(
          Icons.error,
          color: Colors.red,
        ),
        SizedBox(width: getProportionateScreenWidth(10)),
        Text(error)
      ],
    );
  }
}
