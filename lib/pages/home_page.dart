import 'package:flutter/material.dart';

import '../core/utils/asset_path_list.dart' as assetPath;
import '../core/utils/color_util.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/search_icon.dart';
import '../widgets/box_icon.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> _listViewData = [
    {
      "icon-path": assetPath.SPOTIFY_ICON_PATH,
      "type": "Full Time",
      "position": "UI/UX Designer",
      "salary": "\$450/hr",
      "is-active": true,
    },
    {
      "icon-path": assetPath.GOOGLE_ICON_PATH,
      "type": "Full Time",
      "position": "Senior Develop",
      "salary": "\$500/hr",
      "is-active": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CustomAppBar.scaffold(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Find your",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "perfect job",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      prefixIcon: BoxIcon(),
      suffixIcon: SearchIcon(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            _buildTags(),
            SizedBox(height: 10),
            _buildForYouSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTags() {
    return Container(
      child: Row(
        children: [
          _buildFlatButton("New York"),
          SizedBox(width: 15),
          _buildFlatButton("Full Time"),
        ],
      ),
    );
  }

  Widget _buildFlatButton(String title) {
    return FlatButton(
      color: Colors.white,
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                color: ColorUtil.primaryColor,
              ),
            ),
            SizedBox(width: 5),
            Icon(
              Icons.close,
              color: ColorUtil.primaryColor,
              size: 23,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForYouSection() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Align(
            child: Text(
              "For You",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            alignment: Alignment.centerLeft,
          ),
          SizedBox(height: 10),
          Container(
            height: 200,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _buildCard(_listViewData[index]);
                },
                separatorBuilder: (content, index) => SizedBox(
                      width: 20,
                    ),
                itemCount: _listViewData.length),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(Map<String, dynamic> data) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: data["is-active"] ? ColorUtil.primaryColor : Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                
                child: Image.asset(
                  data["icon-path"],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
