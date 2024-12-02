import 'package:flutter/material.dart';
import 'package:tecnico/core/core.dart';
import '../../../enums/enums.dart';
import '../../pages.dart';

class FieldTypeBottomsheet {
  static Future show() async {
    FormCreationController formCreationController =
        Get.find<FormCreationController>();
    await Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Field Type',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: ProjectColors.gray800,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: ProjectColors.blueHighlight,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: const Text(
                        'Cancel',
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
            ),
            const SizedBox(height: 8),
            const Divider(),
            ListTile(
              leading: Image.asset(
                AppIcons.font,
              ),
              title: const Text(
                'Text',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                formCreationController.setFieldType(FieldType.text);
                Get.back();
              },
            ),
            const Divider(),
            ListTile(
              leading: Image.asset(
                AppIcons.dropdown,
              ),
              title: const Text(
                'Dropdown',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                formCreationController.setFieldType(FieldType.dropdown);

                Get.back();
              },
            ),
            const Divider(),
            ListTile(
              leading: Image.asset(
                AppIcons.checkbox,
              ),
              title: const Text(
                'Checkbox',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                formCreationController.setFieldType(FieldType.checkbox);

                Get.back();
              },
            ),
            const Divider(),
            const SizedBox(height: 8),
          ],
        ),
      ),
      isDismissible: true,
      enableDrag: true,
    );
  }
}
