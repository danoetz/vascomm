import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:danoetz_vascomm/shared/styles/styles.dart';
import 'package:danoetz_vascomm/shared/widgets/widgets.dart';

class CustomInputTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String name;
  final String hintText;
  final TextInputAction textInputAction;
  final Widget iconWidget;
  final bool obscureText;
  final Function onTap;
  final double height;

  const CustomInputTextField({
    Key key,
    @required this.controller,
    this.label,
    this.name,
    this.hintText,
    this.textInputAction,
    this.iconWidget,
    this.obscureText = false,
    this.onTap,
    this.height = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label != null
              ? CustomText(
                  text: label,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: MyColors.primary,
                  padding: EdgeInsets.only(bottom: 16.0),
                )
              : Container(),
          Container(
            height: height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                8,
              ),
              boxShadow: [
                BoxShadow(
                  color: MyColors.textLightGray,
                  offset: Offset(0, 16),
                  blurRadius: 24,
                ),
              ],
            ),
            child: InputTextWidget(
              name: name,
              controller: controller,
              hintText: hintText,
              textInputAction: textInputAction ?? TextInputAction.next,
              iconWidget: iconWidget ?? null,
              obscureText: obscureText,
              onTap: onTap ?? () {},
            ),
          ),
        ],
      ),
    );
  }
}
