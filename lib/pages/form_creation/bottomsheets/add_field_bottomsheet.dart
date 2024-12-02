import 'package:flutter/material.dart';
import 'package:tecnico/core/core.dart';
import '../../../enums/enums.dart';
import '../../../models/models.dart';
import '../../pages.dart';

class AddFieldBottomsheet {
  static Future show({FieldModel? fieldToEdit}) async {
    FormCreationController formCreationController =
        Get.find<FormCreationController>();

    if (fieldToEdit != null) {
      formCreationController.selectedIcon.value = fieldToEdit.icon;
      formCreationController.fieldNameController.text = fieldToEdit.name;
      formCreationController.setFieldType(fieldToEdit.type);

      if (fieldToEdit.type == FieldType.dropdown ||
          fieldToEdit.type == FieldType.checkbox) {
        formCreationController.fieldOptions.assignAll(
          fieldToEdit.options
                  ?.map((option) => TextEditingController(text: option)) ??
              [],
        );
      }
    }

    Future<void> validateAndSubmit() async {
      String errorMessage = '';

      if (formCreationController.fieldNameController.text.trim().isEmpty) {
        errorMessage = 'Field name cannot be empty.';
      }

      if (formCreationController.selectedIcon.value.isEmpty) {
        errorMessage = 'You must select an icon.';
      }

      if ((formCreationController.fieldType.value == FieldType.dropdown ||
              formCreationController.fieldType.value == FieldType.checkbox) &&
          (formCreationController.fieldOptions.isEmpty ||
              formCreationController.fieldOptions
                  .any((controller) => controller.text.trim().isEmpty))) {
        errorMessage =
            'Each option must have a value, and there must be at least one option.';
      }

      if (errorMessage.isNotEmpty) {
        Get.snackbar(
          'Validation Error',
          errorMessage,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ProjectColors.blueHighlight,
          colorText: ProjectColors.white,
        );
      } else {
        if (fieldToEdit != null) {
          formCreationController.updateField(fieldToEdit);
        } else {
          formCreationController.addNewField();
        }
        Get.back();
      }
    }

    await Get.bottomSheet(
      Obx(
        () => SafeArea(
          child: Container(
            height: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14),
            margin: const EdgeInsets.only(top: 50),
            decoration: const BoxDecoration(
              color: ProjectColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Edit Field',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: ProjectColors.gray800,
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: ProjectColors.blueHighlight,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: validateAndSubmit,
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: ProjectColors.blueHighlight,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: const Text(
                                  'Done',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: ProjectColors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.only(left: 46),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'ICON',
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(horizontal: 46),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: ProjectColors.gray200,
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.all(5),
                          child: Wrap(
                            spacing: 5,
                            runSpacing: 5,
                            children: AppIcons.getAllIcons().map((icon) {
                              return GestureDetector(
                                onTap: () {
                                  formCreationController.selectedIcon.value =
                                      icon;
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: formCreationController
                                                  .selectedIcon.value ==
                                              icon
                                          ? ProjectColors.blueHighlight
                                          : Colors.transparent,
                                    ),
                                  ),
                                  child: Image.asset(
                                    icon,
                                    fit: BoxFit.contain,
                                    width: 32,
                                    height: 32,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 21),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 46),
                    child: CustomTextField(
                      controller: formCreationController.fieldNameController,
                      hintText: 'Type name',
                      title: 'FIELD NAME',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 46),
                    child: CustomTextField(
                      enabled: false,
                      hintText: 'Select',
                      title: 'FIELD TYPE',
                      controller: formCreationController.fieldTypeController,
                      suffixIcon: const Icon(Icons.keyboard_arrow_down),
                      onTap: () {
                        FieldTypeBottomsheet.show();
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (formCreationController.fieldType.value ==
                          FieldType.dropdown ||
                      formCreationController.fieldType.value ==
                          FieldType.checkbox) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 46),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'OPTIONS',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ReorderableListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return FieldOption(
                                key: ValueKey(index),
                                hintText: 'Type Here',
                                controller:
                                    formCreationController.fieldOptions[index],
                                onDelete: () {
                                  formCreationController
                                      .removeFieldOption(index);
                                },
                              );
                            },
                            itemCount:
                                formCreationController.fieldOptions.length,
                            onReorder: (int oldIndex, int newIndex) {
                              if (newIndex > oldIndex) newIndex -= 1;
                              final item = formCreationController.fieldOptions
                                  .removeAt(oldIndex);
                              formCreationController.fieldOptions
                                  .insert(newIndex, item);
                            },
                          ),
                          GestureDetector(
                            onTap: () {
                              formCreationController.fieldOptions
                                  .add(TextEditingController());
                            },
                            child: const AddOptionsButton(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
    );

    formCreationController.resetNewField();
  }
}
