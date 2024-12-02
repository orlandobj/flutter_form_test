import 'package:flutter/material.dart';

import '../core.dart';

class CustomTextField extends StatelessWidget {
  final String? title;
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final bool enabled;
  final VoidCallback? onTap;

  const CustomTextField({
    Key? key,
    this.title,
    required this.hintText,
    this.controller,
    this.focusNode,
    this.suffixIcon,
    this.enabled = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
              color: ProjectColors.gray800,
            ),
          ),
          const SizedBox(height: 5),
        ],
        GestureDetector(
          onTap: onTap,
          child: TextField(
            enabled: enabled,
            cursorColor: ProjectColors.gray800,
            controller: controller,
            focusNode: focusNode,
            style: const TextStyle(
              color: ProjectColors.gray800,
              fontSize: 13,
            ),
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 12,
                color: ProjectColors.gray500,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: ProjectColors.gray300,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: ProjectColors.gray500,
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color:
                      enabled ? ProjectColors.gray300 : ProjectColors.gray500,
                  width: 1.5,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 13,
                vertical: 17,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
