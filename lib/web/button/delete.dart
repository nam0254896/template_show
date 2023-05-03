import 'package:get/get.dart';

enum ViewType { edit_view, list_view }

enum FieldType {
  text_field,
  // thêm các loại field khác ở đây
}

class TemplateView {
  Map<String, dynamic> getView() {
    return {
      ViewType.edit_view.toString(): [
        {
          'field': 'name',
          'label': 'Name',
          'type': FieldType.text_field.toString(),
          'span': 12
        }
      ],
      ViewType.list_view.toString(): [
        {
          'field': 'name',
          'label': 'Name',
        }
      ]
    };
  }
}
