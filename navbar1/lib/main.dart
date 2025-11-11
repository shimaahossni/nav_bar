import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'nav_bar_items_model.dart';
import 'nav_bar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.green,
            bottomNavigationBar: NavBar(

              // Customize colors
              selectedColor: Colors.white,
              unselectedColor: Colors.grey,
              selectedLabelColor: Colors.white,
              unselectedLabelColor: Colors.grey,

              // Customize sizes
              selectedIconSize: 60.0.h,
              unselectedIconSize: 24.0.h,
              selectedlabelFontSize: 20.0.sp,
              unselectedlabelFontSize: 8.0.sp,


              navbarheight: 50.h,

              initialIndex: 0,

              items: [
                NavBarItemsModel(
                  icon: Icons.home,
                  label: 'Home',
                  onPressed: () {
                    debugPrint('Home pressed');
                  },
                ),
                NavBarItemsModel(
                  icon: Icons.person,
                  label: 'Profile',
                  onPressed: () {
                    debugPrint('Profile pressed');
                  },
                ),
                NavBarItemsModel(
                  icon: Icons.login,
                  onPressed: () {
                    debugPrint('Login pressed');
                  },
                ),
                NavBarItemsModel(
                  icon: Icons.settings,
                  label: 'Settings',
                  onPressed: () {
                    debugPrint('Settings pressed');
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
