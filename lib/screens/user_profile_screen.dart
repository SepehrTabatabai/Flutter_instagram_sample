import 'package:flutter/material.dart';
import 'package:flutter_insta_application/constants/constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundBlack,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                pinned: false,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: 18.0,
                      left: 17.0,
                    ),
                    child: Icon(Icons.menu),
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(11.0),
                  child: Container(
                    height: 18.0,
                    decoration: BoxDecoration(
                      color: backGroundBlack,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                backgroundColor: backGroundBlack,
                expandedHeight: 173.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/images/appbar_image.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: _getHeaderProfile(),
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: TabBarViewDelegate(
                  TabBar(
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 15.0),
                    indicatorColor: pinkColor,
                    indicatorWeight: 2.0,
                    tabs: [
                      Tab(
                        child: Image.asset('assets/images/icon_tab_posts.png'),
                      ),
                      Tab(
                        child:
                            Image.asset('assets/images/icon_tab_bookmark.png'),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(top: 20.0),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              child: FittedBox(
                                child: Image.asset('assets/images/item4.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        childCount: 10,
                      ),
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(2, 2),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(top: 20.0),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              child: FittedBox(
                                child:
                                    Image.asset('assets/images/item$index.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        childCount: 10,
                      ),
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(2, 2),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getHeaderProfile() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70.0,
            height: 70.0,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2.0,
                color: pinkColor,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(17.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(3.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset("assets/images/Seyed.jpg"),
                ),
              ),
            ),
          ),
          SizedBox(width: 15.0),
          Container(
            height: 70.0,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "سید سپهرعلایی برنامه‌نویس موبایل",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontFamily: 'SM',
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    "S3yeDS3pehr",
                    style: TextStyle(
                      color: Color(0xffC5C5C5),
                      fontSize: 12.0,
                      fontFamily: 'GB',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Image.asset('assets/images/icon_profile_edit.png'),
        ],
      ),
    );
  }
}

class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
  TabBarViewDelegate(this._tabbar);
  TabBar _tabbar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabbar,
    );
  }

  @override
  double get maxExtent => _tabbar.preferredSize.height;

  @override
  double get minExtent => _tabbar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
