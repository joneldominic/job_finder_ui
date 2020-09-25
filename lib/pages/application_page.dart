import 'package:flutter/material.dart';

import '../core/utils/color_util.dart';
import '../core/utils/asset_path_list.dart' as assetPath;

import '../widgets/settings_icon.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/box_icon.dart';

class ApplicationPage extends StatelessWidget {
  final List<Map<String, dynamic>> _listAppliedJobData = [
    {
      "icon-path": assetPath.IBM_ICON_PATH,
      "company": "IBM",
      "position": "Senior Backend Dev.",
      "salary": "\$500/hr",
      "status": "Delivered"
    },
    {
      "icon-path": assetPath.GOOGLE_ICON_PATH,
      "company": "Google China",
      "position": "Data Scientist",
      "salary": "\$500/hr",
      "status": "Delivered"
    },
    {
      "icon-path": assetPath.GOOGLE_ICON_PATH,
      "company": "Google",
      "position": "PHP Framework Developer",
      "salary": "\$900/hr",
      "status": "Delivered"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return CustomAppBar.scaffold(
      title: Text(
        "Your Application",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      prefixIcon: BoxIcon(),
      suffixIcon: SettingsIcon(),
      backgroundColor: ColorUtil.backgroundColor,
      child: Expanded(
        child: Container(
          constraints: BoxConstraints.expand(),
          margin: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppliedJobListView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppliedJobListView() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(vertical: 10),
        child: ListView.separated(
          padding: EdgeInsets.zero,
          separatorBuilder: (content, index) => SizedBox(
            height: 15,
          ),
          itemBuilder: (context, index) {
            return _buildAppliedJobCard(_listAppliedJobData[index]);
          },
          itemCount: _listAppliedJobData.length,
        ),
      ),
    );
  }

  Widget _buildAppliedJobCard(data) {
    return Container(
      height: 150,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 15),
                child: Image.asset(
                  data["icon-path"],
                  height: 50,
                  width: 50,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data["position"],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      data["company"],
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: ColorUtil.tertiaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.more_vert,
                  color: ColorUtil.colorD9D9D9,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton(
                color: ColorUtil.secondaryColor,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    data["status"],
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                      color: ColorUtil.primaryColor,
                    ),
                  ),
                ),
              ),
              Text(
                data["salary"],
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: ColorUtil.color3D3D3D,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
