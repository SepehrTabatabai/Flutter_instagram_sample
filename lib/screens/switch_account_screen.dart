import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_insta_application/constants/constants.dart';
import 'package:flutter_insta_application/screens/home_screen.dart';

class SwitchAccountScreen extends StatelessWidget {
  const SwitchAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundBlack,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/switch_account_background.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 210,
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 3,
                            sigmaY: 3,
                          ),
                          child: Container(
                            width: 340,
                            height: 352.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromRGBO(255, 255, 255, 0.5),
                                  Color.fromRGBO(255, 255, 255, 0.2),
                                ],
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 32.0),
                                Container(
                                  width: 200.0,
                                  height: 160.0,
                                  child: Image(
                                    image:
                                        AssetImage("assets/images/Seyed.jpg"),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                Text("SEYED",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium),
                                SizedBox(height: 20.0),
                                SizedBox(
                                  height: 46.0,
                                  width: 129.0,
                                  child: ElevatedButton(
                                    style: Theme.of(context)
                                        .elevatedButtonTheme
                                        .style,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomeScreen(),
                                        ),
                                      );
                                    },
                                    child: Text("Confirm"),
                                  ),
                                ),
                                SizedBox(height: 15.0),
                                Text(
                                  "switch account",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 132.0, bottom: 63.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont have an account ? /",
                      style: TextStyle(
                        fontFamily: 'GB',
                        fontSize: 16.0,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      "SignUp",
                      style: TextStyle(
                        fontFamily: 'GB',
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
