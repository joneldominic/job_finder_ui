import 'package:flutter/material.dart';

import '../core/utils/color_util.dart';
import '../core/utils/asset_path_list.dart' as assetPath;

import '../widgets/settings_icon.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/box_icon.dart';

class JobInfoPage extends StatelessWidget {
  final List<String> _requirementsList = [
    "Exceptional communication skills and team working skills.",
    "Know the principles of animation and you can create high fidelity prototypes.",
    "Direct working experience using Adobe After Effects, Adobe Premiere and Adobe Photoshop.",
  ];

  @override
  Widget build(BuildContext context) {
    return CustomAppBar.scaffold(
      title: Text(
        "Google LLC",
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
      titleAlignment: Alignment.center,
      prefixIcon: BoxIcon(),
      suffixIcon: SettingsIcon(),
      backgroundColor: ColorUtil.backgroundColor,
      child: Expanded(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.only(
            top: 25,
            left: 30,
            right: 30,
            bottom: 25,
          ),
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(70),
              topRight: Radius.circular(70),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 7,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: ColorUtil.backgroundFillF6F6F7,
                    width: 2,
                  ),
                ),
              ),
              SizedBox(height: 35),
              Container(
                child: Image.asset(
                  assetPath.GOOGLE_LARGE_ICON_PATH,
                  height: 70,
                ),
              ),
              SizedBox(height: 30),
              Container(
                child: Column(
                  children: [
                    Text(
                      "Product Designer",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: ColorUtil.primaryTextColor,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      "New York City",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: ColorUtil.secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      color: ColorUtil.primaryColor,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: ColorUtil.primaryColor,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Full Time Job",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "\$350/hr",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: ColorUtil.color3D3D3D,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Requirements",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: ColorUtil.color2D2D2D),
                      ),
                      SizedBox(height: 15),
                      Expanded(
                        child: Container(
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            separatorBuilder: (content, index) => SizedBox(
                              height: 15,
                            ),
                            itemBuilder: (context, index) {
                              return _buildBulletedText(
                                  _requirementsList[index]);
                            },
                            itemCount: _requirementsList.length,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: FlatButton(
                  color: ColorUtil.primaryColor,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: ColorUtil.primaryColor,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "Send Application",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBulletedText(String title) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 7,
            width: 7,
            decoration: new BoxDecoration(
              color: ColorUtil.colorD9D9D9,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 10),
          Flexible(
            child: Text(
              title,
              maxLines: 3,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
