import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../controller/controller.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown(
      {Key? key,
      this.title,
      required this.callback,
      required this.data,
      this.hintext = '',
      this.value = ''})
      : super(key: key);
  final List<dynamic> data;
  final String hintext;
  final value;
  final MenuCallback callback;
  final Widget? title;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          (widget.value != '' || widget.value == null)
              ? Expanded(
                  child: DropdownButtonFormField(
                  value: widget.value,
                  isExpanded: true,
                  // hint: Text(
                  //   widget.hintext,
                  //   style: ThemeConfig.defaultStyle,
                  // ),
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(color: Colors.grey),
                    errorMaxLines: 1,
                    hintText: widget.hintext,
                    contentPadding:
                        const EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 10.0),
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
                  isDense: true,
                  onChanged: (newValue) {
                    widget.callback(newValue);
                  },
                  items: widget.data
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                ))
              : Expanded(
                  child: DropdownButtonFormField(
                  // hint: Text(
                  //   widget.hintext,
                  //   style: TextStyle(fontSize: ThemeConfig.labelSize),
                  // ),
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(color: Colors.grey),
                    hintText: widget.hintext,
                    errorMaxLines: 1,
                    contentPadding:
                        const EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 10.0),
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
                  isDense: true,
                  onChanged: (newValue) {
                    widget.callback(newValue);
                  },
                  items: widget.data
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                ))
        ],
      ),
    );
  }
}
