import 'package:flutter/material.dart';
import 'package:flutter_insta_application/constants/constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'activity_screen.dart';

class AddContentScreen extends StatelessWidget {
  const AddContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundBlack,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _getWholeScrollingPart(),
            _getBottom(),
          ],
        ),
      ),
    );
  }
}

Widget _getHeaderSection() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 27.0, horizontal: 18.0),
    child: Row(
      children: [
        Text(
          "Post",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'GB',
            fontSize: 20.0,
          ),
        ),
        SizedBox(width: 10.0),
        Image.asset('assets/images/icon_arrow_down.png'),
        Spacer(),
        Text(
          "Next",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'GB',
            fontSize: 16.0,
          ),
        ),
        SizedBox(width: 5.0),
        Builder(
          builder: (context) => InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ActivityScreen()),
              );
            },
            child: Image.asset('assets/images/icon_arrow_right_box.png'),
          ),
        ),
      ],
    ),
  );
}

Widget _getSelectedImageContainer() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 5.0),
    height: 394.0,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      child: Container(
        height: 394.0,
        width: double.infinity,
        child: FittedBox(
          child: Image.asset('assets/images/moon.png'),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget _getWholeScrollingPart() {
  return CustomScrollView(
    slivers: [
      SliverToBoxAdapter(
        child: _getHeaderSection(),
      ),
      SliverToBoxAdapter(
        child: _getSelectedImageContainer(),
      ),
      SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: FittedBox(
                    child: Image.asset('assets/images/list4.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            childCount: 15,
          ),
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            repeatPattern: QuiltedGridRepeatPattern.inverted,
            pattern: [
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 1),
            ],
          ),
        ),
      ),
      SliverPadding(padding: EdgeInsets.only(bottom: 83.0))
    ],
  );
}

Widget _getBottom() {
  return Container(
    decoration: BoxDecoration(
      color: backGroundBlack,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15.0),
        topRight: Radius.circular(15.0),
      ),
    ),
    width: double.infinity,
    height: 65.0,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Draft",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'GB',
              fontSize: 16.0,
            ),
          ),
          Text(
            "Gallery",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'GB',
              fontSize: 16.0,
            ),
          ),
          Text(
            "Take",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'GB',
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    ),
  );
}
