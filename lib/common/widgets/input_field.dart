import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? errorText;
  final String? Function(String?)? validator;
  final void Function(String? value) onChanged;
  const InputField({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.obscureText,
    this.validator,
    this.errorText,
    required this.onChanged,
    // required TextInputType keyboardType,
    // required InputDecoration decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      autovalidateMode: AutovalidateMode.disabled,
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        hintText: hintText,
        labelText: labelText,
        suffixIcon: suffixIcon,
        errorText: errorText,
      ),
    );
  }
}
