import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required TextEditingController controller,
    required this.hintText,
    this.icon = const SizedBox(),
    this.keyboardType = TextInputType.text,
    this.isObscured = false, this.prefixIcon = const SizedBox(), this.textToHintInput = "", this.isEnabled = true
  }) : _controller = controller;

  final TextEditingController _controller;
  final String hintText;
  final Widget icon;
  final Widget prefixIcon;
  final TextInputType keyboardType;
  final bool isObscured;
  final String textToHintInput;
  final bool isEnabled;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.poppins(color: Colors.grey[700]),
        keyboardType: keyboardType,
        obscureText: isObscured,
        enabled: isEnabled,
        validator: (value) {
          if (value!.isEmpty) {
            return hintText;
          }
          return null;
        },
        controller: _controller,
        decoration: InputDecoration( prefixIcon: prefixIcon, hintText: textToHintInput, hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
            filled: true,
            fillColor: Theme.of(context).colorScheme.background,
            disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(20)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(20)),
            suffixIcon: icon, suffixIconColor: Colors.grey[600]));
  }
}