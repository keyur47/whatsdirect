import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:whatsdirect/modules/homepage.dart';
import 'package:whatsdirect/utils/app_color.dart';
import 'package:whatsdirect/utils/string_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = '/splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(
  //     const Duration(seconds: 2),
  //     () async {
  //       Get.to(HomePage.routeName);
  //       // Navigator.pushReplacement(
  //       //     context, MaterialPageRoute(builder: (context) => HomePage.routeName));
  //     },
  //   );
  // }
  late Timer _timer;
  List<Color> _kDefaultRainbowColors = const [
    AppColors.black,

  ];
  @override
  void initState() {
    super.initState();
    startTimeOut();
  }

  @override
  void dispose() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.whatsapp,
                  color: AppColor.appColors,
                  size: 90,
                ),
                // VerticalDivider(
                //   width: 1.0,
                //   color: Colors.green,
                // ),
                Text(
                  StringsUtils.whatsDirects,
                  style: TextStyle(
                      fontSize: 28,
                      color: AppColors.darkBlue,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.h),
            child: Container(
              height: 6.h,
              child: LoadingIndicator(
                  indicatorType: Indicator.ballPulse, /// Required, The loading type of the widget
                  colors: _kDefaultRainbowColors,       /// Optional, The color collections/// Optional, The stroke of the line, only applicable to widget which contains line
                  backgroundColor: Colors.transparent,      /// Optional, Background of the widget
                  pathBackgroundColor: Colors.purpleAccent,/// Optional, the stroke backgroundColor
              ),
            ),
          )
        ],
      ),
    );
  }
  void startTimeOut() {
    _timer = Timer.periodic(
      const Duration(seconds: 2),
          (timer) {
        Get.offAllNamed(HomePage.routeName);
      },
    );
  }

}
