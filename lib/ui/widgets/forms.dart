import 'package:bank/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final TextEditingController? controller;
  final bool isShowTitle;
  final TextInputType? keyboardType;
  final Function(String)? onFieldSubmitted;
  const CustomFormField({
    Key? key,
    required this.title,
    this.obscureText = false,
    this.controller,
    this.isShowTitle = true,
    this.keyboardType,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isShowTitle)
          Text(
            title,
            style: whiteTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        if (isShowTitle) const SizedBox(height: 8),
        TextFormField(
          obscureText: obscureText,
          cursorColor: whiteColor,
          style: whiteTextStyle,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: !isShowTitle ? title : null,
            hintStyle: greyTextStyle,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            contentPadding: const EdgeInsets.all(12),
          ),
          onFieldSubmitted: onFieldSubmitted,
        )
      ],
    );
  }
}
