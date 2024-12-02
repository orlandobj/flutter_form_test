import 'package:flutter/material.dart';
import 'package:tecnico/models/models.dart';
import '../core.dart';

class FieldPreviewWidget extends StatelessWidget {
  final FieldModel fieldModel;
  final VoidCallback onMoreOptionsClick;

  const FieldPreviewWidget({
    Key? key,
    required this.fieldModel,
    required this.onMoreOptionsClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 21),
      decoration: BoxDecoration(
        border: Border.all(color: ProjectColors.gray300),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.drag_indicator,
                color: ProjectColors.gray800,
              ),
              const SizedBox(width: 8),
              Image.asset(fieldModel.icon),
              const SizedBox(width: 8),
              Text(
                fieldModel.name,
                style:
                    const TextStyle(color: ProjectColors.gray800, fontSize: 14),
              ),
            ],
          ),
          GestureDetector(
            onTap: onMoreOptionsClick,
            child: const Icon(
              Icons.more_horiz,
              color: ProjectColors.gray800,
            ),
          ),
        ],
      ),
    );
  }
}
