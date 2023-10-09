import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_insta_application/constants/constants.dart';
import 'package:flutter_insta_application/screens/share_bottomsheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: backGroundBlack,
        elevation: 1.0,
        title: Container(
          child: Image.asset("assets/images/moodinger_logo.png"),
          width: 124.0,
          height: 24.0,
        ),
        actions: [
          Container(
            height: 24.0,
            width: 24.0,
            child: Image.asset("assets/images/icon_direct.png"),
            margin: EdgeInsets.only(right: 18.0),
          ),
        ],
      ),
      backgroundColor: backGroundBlack,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getStoryList(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: 34.0),
                      _getHeaderPost(),
                      SizedBox(height: 24.0),
                      _getPostContent(),
                    ],
                  );
                },
                childCount: 15,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getStoryList() {
    return Container(
      height: 120.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) {
          return index == 0 ? _getAddStoryBox() : _getStoryListBox();
        },
      ),
    );
  }

  Widget _getPostList() {
    return ListView.builder(
      physics: PageScrollPhysics(),
      shrinkWrap: true,
      itemCount: 9,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(height: 34.0),
            _getHeaderPost(),
            SizedBox(height: 24.0),
            _getPostContent(),
          ],
        );
      },
    );
  }

  Widget _getPostContent() {
    return Container(
      height: 440.0,
      width: 394.0,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            top: 0.0,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset('assets/images/Seyed.jpg')),
          ),
          Positioned(
            top: 15.0,
            right: 15.0,
            child: Image.asset('assets/images/icon_video.png'),
          ),
          Positioned(
            bottom: 15.0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 20.0,
                  sigmaY: 20.0,
                ),
                child: Container(
                  width: 340,
                  height: 46.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(255, 0, 0, 0.5),
                        Color.fromRGBO(0, 0, 0, 0.2),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 15.0),
                      Row(
                        children: [
                          Image.asset('assets/images/icon_hart.png'),
                          SizedBox(width: 6.0),
                          Text(
                            "2.6k",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'GB',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 42.0),
                      Row(
                        children: [
                          Image.asset('assets/images/icon_comments.png'),
                          SizedBox(width: 6.0),
                          Text(
                            "1.5k",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'GB',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 42.0),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            barrierColor: Colors.transparent,
                            backgroundColor: Colors.transparent,
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
                                ),
                                child: DraggableScrollableSheet(
                                  maxChildSize: 0.8,
                                  initialChildSize: 0.4,
                                  minChildSize: 0.2,
                                  builder: (BuildContext context, controler) {
                                    return ShareBottomSheet(
                                      controller: controler,
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: Image.asset('assets/images/icon_share.png'),
                      ),
                      SizedBox(width: 42.0),
                      Image.asset('assets/images/icon_save.png'),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getHeaderPost() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          _getStoryBox(),
          Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "SEYED",
                  style: TextStyle(
                    fontFamily: 'GB',
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  "سید سپهر علایی طباطبایی برنامه نویس موبایل",
                  style: TextStyle(
                    fontFamily: 'SM',
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset('assets/images/icon_menu.png')
        ],
      ),
    );
  }

  Widget _getAddStoryBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          Container(
            width: 64.0,
            height: 64.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: backGroundBlack,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Image.asset('assets/images/icon_plus.png'),
              ),
            ),
          ),
          SizedBox(height: 12.0),
          Text(
            "Your Story",
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _getStoryBox() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(17),
      padding: EdgeInsets.all(4),
      color: pinkColor,
      strokeWidth: 2.0,
      dashPattern: [40, 10],
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
          height: 38.0,
          width: 38.0,
          child: FittedBox(
            child: Image.asset('assets/images/Seyed.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _getStoryListBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(17),
            padding: EdgeInsets.all(4),
            color: pinkColor,
            strokeWidth: 2.0,
            dashPattern: [40, 10],
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Container(
                  height: 58.0,
                  width: 58.0,
                  child: FittedBox(
                    child: Image.asset('assets/images/Seyed.jpg'),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            "Data",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
