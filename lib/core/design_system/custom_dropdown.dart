import 'package:flutter/material.dart';

import '../core.dart';

class CustomDropdown extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;

  const CustomDropdown({
    Key? key,
    required this.title,
    required this.hintText,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
            color: ProjectColors.gray800,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          style: const TextStyle(color: ProjectColors.gray800),
          decoration: InputDecoration(
            suffixIcon:
                const RotatedBox(quarterTurns: 1, child: Icon(Icons.chevron_left)),
            hintText: hintText,
            hintStyle:
                const TextStyle(fontSize: 12, color: ProjectColors.gray500),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: ProjectColors.gray300,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: ProjectColors.blueHighlight,
                width: 1.5,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 13,
              vertical: 17,
            ),
          ),
        ),
      ],
    );
  }
}
