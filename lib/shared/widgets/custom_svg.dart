import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:danoetz_vascomm/shared/helpers/helpers.dart';

class CustomSvg extends StatelessWidget {
  final String path;
  final double height;
  final double width;

  const CustomSvg({
    Key key,
    this.path,
    this.height = 16,
    this.width = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SvgPicture.asset(
      path,
      semanticsLabel: 'vector',
      height: height == 0 ? SizeConfig.getDefaultSize : height,
      width: width == 0 ? SizeConfig.getDefaultSize : width,
      fit: BoxFit.fill,
    );
  }
}
