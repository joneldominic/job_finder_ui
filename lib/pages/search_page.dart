import 'package:flutter/material.dart';

import '../core/utils/route_list.dart' as routes;
import '../core/utils/color_util.dart';
import '../core/utils/asset_path_list.dart' as assetPath;

import '../widgets/custom_app_bar.dart';
import '../widgets/box_icon.dart';

class SearchPage extends StatelessWidget {
  final List<Map<String, dynamic>> _categoryList = [
    {
      "title": "UI/UX Designer",
      "is-selected": true,
    },
    {
      "title": "Motion Designer",
      "is-selected": false,
    },
    {
      "title": "Back-end Developer",
      "is-selected": false,
    },
  ];

  final List<Map<String, dynamic>> _listJobData = [
    {
      "icon-path": assetPath.IBM_ICON_PATH,
      "company": "IBM",
      "position": "Senior Backend Dev.",
      "salary": "\$500/hr",
      "date": "24.03.2020"
    },
    {
      "icon-path": assetPath.FACEBOOK_ICON_PATH,
      "company": "Facebook",
      "position": "Storyboard Artist",
      "salary": "\$950/hr",
      "date": "24.03.2020"
    },
    {
      "icon-path": assetPath.GOOGLE_ICON_PATH,
      "company": "Google Philippines",
      "position": "Flutter Engineer",
      "salary": "\$1000/hr",
      "date": "24.03.2020"
    },
    {
      "icon-path": assetPath.GOOGLE_ICON_PATH,
      "company": "Google China",
      "position": "Data Scientist",
      "salary": "\$500/hr",
      "date": "24.03.2020"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return CustomAppBar.scaffold(
      title: Text(
        "Search Job",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      prefixIcon: BoxIcon(),
      backgroundColor: ColorUtil.backgroundColor,
      child: Expanded(
        child: Container(
          constraints: BoxConstraints.expand(),
          margin: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchField(),
              SizedBox(height: 10),
              _buildCategorySection(),
              SizedBox(height: 10),
              _buildJobListView(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: InputBorder.none,
          labelText: 'Search job title, job type ...',
          floatingLabelBehavior: FloatingLabelBehavior.never,
          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          labelStyle: TextStyle(
            fontSize: 12,
            color: ColorUtil.tertiaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySection() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (content, index) => SizedBox(
          width: 15,
        ),
        itemBuilder: (context, index) {
          return _buildCategoryButton(_categoryList[index]);
        },
        itemCount: _categoryList.length,
      ),
    );
  }

  Widget _buildCategoryButton(Map<String, dynamic> data) {
    return FlatButton(
      color: data["is-selected"]
          ? ColorUtil.primaryColor
          : ColorUtil.backgroundFillF6F6F7,
      onPressed: () {},
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: data["is-selected"]
              ? ColorUtil.primaryColor
              : ColorUtil.tertiaryColor,
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          data["title"],
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w900,
            color: data["is-selected"] ? Colors.white : ColorUtil.tertiaryColor,
          ),
        ),
      ),
    );
  }

  Widget _buildJobListView(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: ListView.separated(
          padding: EdgeInsets.zero,
          separatorBuilder: (content, index) => SizedBox(
            height: 15,
          ),
          itemBuilder: (context, index) {
            return _buildJobCard(_listJobData[index], context);
          },
          itemCount: _listJobData.length,
        ),
      ),
    );
  }

  Widget _buildJobCard(data, BuildContext context) {
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
                onTap: () => Navigator.of(context).pushNamed(
                  routes.JOB_INFO_ROUTE,
                  arguments: data,
                ),
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
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 15,
                        color: ColorUtil.primaryColor,
                      ),
                      SizedBox(width: 5),
                      Text(
                        data["date"],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          color: ColorUtil.primaryColor,
                        ),
                      ),
                    ],
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
