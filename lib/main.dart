import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinterest_ui/core/app_routes/app_routes.dart';
import 'package:pinterest_ui/view/home_screen/home_details_screen.dart';
import 'package:pinterest_ui/view/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Standard design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Pinterest UI',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: AppRoute.homeScreen,
          getPages: [
            GetPage(name: AppRoute.homeScreen, page: () => const HomeScreen()),
            GetPage(
              name: AppRoute.homeDetailsScreen,
              page: () => const HomeDetailsScreen(),
            ),
            GetPage(
              name: AppRoute.notificationScreen,
              page: () =>
                  const Scaffold(body: Center(child: Text("Notification"))),
            ),
          ],
        );
      },
    );
  }
}
