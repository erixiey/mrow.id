// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/typography/typography.dart';

class Input extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String? label;
  final String? hint;
  final String? errorText;
  final bool disabled;
  final InputDecoration? decoration;
  final TextInputType keyboardType;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final VoidCallback? onClick;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final TextCapitalization? textCapitalization;
  final double borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? prefixPadding;
  final double? hintFontSize;
  final FontWeight? hintFontWeight;
  final FormFieldValidator<String>? validator;
  final Color? textColor;
  final double? labelSize;
  final bool border;
  final bool? obscureText;
  final double? suffixMaxHeight;
  final bool readOnly;
  final Color? fillColor;
  final Color? borderColor;
  final bool isPrefix;
  final bool isSuffix;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final double? borderWidth;
  final bool isDense;
  final bool isMultiline;
  final void Function(String)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? textStyle;
  final BorderRadius? borderInsets;
  const Input({
    Key? key,
    this.controller,
    this.label,
    this.isDense = true,
    this.border = false,
    this.initialValue,
    this.disabled = false,
    this.decoration,
    this.onClick,
    this.keyboardType = TextInputType.text,
    this.suffixWidget,
    this.prefixWidget,
    this.maxLines,
    this.textCapitalization,
    this.labelSize,
    this.borderRadius = 5,
    this.padding,
    this.hintFontSize,
    this.hintFontWeight,
    this.validator,
    this.onChanged,
    this.textColor,
    this.obscureText,
    this.hint,
    this.suffixMaxHeight,
    this.errorText,
    this.readOnly = false,
    this.fillColor,
    this.borderColor,
    this.isPrefix = true,
    this.isSuffix = true,
    this.hintStyle,
    this.prefixPadding,
    this.borderWidth,
    this.isMultiline = false,
    this.onSubmitted,
    this.inputFormatters,
    this.labelStyle,
    this.textStyle, this.borderInsets,
  }) : super(key: key);
  @override

  Widget build(BuildContext context) {
    if (label != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label!,
                style: labelStyle?? Font.semiBold.fs12.black2b(),
              ),
            ],
          ),
          SizedBox(height: 10),
          _buildTextFormField(context)
        ],
      );
    } else {
      return _buildTextFormField(context);
    }
  }
  Widget _buildTextFormField(context) {
    InputDecoration inputDecoration = InputDecoration(
      suffixIconConstraints: BoxConstraints(maxHeight: suffixMaxHeight ?? 15),
      prefixIconConstraints: BoxConstraints(maxHeight: suffixMaxHeight ?? 15),
      isDense: isDense,
      errorText: errorText,
      filled: true,
      hintText: hint,
      hintStyle: hintStyle ?? Font.regular.fs12.gray94(),
      contentPadding: padding ?? EdgeInsets.fromLTRB(15, 15, 15, 15),
      // contentPadding: padding ?? EdgeInsets.only(left: 15, right: 10, top: 12, bottom: 12).r,
      fillColor: fillColor ?? AppColors.whiteff,
      prefixIcon: isPrefix
          ? Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: prefixWidget,
            )
          : null,
      suffixIcon: isSuffix
          ? Padding(
              padding: prefixPadding ?? EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: suffixWidget,
            )
          : null,
      focusedBorder: OutlineInputBorder(
          borderRadius: borderInsets?? BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
              width: borderWidth ?? 1, color: borderColor ?? AppColors.grayd9)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
              width: borderWidth ?? 1, color: borderColor ?? AppColors.grayd9)),
      errorStyle: const TextStyle(height: 0),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
              width: borderWidth ?? 1, color: borderColor ?? AppColors.red)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
              width: borderWidth ?? 1, color: borderColor ?? AppColors.red)),
    );
    return TextFormField(
      initialValue: initialValue,
      controller: controller,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      onFieldSubmitted: onSubmitted,
      keyboardType: keyboardType,
      maxLines: isMultiline ? maxLines : maxLines ?? 1,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      readOnly: readOnly,
      validator: validator,
      obscureText: obscureText ?? false,
      style: textStyle ?? Font.regular.fs12.black2b(),
      onTap: onClick,
      decoration: decoration ?? inputDecoration,
    );
  }
}