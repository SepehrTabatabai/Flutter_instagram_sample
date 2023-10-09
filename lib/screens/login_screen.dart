import 'package:flutter/material.dart';
import 'package:flutter_insta_application/constants/constants.dart';
import 'package:flutter_insta_application/screens/switch_account_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode negahban1 = FocusNode();
  @override
  void initState() {
    super.initState();
    negahban1.addListener(() {
      setState(() {});
    });
    negahban2.addListener(() {
      setState(() {});
    });
  }

  FocusNode negahban2 = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff323A99),
            Color(0xff98BFC),
          ],
        ),
      ),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _getImageContainer(),
            _getContainerBox(),
          ],
        ),
      ),
    );
  }

  Widget _getContainerBox() {
    return Column(
      children: [
        Expanded(child: Container()),
        SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14.0),
                topRight: Radius.circular(14.0),
              ),
              color: backGroundBlack,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: double.infinity),
                SizedBox(height: 35.0),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign in to ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      width: 102.0,
                      height: 25.0,
                      child: Image(
                        image: AssetImage("assets/images/moodinger_logo.png"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 34.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    focusNode: negahban1,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      labelText: "Email",
                      labelStyle: TextStyle(
                          fontFamily: 'GM',
                          fontSize: 20.0,
                          color: negahban1.hasFocus ? pinkColor : Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: greyColor, width: 3.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: pinkColor, width: 3.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    focusNode: negahban2,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      labelText: "Password",
                      labelStyle: TextStyle(
                          fontFamily: 'GM',
                          fontSize: 20.0,
                          color: negahban2.hasFocus ? pinkColor : Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: greyColor, width: 3.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: pinkColor, width: 3.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                SizedBox(
                  height: 46.0,
                  width: 129.0,
                  child: ElevatedButton(
                    style: Theme.of(context).elevatedButtonTheme.style,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SwitchAccountScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "sign in",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
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
          ),
        )
      ],
    );
  }

  Widget _getImageContainer() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: 60,
      child: Column(
        children: [
          Expanded(
            child: Image(
              image: AssetImage("assets/images/rocket.png"),
            ),
          ),
          Expanded(
            child: Container(),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    negahban1.dispose();
    negahban2.dispose();
  }
}
