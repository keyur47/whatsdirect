import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:whatsdirect/modules/homepage.dart';
import 'package:whatsdirect/widgets/splashScreen.dart';

import 'modules/controller/controller.dart';
void main()async {
    await GetStorage.init();
  runApp(const MyApp());
}

RxBool showNumericContainer = true.obs;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
        return GestureDetector(
          onTap: () async {
            WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
            await Future.delayed(const Duration(milliseconds: 200));
            showNumericContainer.value = true;
          },
           child:  GetMaterialApp(
            debugShowCheckedModeBanner: false,
               initialRoute: SplashScreen.routeName,
               initialBinding: AppBidding(),
               getPages: [
                 GetPage(
                   name: SplashScreen.routeName,
                   page: () => const SplashScreen(),
                   transition: Transition.leftToRight,
                 ),
                 GetPage(
                   name: HomePage.routeName,
                   page: () =>  HomePage(),
                   transition: Transition.leftToRight,
                 ),
               ]
          ),
        );
      },
    );
  }
}


class AppBidding implements Bindings {
  @override
  void dependencies() {
    Get.put(Controller());
  }
}


