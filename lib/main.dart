import 'package:flutter/material.dart';
import 'package:tecnico/dependency_injection.dart';
import 'core/core.dart';
import 'pages/pages.dart';

void main() {
  DependencyInjection.initialize();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(
        fontFamily: 'Archivo',
      ),
      home: const HomePage(),
    );
  }
}
