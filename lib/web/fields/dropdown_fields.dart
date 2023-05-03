import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/listStrings.dart';
import '../../config/themeConfig.dart';
import '../../controller/controller.dart';
import '../widget/custom_dropdown.dart';
import 'parent_fields.dart';

enum View { edit, list, create }

class DropdownField extends StatefulWidget {
  final bool? readOnly;
  final View? view;
  final int? maxline;
  final MenuCallback? callback;
  final double? iconSize;
  final Color? color;
  final String? label;
  final bool? required;
  final String? intialValue;
  final IconData? iconList;
  const DropdownField(
      {Key? key,
      this.callback,
      this.color,
      this.iconList,
      this.iconSize,
      this.intialValue,
      this.label,
      this.maxline,
      this.readOnly,
      this.required,
      this.view})
      : super(key: key);

  @override
  State<DropdownField> createState() => _MyDropdownFieldState();
}

class _MyDropdownFieldState extends State<DropdownField> {
  get view => FieldParent.of(context).view;

  get field => FieldParent.of(context).field;

  get model => FieldParent.of(context).model;

  get showLabel => FieldParent.of(context).showLabel;

  get callback => FieldParent.of(context).callback;

  @override
  Widget build(BuildContext context) {
    return (widget.view == View.edit) ? _buildFieldEdit() : _buildFieldList();
  }

  final Widget _buildSpace = const SizedBox(height: 10);

  Widget _buildFieldEdit() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.label} ${widget.required ?? false ? '*' : ''}',
            style: ThemeConfig.defaultStyle,
          ),
          (widget.view == View.edit && widget.readOnly == true)
              ? _buildEditReadOnly()
              : CustomDropdown(
                  value: model.getValue(field['field']) ?? '',
                  hintext: widget.label ?? '',
                  title: showLabel
                      ? Container(
                          alignment: Alignment.center,
                          width: Get.width * 0.1,
                          height: 50,
                          decoration: BoxDecoration(
                              color: ThemeConfig.greyColor.withOpacity(0.2),
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(
                                      ThemeConfig.borderRadius / 2))),
                          child: Text(
                            '${widget.label} ${widget.required ?? false ? '*' : ''}',
                            style: ThemeConfig.smallStyle
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        )
                      : const SizedBox(),
                  data: ListStringConfig.getListString(field['list_string']),
                  callback: (value) {
                    widget.callback!(value);
                  }),
          _buildSpace
        ],
      ),
    );
  }

  Widget _buildFieldList() {
    return SelectableText(
      ListStringConfig.getValueInList(
          field['list_string'], model.getValue(field['field'])),
      style: ThemeConfig.defaultStyle,
    );
  }

  Widget _buildEditReadOnly() {
    return FieldParent(
      showLabel: showLabel,
      field: field,
      model: model,
      callback: callback,
      view: view,
      child: Builder(
        builder: (BuildContext fieldParentContext) {
          return const MyTextField();
        },
      ),
    );
  }
}
