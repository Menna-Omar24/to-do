import 'package:flutter/material.dart';

typedef ValidationFunction = String? Function(String?);

class CustomTextField extends StatefulWidget {
  final String label;
  final TextInputType keyword;
  final TextEditingController controller;
  final bool isPassword;
  final ValidationFunction validator;

  const CustomTextField({
    super.key,
    required this.label,
    required this.keyword,
    required this.controller,
    this.isPassword = false,
    required this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      obscuringCharacter: '*',
      obscureText: widget.isPassword ? isVisible : false,
      keyboardType: widget.keyword,
      controller: widget.controller,
      style: Theme.of(context).textTheme.titleSmall,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                icon: Icon(
                  isVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            : null,
        labelText: widget.label,
        labelStyle: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
