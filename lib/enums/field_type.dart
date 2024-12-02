import 'package:tecnico/core/core.dart';

enum FieldType {
  text,
  dropdown,
  checkbox;

  @override
  String toString() {
    return name.capitalize!;
  }

  static FieldType fromString(String value) {
    return FieldType.values.firstWhere(
      (type) => type.name == value,
      orElse: () => throw ArgumentError('Invalid FieldType: $value'),
    );
  }
}
