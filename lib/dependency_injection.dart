import 'package:tecnico/core/core.dart';

import 'pages/pages.dart';

class DependencyInjection {
  HomeController homeController = HomeController();

  static void initialize() {
    Get.put(HomeController());
    Get.put(FormCreationController());
  }
}
