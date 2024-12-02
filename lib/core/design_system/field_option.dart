import 'package:flutter/material.dart';

import '../core.dart';

class FieldOption extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool enabled;
  final VoidCallback? onDelete;

  const FieldOption({
    Key? key,
    required this.hintText,
    this.controller,
    this.focusNode,
    this.enabled = true,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: ProjectColors.gray300,
          width: 1.5,
        ),
      ),
      child: ListTile(
          minVerticalPadding: 0,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 23, vertical: 0),
          leading:
              const Icon(Icons.drag_indicator, color: ProjectColors.gray800),
          title: TextField(
            enabled: enabled,
            cursorColor: ProjectColors.gray800,
            controller: controller,
            focusNode: focusNode,
            style: const TextStyle(
              color: ProjectColors.gray800,
              fontSize: 14,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 12,
                color: ProjectColors.gray500,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
            ),
          ),
          trailing: GestureDetector(
              onTap: onDelete,
              child: const Icon(Icons.delete, color: ProjectColors.gray800))),
    );
  }
}
