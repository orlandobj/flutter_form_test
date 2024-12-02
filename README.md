README
Technical Challenge

This project is designed with scalability as a primary focus. To add a new field type to the form, follow these simple steps:

    Add the Field Type to the Enum
        Navigate to field_type.dart.
        Add the new field type to the FieldType enum.

    Update the Field Rendering Logic
        Open field_widget.dart.
        Add a case for the new field type in the FieldWidget widget. This determines how the new field will be rendered.

    Add Validation for the New Field Type
        Locate the modal where fields are added.
        Implement validation logic for the new field type to ensure proper data entry.

By following these steps, you can seamlessly introduce new field types to the form while maintaining scalability and code structure.