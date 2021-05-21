import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:danoetz_vascomm/shared/styles/styles.dart';

class InputTextWidget extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  final Function(String) validator;
  final String hintText;
  final bool obscureText;
  final Widget iconWidget;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Function onTap;

  const InputTextWidget({
    Key key,
    this.name,
    @required this.controller,
    this.validator,
    this.hintText = "",
    this.obscureText = false,
    this.iconWidget,
    this.textInputType,
    this.textInputAction,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.start,
      obscureText: obscureText,
      validator: validator,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: MyColors.textHint),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white,
        filled: true,
        errorStyle: TextStyle(color: Colors.white),
        contentPadding: EdgeInsets.symmetric(horizontal: 24),
        suffixIcon: iconWidget != null ? InkWell(onTap: onTap, child: iconWidget) : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.2,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.2,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      controller: controller,
    );
  }
}
