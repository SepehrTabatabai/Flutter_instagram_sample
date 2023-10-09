import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_insta_application/screens/search_screen.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({this.controller, Key? key}) : super(key: key);
  final ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 40.0,
          sigmaY: 40.0,
        ),
        child: Container(
          color: Color.fromRGBO(255, 255, 255, 0.09),
          height: 300.0,
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: _getContent(context),
        ),
      ),
    );
  }

  Widget _getContent(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    height: 5.0,
                    width: 67.0,
                    margin: EdgeInsets.only(
                      top: 10.0,
                      bottom: 22.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Share",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'GB',
                          fontSize: 23.0,
                        ),
                      ),
                      Image.asset('assets/images/icon_share_bottomsheet.png'),
                    ],
                  ),
                  SizedBox(height: 32.0),
                  Container(
                    height: 46.0,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.40),
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Image.asset('assets/images/icon_search.png'),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: "Search User",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32.0),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _getItemGrid();
                },
                childCount: 100,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 5.0,
                mainAxisExtent: 110.0,
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(top: 100.0)),
          ],
        ),
        Positioned(
          bottom: 47.0,
          child: ElevatedButton(
            style: Theme.of(context).elevatedButtonTheme.style,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 13.0),
              child: Text(
                "Share",
                style: TextStyle(
                  fontFamily: 'GB',
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _getItemGrid() {
    return Column(
      children: [
        Container(
          width: 60.0,
          height: 60.0,
          child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
              child: FittedBox(
                child: Image.asset("assets/images/Seyedd.jpg"),
                fit: BoxFit.cover,
              )),
        ),
        SizedBox(height: 12.0),
        Text(
          "SepehR",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "GB",
            fontSize: 11.0,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
