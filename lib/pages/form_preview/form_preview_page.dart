import 'package:flutter/material.dart';
import 'package:tecnico/pages/pages.dart';

import '../../core/core.dart';

class FormPreviewPage extends StatefulWidget {
  const FormPreviewPage({super.key});

  @override
  State<FormPreviewPage> createState() => _FormPreviewPageState();
}

class _FormPreviewPageState extends State<FormPreviewPage> {
  HomeController homeController = Get.find<HomeController>();
  FormCreationController formCreationController =
      Get.find<FormCreationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.gray200,
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 14),
                alignment: Alignment.centerLeft,
                child: Text(
                  homeController.formTitle.value,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 46, vertical: 42),
                  margin: const EdgeInsets.only(top: 14),
                  decoration: const BoxDecoration(
                    color: ProjectColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: formCreationController.listFields
                          .map((field) => FieldWidget(field: field))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30, right: 30),
        child: FloatingActionButton(
          onPressed: () {
            Get.back();
          },
          backgroundColor: ProjectColors.gray300,
          shape: const CircleBorder(),
          child: const Icon(Icons.visibility,
              color:
                  ProjectColors.gray800),
        ),
      ),
    );
  }
}
