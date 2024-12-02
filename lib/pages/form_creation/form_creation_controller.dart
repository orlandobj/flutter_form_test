import 'package:flutter/material.dart';
import 'package:tecnico/core/core.dart';

import '../../enums/enums.dart';
import '../../models/field_model.dart';

class FormCreationController {
  RxString selectedIcon = ''.obs;
  RxString fieldName = ''.obs;
  Rxn<FieldType> fieldType = Rxn<FieldType>();
  RxList<TextEditingController> fieldOptions =
      <TextEditingController>[].obs;
  RxnInt draggingIndex = RxnInt();

  TextEditingController fieldNameController = TextEditingController();
  TextEditingController fieldTypeController = TextEditingController();
  TextEditingController optionController =
      TextEditingController();
  RxList<FieldModel> listFields = <FieldModel>[].obs;

  void setFieldType(FieldType value) {
    fieldType.value = value;
    fieldTypeController.text = value.name;

    if (value == FieldType.dropdown || value == FieldType.checkbox) {
      fieldOptions
          .clear();
    }
  }

  void resetNewField() {
    selectedIcon.value = '';
    fieldName.value = '';
    fieldType.value = null;
    fieldTypeController.text = '';
    fieldNameController.text = '';
    fieldOptions.clear();
  }

  void addNewField() {
    List<String> fieldOptionsList = [];
    for (TextEditingController i in fieldOptions) {
      fieldOptionsList.add(i.text);
    }
    listFields.add(FieldModel(
      name: fieldNameController.text,
      type: fieldType.value!,
      icon: selectedIcon.value,
      options: fieldOptionsList,
    ));
    resetNewField();
  }

  void updateField(FieldModel fieldToEdit) {
    final index = listFields.indexOf(fieldToEdit);
    List<String> fieldOptionsList = [];
    for (TextEditingController i in fieldOptions) {
      fieldOptionsList.add(i.text);
    }
    if (index != -1) {
      listFields[index] = FieldModel(
        name: fieldNameController.text,
        type: fieldType.value!,
        icon: selectedIcon.value,
        options: fieldOptionsList,
      );
      resetNewField();
    }
  }

  void addFieldOption(TextEditingController option) {
    fieldOptions.add(option);
    optionController.clear();
  }

  void removeFieldOption(int index) {
    fieldOptions.removeAt(index);
  }

  void reorderFieldOptions(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex -= 1;
    final option = fieldOptions.removeAt(oldIndex);
    fieldOptions.insert(newIndex, option);
  }
}
