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
  final Alignment titleAlignment;

  const CustomAppBar.scaffold({
    Key key,
    this.onTapPrefix,
    this.onTapSuffix,
    @required this.title,
    @required this.prefixIcon,
    this.backgroundColor,
    this.iconColor,
    this.suffixIcon,
    this.titleAlignment = Alignment.centerLeft,
    @required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Container(
          margin: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: onTapPrefix,
                      child: prefixIcon,
                    ),
                    GestureDetector(
                      onTap: onTapSuffix,
                      child: suffixIcon ?? Container(),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 25,
                  bottom: 20,
                ),
                alignment: titleAlignment,
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
