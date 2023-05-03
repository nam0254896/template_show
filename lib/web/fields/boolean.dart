import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_show/web/fields/parent_fields.dart';
import 'package:template_show/web/widget/custom_input.dart';
import '../../config/listStrings.dart';
import '../../config/themeConfig.dart';
import '../../controller/controller.dart';

enum View { edit, list, create }

class MyBooleanField extends StatefulWidget {
  final bool readOnly;
  final View? view;
  final int? maxline;
  final MenuCallback? callback;
  final double? iconSize;
  final Color? color;
  final String? label;
  final bool? required;
  final String? intialValue;
  final IconData? iconList;
  const MyBooleanField(
      {Key? key,
      this.callback,
      this.label,
      this.required,
      this.iconList,
      this.iconSize,
      this.maxline,
      this.color,
      this.intialValue,
      this.readOnly = false,
      this.view})
      : super(key: key);

  @override
  State<MyBooleanField> createState() => _MyBooleanFieldState();
}

class _MyBooleanFieldState extends State<MyBooleanField> {
  get view => FieldParent.of(context).view;

  get field => FieldParent.of(context).field;

  get model => FieldParent.of(context).model;

  get showLabel => FieldParent.of(context).showLabel;

  get callback => FieldParent.of(context).callback;

  @override
  Widget build(BuildContext context) {
    return widget.view == View.list ? _buildFieldList() : _buildFieldEdit();
  }

  final Widget _buildSpace = const SizedBox(height: 10);

  Widget _buildFieldEdit() {
    final TextStyle labelStyle =
        TextStyle(fontSize: ThemeConfig.smallSize, fontWeight: FontWeight.bold);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CustomInput(
            readOnly: (widget.view == View.edit) ? widget.readOnly : false,
            contendPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            title: Container(
              alignment: Alignment.center,
              width: Get.width * 0.1,
              height: 50,
              decoration: BoxDecoration(
                  color: ThemeConfig.greyColor.withOpacity(0.2),
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(ThemeConfig.borderRadius / 2))),
              child: Text(
                '${widget.label} ${widget.required ?? false ? '*' : ''}',
                style: labelStyle,
              ),
            ),
            maxLine: widget.maxline ?? 1,
            initValue: widget.intialValue ?? '',
            hasTitle: showLabel,
            hintText: widget.label ?? '',
            keyboardType: TextInputType.text,
            callbackUpdate: (value) {
              widget.callback!(value);
            },
          ),
          _buildSpace
        ],
      ),
    );
  }

  String getInitValue() {
    if (field['type'] == 'dropdown') {
      return ListStringConfig.getValueInList(
          field['list_string'], model.getValue(field['field']));
    } else {
      return model.getValue(field['field']).toString();
    }
  }

  Widget _buildFieldList() {
    return Align(
        alignment: Alignment.center,
        child: Icon(
          widget.iconList ?? Icons.check_circle_outline,
          color: widget.color ?? ThemeConfig.greenColor,
          size: widget.iconSize ?? ThemeConfig.defaultSize,
        ));
  }
}
