import 'package:flutter/material.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/typography/typography.dart';
import 'custom_input.dart';

class TextFieldTemplate extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final ValueChanged<String>? onChanged;
  final bool isConfirm;

  const TextFieldTemplate({
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.onChanged,
    this.isConfirm = false,
    super.key,
  });

  @override
  State<TextFieldTemplate> createState() => _TextFieldTemplateState();
}

class _TextFieldTemplateState extends State<TextFieldTemplate> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
      print('ObscureText toggled to: $_obscureText'); // Debug
    });
  }

  @override
  Widget build(BuildContext context) {
    return Input(
      label: widget.label,
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: widget.isPassword ? _obscureText : false,
      suffixWidget: widget.isPassword
          ? GestureDetector(
              onTap: _toggleObscureText,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                color: Colors.transparent,
                child: Image.asset(
                  _obscureText
                      ? 'assets/icons/eye.png'
                      : 'assets/icons/eye-slash.png',
                  width: 20,
                  height: 20,
                  color: Colors.grey,
                  errorBuilder: (context, error, stackTrace) {
                    print('Error loading image: $error');
                    return const Icon(Icons.error, size: 20, color: Colors.red);
                  },
                ),
              ),
            )
          : null,
      hintStyle: Font.regular.fs12.gray94(),
      labelStyle: Font.semiBold.fs12.black2b(),
      fillColor: AppColors.whiteff,
      borderColor: const Color(0xFFE1D9D9),
      border: true,
      isSuffix: widget.isPassword,
    );
  }
}