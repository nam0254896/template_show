import 'package:flutter/cupertino.dart';
import '../../controller/controller.dart';
import '../../template/template_model.dart';

class MyButtonFiled extends StatelessWidget {
  const MyButtonFiled(
      {Key? key,
      required this.field,
      required this.model,
      required this.callback,
      required this.view})
      : super(key: key);
  final Map field;
  final TemplateModel model;
  final MenuCallback callback;
  final String view;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
