
import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final VoidCallback? onTab;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final String? errorMsg;
  final String Function(String?)? onSaved;

  const CustomTextFormField({
    super.key,
   required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.keyboardType,
    this.suffixIcon,
    this.onTab,
    this.prefixIcon,
    this.validator,
    this.focusNode,
    this.errorMsg,
    this.onSaved,



  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
  validator: validator,
            controller: controller,
            obscureText: obscureText,
      keyboardType: keyboardType,
      focusNode: focusNode,
      onTap: onTab,
      textInputAction: TextInputAction.next,
      onChanged: onSaved,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary
          ),
        ),
        fillColor: Colors.grey.shade200,
          filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[500]),
        errorText: errorMsg
      ),
          );

  }
}

