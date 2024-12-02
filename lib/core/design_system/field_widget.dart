import 'package:flutter/material.dart';
import 'package:tecnico/core/core.dart';
import 'package:tecnico/models/models.dart';
import '../../enums/enums.dart';

class FieldWidget extends StatelessWidget {
  final FieldModel field;

  const FieldWidget({Key? key, required this.field}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (field.type) {
      case FieldType.text:
        return _buildTextField();
      case FieldType.dropdown:
        return _buildDropdownField();
      case FieldType.checkbox:
        return _buildCheckboxField();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          hintText: 'TypeHere',
          title: field.name,
        ),
        const SizedBox(
          height: 21,
        )
      ],
    );
  }

  Widget _buildDropdownField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          field.name,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          items: field.options
              ?.map((option) => DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  ))
              .toList(),
          onChanged: (value) {},
          decoration: InputDecoration(
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
              borderSide: const BorderSide(
                color: ProjectColors.gray300,
                width: 1.5,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 13,
              vertical: 17,
            ),
          ),
        ),
        const SizedBox(
          height: 21,
        )
      ],
    );
  }

  Widget _buildCheckboxField() {
    List<bool> isCheckedList =
        List.generate(field.options?.length ?? 0, (index) => false);

    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              field.name,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              children: field.options?.asMap().entries.map((entry) {
                    final int index = entry.key;
                    final String option = entry.value;

                    return Row(
                      children: [
                        Checkbox(
                          activeColor: ProjectColors.blueHighlight,
                          value: isCheckedList[index],
                          onChanged: (value) {
                            setState(() {
                              isCheckedList[index] = value ?? false;
                            });
                          },
                        ),
                        Text(
                          option,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    );
                  }).toList() ??
                  [],
            ),
            const SizedBox(
              height: 21,
            )
          ],
        );
      },
    );
  }
}
