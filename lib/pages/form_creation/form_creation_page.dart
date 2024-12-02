import 'package:flutter/material.dart';
import 'package:tecnico/pages/pages.dart';

import '../../core/core.dart';

class FormCreationPage extends StatefulWidget {
  const FormCreationPage({super.key});

  @override
  State<FormCreationPage> createState() => _FormCreationPageState();
}

class _FormCreationPageState extends State<FormCreationPage> {
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
                  padding: const EdgeInsets.symmetric(horizontal: 14),
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
                      children: [
                        ReorderableListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          onReorder: (int oldIndex, int newIndex) {
                            formCreationController.draggingIndex.value = null;
                            if (newIndex > oldIndex) newIndex -= 1;
                            final field = formCreationController.listFields
                                .removeAt(oldIndex);
                            formCreationController.listFields
                                .insert(newIndex, field);
                          },
                          onReorderStart: (int index) {
                            formCreationController.draggingIndex.value = index;
                          },
                          onReorderEnd: (int index) {
                            formCreationController.draggingIndex.value = null;
                          },
                          children: formCreationController.listFields
                              .asMap()
                              .entries
                              .map((entry) {
                            final int index = entry.key;
                            return ListTile(
                              key: ValueKey(index),
                              title: FieldPreviewWidget(
                                onMoreOptionsClick: () {
                                  AddFieldBottomsheet.show(
                                      fieldToEdit: entry.value);
                                },
                                fieldModel: entry.value,
                              ),
                              contentPadding: EdgeInsets.zero,
                              tileColor:
                                  formCreationController.draggingIndex.value ==
                                          index
                                      ? ProjectColors.gray500
                                      : ProjectColors.white,
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 14),
                        GestureDetector(
                          onTap: () {
                            AddFieldBottomsheet.show().then((_) {
                              formCreationController.resetNewField();
                            });
                          },
                          child: const AddFieldButton(),
                        ),
                        const SizedBox(height: 150),
                      ],
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () {
                AddFieldBottomsheet.show().then((_) {
                  formCreationController.resetNewField();
                });
              },
              backgroundColor: ProjectColors.gray800,
              shape: const CircleBorder(),
              child: const Icon(Icons.add,
                  color:
                      ProjectColors.white),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () {
                Get.to(const FormPreviewPage());
              },
              backgroundColor: ProjectColors.gray800,
              shape: const CircleBorder(),
              child: const Icon(Icons.visibility, color: ProjectColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
