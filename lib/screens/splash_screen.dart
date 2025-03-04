import 'dart:async';
import 'package:flutter/material.dart';
import 'package:facebook_replication/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getIsLogin();
    super.initState();
  }

  void getIsLogin() {
    Timer(
      const Duration(
        seconds: 4),
        () => Navigator.popAndPushNamed(context, "/login"),
    );
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        height: ScreenUtil().screenHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/nuSpace.png',
            ),
            SizedBox(
              height: ScreenUtil().setHeight(120),
            ),
            const LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(FB_DARK_PRIMARY),

            ),
          ],
        ),
      ),
    );
  }

}