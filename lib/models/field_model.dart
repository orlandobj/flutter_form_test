import '../enums/enums.dart';

class FieldModel {
  final String name;
  final FieldType type;
  final String icon;
  final List<String>? options;

  FieldModel({
    required this.name,
    required this.type,
    required this.icon,
    this.options,
  });
}
