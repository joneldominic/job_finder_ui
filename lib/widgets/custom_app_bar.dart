import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final GestureTapCallback onTapPrefix;
  final GestureTapCallback onTapSuffix;
  final Widget title;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final Color iconColor;
  final Color backgroundColor;
  final Widget child;

  const CustomAppBar.scaffold({
    Key key,
    this.onTapPrefix,
    this.onTapSuffix,
    @required this.title,
    @required this.prefixIcon,
    this.backgroundColor,
    this.iconColor,
    this.suffixIcon,
    @required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: onTapPrefix,
                    child: prefixIcon,
                  ),
                  GestureDetector(
                    onTap: onTapSuffix,
                    child: suffixIcon,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  top: 25,
                  bottom: 20,
                ),
                alignment: Alignment.centerLeft,
                child: title,
              ),
              child ?? Container(),
            ],
          ),
        ),
      ),
    );
  }
}
