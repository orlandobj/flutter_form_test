import 'package:flutter/material.dart';
import 'package:tecnico/core/core.dart';

import '../pages.dart';

class HomeController {
  RxBool isFormVisible = false.obs;
  RxString formTitle = ''.obs;
  final TextEditingController formTitleController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  void showForm() {
    isFormVisible.value = true;
    focusNode.requestFocus();
  }

  void hideForm() {
    isFormVisible.value = false;
  }

  void setFormName() {
    formTitle.value = formTitleController.text;
    Get.to(const FormCreationPage());
  }
}
