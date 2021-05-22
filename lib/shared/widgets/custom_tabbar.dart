import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    Key key,
    @required this.labels,
    @required this.initialLabelIndex,
    @required this.selectedLabelIndex,
    @required this.selectedTextStyle,
    @required this.unSelectedTextStyle,
    this.height,
    this.icons,
    this.selectedBackgroundColor,
    this.unSelectedBackgroundColor,
    this.width,
    this.borderRadius,
    this.padding,
  }) : super(key: key);

  final List<String> labels;
  final List<IconData> icons;
  final int initialLabelIndex;
  final double width;
  final double height;

//  final BoxDecoration selectedDecoration;
//  final BoxDecoration unSelectedDecoration;
  final Color selectedBackgroundColor;
  final Color unSelectedBackgroundColor;
  final TextStyle selectedTextStyle;
  final TextStyle unSelectedTextStyle;
  final Function(int) selectedLabelIndex;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  var _labels = List<DataTab>();

  _setDefaultSelected() {
    setState(() {
      if (_labels.isNotEmpty) {
        for (int x = 0; x < _labels.length; x++) {
          _labels[x].title = widget.labels[x];
        }
      } else {
        for (int x = 0; x < widget.labels.length; x++) {
          if (x == widget.initialLabelIndex) {
            _labels.add(DataTab(title: widget.labels[x], isSelected: true));
          } else {
            _labels.add(DataTab(title: widget.labels[x], isSelected: false));
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _setDefaultSelected();
    var width = widget.width != null ? widthInPercent(widget.width, context) : widthInPercent(100, context);

    return widget.labels.length <= 1
        ? Text(
            "Error : Label should >1",
            style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 20),
          )
        : Container(
            width: width,
            height: widget.height ?? 45,
            margin: widget.padding ?? EdgeInsets.zero,
            decoration: BoxDecoration(
                color: widget.unSelectedBackgroundColor ?? Colors.red,
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: const Offset(0.0, 1.5),
                    blurRadius: 1.0,
                    spreadRadius: -1.0,
                  )
                ]),
            child: ListView.builder(
              itemCount: _labels.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ButtonsTab(
                  unSelectedColor: widget.unSelectedBackgroundColor ?? Color(0xffe0e0e0),
                  width: width / widget.labels.length,
                  title: _labels[index].title,
                  icons: widget.icons != null ? widget.icons[index] : null,
                  selectedTextStyle: widget.selectedTextStyle,
                  unSelectedTextStyle: widget.unSelectedTextStyle,
                  isSelected: _labels[index].isSelected,
                  radius: widget.borderRadius ?? 30,
                  selectedColor: widget.selectedBackgroundColor ?? Theme.of(context).primaryColor,
                  onPressed: () {
                    try {
                      for (int x = 0; x < _labels.length; x++) {
                        setState(() {
                          if (_labels[index] == _labels[x]) {
                            _labels[x].isSelected = true;
                            widget.selectedLabelIndex(index);
                          } else
                            _labels[x].isSelected = false;
                        });
                      }
                    } catch (e) {
                      print("err : $e");
                    }
                  },
                );
              },
            ));
  }
}

class DataTab {
  String title;
  bool isSelected;

  DataTab({this.title, this.isSelected});
}

widthInPercent(double percent, BuildContext context) {
  var toDouble = percent / 100;
  return MediaQuery.of(context).size.width * toDouble;
}

heightInPercent(double percent, BuildContext context) {
  var toDouble = percent / 100;
  return MediaQuery.of(context).size.height * toDouble;
}

const BoxDecoration bdHeader = BoxDecoration(boxShadow: [
  BoxShadow(
    color: Colors.black12,
    offset: const Offset(0.0, 1.5),
    blurRadius: 1.0,
    spreadRadius: 1.0,
  )
]);

class ButtonsTab extends StatefulWidget {
  const ButtonsTab(
      {Key key,
      this.title,
      this.onPressed,
      @required this.width,
      this.height,
      this.isSelected,
      this.radius,
      this.selectedTextStyle,
      this.unSelectedTextStyle,
      @required this.selectedColor,
      this.icons,
      @required this.unSelectedColor})
      : super(key: key);

  final String title;
  final Function onPressed;
  final double width;
  final double height;
  final Color selectedColor;
  final Color unSelectedColor;
  final TextStyle selectedTextStyle;
  final TextStyle unSelectedTextStyle;

//  final BoxDecoration selectedDecoration;
//  final BoxDecoration unSelectedDecoration;
  final bool isSelected;
  final double radius;
  final IconData icons;

  @override
  _ButtonsTabState createState() => _ButtonsTabState();
}

class _ButtonsTabState extends State<ButtonsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? widthInPercent(100, context),
      height: widget.height ?? 50,
      decoration: widget.isSelected
          ? bdHeader.copyWith(borderRadius: BorderRadius.circular(widget.radius), color: widget.selectedColor)
          : null,
      child: FlatButton(
          onPressed: widget.onPressed,
          shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.radius)),
          padding: EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.icons != null
                  ? Icon(
                      widget.icons,
                      color: widget.isSelected ? widget.selectedTextStyle.color : widget.unSelectedTextStyle.color,
                    )
                  : Container(),
              Visibility(
                visible: widget.icons != null,
                child: SizedBox(
                  width: 4,
                ),
              ),
              Text(
                widget.title,
                style: widget.isSelected ? widget.selectedTextStyle : widget.unSelectedTextStyle,
                textAlign: TextAlign.center,
              )
            ],
          )),
    );
  }
}
