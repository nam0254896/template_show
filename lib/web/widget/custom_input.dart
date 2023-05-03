import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../config/themeConfig.dart';
import '../../controller/controller.dart';
import '../../utils/utils.dart';

class CustomInput extends StatefulWidget {
  final bool hasTitle;
  final title;
  bool obscureText;
  final bold;
  final String hintText;
  String? initValue;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffix;
  late EdgeInsetsGeometry? padding;
  final int maxLength;
  final double? fontSize;
  final contendPadding;
  final int maxLine;
  final validate;
  final readOnly;
  final TextEditingController? controller;
  final FocusNode? focus;
  final MenuCallback callbackUpdate;
  final GestureTapCallback? callback;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final List<TextInputFormatter> textInputFormatters;

  CustomInput(
      {Key? key,
      required this.keyboardType,
      this.textAlign = TextAlign.left,
      this.title,
      this.hasTitle = false,
      this.hintText = '',
      this.obscureText = false,
      this.prefixIcon,
      this.focus,
      this.suffix,
      this.padding,
      this.fontSize,
      this.maxLine = 1,
      this.contendPadding,
      this.controller,
      this.bold = FontWeight.normal,
      this.validate = true,
      this.maxLength = 100,
      this.textAlignVertical,
      required this.callbackUpdate,
      this.callback,
      this.initValue,
      this.readOnly = false,
      this.textInputFormatters = const []})
      : super(key: key);

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20 + 20.0 * widget.maxLine,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
          borderRadius: BorderRadius.circular(getSize(5))),
      child: TextFormField(
        validator: (value) {
          if ((value == null || value == '') && widget.validate) {
            return 'Please enter some text';
          }
          return null;
        },
        inputFormatters: widget.textInputFormatters,
        controller: widget.controller,
        initialValue: widget.initValue,
        focusNode: widget.focus,
        onTap: widget.callback,
        readOnly: widget.readOnly,
        textAlign: widget.textAlign,
        style: TextStyle(
            fontSize: widget.fontSize ?? ThemeConfig.defaultSize,
            fontWeight: widget.bold),
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        maxLines: widget.maxLine,
        onChanged: (value) {
          widget.callbackUpdate(value);
        },
        textAlignVertical: widget.textAlignVertical,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.readOnly
              ? Colors.grey.withOpacity(0.3)
              : Colors.transparent,
          hintStyle:
              TextStyle(color: Colors.grey, fontSize: ThemeConfig.labelSize),
          suffixIcon: widget.suffix,
          prefixIcon: widget.prefixIcon,
          //errorText: _validate(controller.text),
          hintText: '${widget.hintText.toLowerCase()}',
          //  hintStyle: const TextStyle(color: Colors.red),
          contentPadding: ThemeConfig.contentPadding,
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.0)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
    );
  }
}
