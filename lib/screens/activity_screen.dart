import 'package:flutter/material.dart';
import 'package:flutter_insta_application/constants/constants.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundBlack,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: backGroundBlack,
              height: 65.0,
              child: TabBar(
                controller: _tabController,
                labelStyle: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'GB',
                ),
                indicatorColor: pinkColor,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 19.0),
                indicatorWeight: 3.0,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    text: "Following",
                  ),
                  Tab(
                    text: "You",
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _getSampleList(),
                  _getSampleList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSampleList() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30.0, top: 20.0),
            child: Text(
              "New",
              style: TextStyle(
                  fontFamily: 'GB', fontSize: 16.0, color: Colors.red),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _getRow();
          }, childCount: 2),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30.0, top: 20.0),
            child: Text(
              "Today",
              style: TextStyle(
                  fontFamily: 'GB', fontSize: 16.0, color: Colors.red),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _getRow();
          }, childCount: 5),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30.0, top: 20.0),
            child: Text(
              "This Week",
              style: TextStyle(
                  fontFamily: 'GB', fontSize: 16.0, color: Colors.red),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _getRow();
          }, childCount: 10),
        )
      ],
    );
  }

  Widget _getRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 18.0),
      child: Row(
        children: [
          Container(
            width: 6.0,
            height: 6.0,
            decoration: BoxDecoration(
              color: pinkColor,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 7.0),
          SizedBox(
            width: 40.0,
            height: 40.0,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('assets/images/Seyed.jpg'),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "S3yeDS3pehR",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'GB',
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    "Start Following",
                    style: TextStyle(
                      color: Color(0xffC5C5C5),
                      fontFamily: 'GM',
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "you",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'GM',
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    "3min",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'GB',
                      fontSize: 12.0,
                    ),
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: Color(0xffC5C5C5),
                width: 2.0,
              ),
            ),
            onPressed: () {},
            child: Text(
              'Message',
              style: TextStyle(
                color: Color(0xffC5C5C5),
                fontFamily: "GB",
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
