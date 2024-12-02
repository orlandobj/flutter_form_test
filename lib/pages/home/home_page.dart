import 'package:flutter/material.dart';
import '../../core/core.dart';
import '../pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = Get.find<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ProjectColors.gray900,
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: [
              AnimatedPadding(
                padding: homeController.isFormVisible.value
                    ? const EdgeInsets.all(50)
                    : EdgeInsets.zero,
                duration: const Duration(milliseconds: 400),
                child: Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: ProjectColors.gray200,
                    borderRadius: homeController.isFormVisible.value
                        ? BorderRadius.circular(35)
                        : null,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/logos/logo.png'),
                      const SizedBox(height: 21),
                      Image.asset('assets/logos/logo_text.png'),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.decelerate,
                  width: screenWidth,
                  height: homeController.isFormVisible.value ? 350 : 174,
                  decoration: const BoxDecoration(
                    color: ProjectColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34),
                      topRight: Radius.circular(34),
                    ),
                  ),
                  padding: EdgeInsets.only(
                    left: 49,
                    right: 49,
                    top: 49,
                    bottom: homeController.isFormVisible.value ? 42 : 70,
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    child: homeController.isFormVisible.value
                        ? _buildForm(context)
                        : _buildCreateButton(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return SingleChildScrollView(
      key: const ValueKey('form'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'New Form',
                style: TextStyle(
                  fontSize: 31,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () => homeController.hideForm(),
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
          const SizedBox(height: 42),
          CustomTextField(
            focusNode: homeController.focusNode,
            controller: homeController.formTitleController,
            hintText: 'Form Title',
          ),
          const SizedBox(height: 42),
          GestureDetector(
            onTap: () {
              if (homeController.formTitleController.text != '') {
                homeController.setFormName();
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ProjectColors.blueHighlight,
                borderRadius: BorderRadius.circular(34),
              ),
              child: const Text(
                'Create',
                style: TextStyle(
                  color: ProjectColors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreateButton() {
    return GestureDetector(
      key: const ValueKey('button'),
      onTap: homeController.showForm,
      child: Container(
        height: 55,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ProjectColors.blueHighlight,
          borderRadius: BorderRadius.circular(34),
        ),
        child: const Text(
          'Create New Form',
          style: TextStyle(
            color: ProjectColors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
