import 'package:flutter/material.dart';
// import '../../../../model/template/template_model.dart';
import '../../config/themeConfig.dart';
import '../../controller/controller.dart';
import '../../template/template_model.dart';

enum MyEditButtonView {
  edit,
  list,
}

class EditButton extends StatelessWidget {
  const EditButton({
    Key? key,
    required this.view,
    this.fieldIcon,
    this.fieldLabel,
    this.textColor,
    this.textSize,
    required this.model,
    this.callback,
  }) : super(key: key);

  final MyEditButtonView view;
  final IconData? fieldIcon;
  final String? fieldLabel;
  final Color? textColor;
  final double? textSize;
  final TemplateModel model;
  final MenuCallback? callback;

  @override
  Widget build(BuildContext context) {
    return view == MyEditButtonView.edit
        ? _buildFieldEdit()
        : _buildFieldList();
  }

  final Widget _buildSpace = const SizedBox(height: 10);

  Widget _buildFieldEdit() {
    return const SizedBox();
  }

  Widget _buildFieldList() {
    return PopupMenuItem(
      value: 0,
      child: Row(
        children: [
          Icon(
            fieldIcon ?? Icons.edit,
            size: 15,
          ),
          const SizedBox(width: 10),
          Text(
            fieldLabel ?? "",
            style: TextStyle(
              color: textColor ?? Colors.black,
              fontSize: textSize ?? 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
