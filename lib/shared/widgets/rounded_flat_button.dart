import 'package:flutter/material.dart';

class RoundedFlatButton extends StatelessWidget {
  final Widget child;
  final Function() onPressed;
  final Color color;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;
  final double height;
  final double width;
  final MaterialTapTargetSize materialTapTargetSize;
  RoundedFlatButton({
    Key key,
    this.child,
    this.onPressed,
    this.color = Colors.white,
    this.padding,
    this.borderRadius,
    this.height,
    this.materialTapTargetSize,
    this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      height: this.height,
      minWidth: this.width,
      materialTapTargetSize: this.materialTapTargetSize ?? MaterialTapTargetSize.padded,
      shape: RoundedRectangleBorder(borderRadius: this.borderRadius ?? BorderRadius.circular(20)),
      color: this.color ?? Colors.white,
      onPressed: this.onPressed ?? () {},
      child: this.child,
      padding: this.padding,
    );
  }
}
