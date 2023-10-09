import 'package:flutter/material.dart';
import 'package:flutter_insta_application/constants/constants.dart';
import 'package:flutter_insta_application/screens/activity_screen.dart';
import 'package:flutter_insta_application/screens/add_content_screen.dart';
import 'package:flutter_insta_application/screens/home_screen.dart';
import 'package:flutter_insta_application/screens/search_screen.dart';
import 'package:flutter_insta_application/screens/user_profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedBottomNavigationItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: backGroundBlack,
            currentIndex: _selectedBottomNavigationItem,
            onTap: (int index) {
              setState(() {
                _selectedBottomNavigationItem = index;
              });
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/icon_home.png'),
                activeIcon: Image.asset('assets/images/icon_active_home.png'),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/icon_search_navigation.png'),
                activeIcon: Image.asset(
                    'assets/images/icon_search_navigation_active.png'),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/icon_add_navigation.png'),
                activeIcon:
                    Image.asset('assets/images/icon_add_navigation_active.png'),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/icon_activity_navigation.png'),
                activeIcon: Image.asset(
                    'assets/images/icon_activity_navigation_active.png'),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                      color: greyColor,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset("assets/images/Seyed.jpg"),
                    ),
                  ),
                ),
                activeIcon: Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                      color: pinkColor,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset("assets/images/Seyed.jpg"),
                    ),
                  ),
                ),
                label: "",
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedBottomNavigationItem,
        children: getLayout(),
      ),
    );
  }

  List<Widget> getLayout() {
    return <Widget>[
      HomeScreen(),
      SearchScreen(),
      AddContentScreen(),
      ActivityScreen(),
      UserProfileScreen(),
    ];
  }
}
