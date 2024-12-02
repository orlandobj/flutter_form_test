import 'package:flutter/material.dart';

import '../core.dart';

class AddFieldButton extends StatelessWidget {
  const AddFieldButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DottedBorder(
            color: ProjectColors.gray400,
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            dashPattern: const [6, 3],
            strokeWidth: 1.5,
            child: Container(
              color: ProjectColors.gray100,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add,
                    color: ProjectColors.gray800,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Add Field',
                    style: TextStyle(
                      color: ProjectColors.gray800,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
