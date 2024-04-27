import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/core/shared_widgets/text.dart';
import 'package:test/core/shared_widgets/text_form_field.dart';
import 'package:test/core/utils/app_colors.dart';
import 'package:test/core/utils/app_values.dart';

class TextFieldWithTitle extends StatelessWidget {
  final TextEditingController controller;

  final String title;
  final String hint;
  final TextInputType inputType;
  final bool obscure;
  final IconData? suffixIcon;
  final void Function()? suffixTap;
  final String validateText;
  final String? Function(String?)? validator;
  final GlobalKey<FormState>? formKey;
  final ValueChanged<String>? onChange;
  final List<TextInputFormatter>? formatters;
  const TextFieldWithTitle({
    super.key,
    required this.controller,
    required this.title,
    required this.hint,
    this.validateText = "This Field is required",
    required this.inputType,
    this.obscure = false,
    this.suffixIcon,
    this.validator,
    this.formKey,
    this.suffixTap,
    this.onChange,
    this.formatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppWidth.w5),
          child: SecondaryText(
            text: "title",
            isLight: true,
            color: AppColors.primary,
          ),
        ),
        SizedBox(height: AppHeight.h3),
        CustomTextField(
          // formatters: formatters,
          hintText: hint,
          controller: controller,
          inputType: inputType,
          obscureText: obscure,
          validator: validator,
        ),
      ],
    );
  }
}

void printTest(isChanged, function) {
  if (isChanged) {
    function;
  } else {
    debugPrint("NULL");
  }
}
