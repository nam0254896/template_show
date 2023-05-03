import 'package:flutter/cupertino.dart';
import '../../controller/controller.dart';
import '../../template/template_model.dart';

class FieldParent extends InheritedWidget {
  const FieldParent({
    super.key,
    required super.child,
    required this.field,
    required this.model,
    required this.callback,
    required this.view,
    required this.showLabel,
    this.index = 0,
  });

  final Map field;
  final TemplateModel model;
  final MenuCallback callback;
  final String view;
  final bool showLabel;
  final int index;

  static FieldParent of(BuildContext context) {
    final FieldParent? result =
        context.dependOnInheritedWidgetOfExactType<FieldParent>();
    assert(result != null, 'No FieldParent found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(FieldParent oldWidget) => true;
}
