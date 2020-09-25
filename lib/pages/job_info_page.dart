import 'package:flutter/material.dart';

import '../core/utils/color_util.dart';
import '../core/utils/asset_path_list.dart' as assetPath;

import '../widgets/settings_icon.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/box_icon.dart';

class JobInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppBar.scaffold(
      title: Text(
        "Google LLC",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      titleAlignment: Alignment.center,
      prefixIcon: BoxIcon(),
      suffixIcon: SettingsIcon(),
      backgroundColor: ColorUtil.backgroundColor,
      child: Expanded(
        child: Container(
          color: Colors.white,
          constraints: BoxConstraints.expand(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Test"),
            ],
          ),
        ),
      ),
    );
  }
}
