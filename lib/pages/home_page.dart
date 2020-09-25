import 'package:flutter/material.dart';

import '../core/utils/route_list.dart' as routes;
import '../core/utils/asset_path_list.dart' as assetPath;
import '../core/utils/color_util.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/search_icon.dart';
import '../widgets/box_icon.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> _listForYouData = [
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
    {
      "icon-path": assetPath.IBM_ICON_PATH,
      "type": "Part Time",
      "position": "Visual Designer",
      "salary": "\$450/hr",
      "is-active": false,
    },
  ];

  final List<Map<String, dynamic>> _listRecentlyAddedData = [
    {
      "icon-path": assetPath.IBM_ICON_PATH,
      "company": "IBM",
      "position": "Visual Designer",
      "salary": "\$450/hr",
    },
    {
      "icon-path": assetPath.GOOGLE_ICON_PATH,
      "company": "Google",
      "position": "Server Technician",
      "salary": "\$500/hr",
    },
    {
      "icon-path": assetPath.FACEBOOK_ICON_PATH,
      "company": "Facebook",
      "position": "Ajax Develop",
      "salary": "\$250/hr",
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
      onTapSuffix: () => Navigator.of(context).pushNamed(
        routes.SEARCH_ROUTE,
      ),
      backgroundColor: ColorUtil.backgroundColor,
      child: Expanded(
        child: Container(
          constraints: BoxConstraints.expand(),
          margin: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTags(),
              SizedBox(height: 10),
              _buildForYouSection(),
              SizedBox(height: 10),
              _buildRecentlyAddedSection(),
            ],
          ),
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
            height: 190,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _buildForYouCard(_listForYouData[index]);
              },
              separatorBuilder: (content, index) => SizedBox(
                width: 15,
              ),
              itemCount: _listForYouData.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForYouCard(Map<String, dynamic> data) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: 210,
      decoration: BoxDecoration(
        color: data["is-active"] ? ColorUtil.primaryColor : Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  data["icon-path"],
                  height: 40,
                  width: 40,
                ),
                Text(
                  data["type"],
                  style: TextStyle(
                    color: data["is-active"] ? Colors.white : Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data["position"],
                  style: TextStyle(
                    color: data["is-active"] ? Colors.white : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  data["salary"],
                  style: TextStyle(
                    color: data["is-active"] ? Colors.white : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentlyAddedSection() {
    return Expanded(
      child: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recently Added",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 5, bottom: 10),
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return _buildRecentlyAddedCard(
                        _listRecentlyAddedData[index]);
                  },
                  separatorBuilder: (content, index) => SizedBox(
                    height: 10,
                  ),
                  itemCount: _listRecentlyAddedData.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentlyAddedCard(Map<String, dynamic> data) {
    return Container(
      height: 75,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(right: 15),
            child: Image.asset(
              data["icon-path"],
              height: 40,
              width: 40,
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
                      color: ColorUtil.tertiaryColor),
                ),
              ],
            ),
          ),
          Text(
            data["salary"],
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
