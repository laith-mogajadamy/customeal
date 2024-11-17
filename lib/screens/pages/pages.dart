import 'package:customeal/screens/pages/home.dart';
import 'package:customeal/screens/pages/personalprofile.dart';
import 'package:customeal/screens/welcome/controller/enter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPages extends StatefulWidget {
  const MyPages({super.key});

  @override
  State<MyPages> createState() => _MyPagesState();
}

class _MyPagesState extends State<MyPages> {
  late int select = 0;
  late PageController controller;
  bool hasnet = true;

  @override
  void initState() {
    super.initState();

    controller = PageController(initialPage: select, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (select != 0) {
          setState(() {
            select = 0;
            controller.jumpToPage(select);
          });
          return false;
        } else {
          // SystemNavigator.pop();
          return true;
        }
      },
      child: BlocBuilder<EnterBloc, EnterState>(
        builder: (context, state) {
          return Scaffold(
            extendBody: true,
            body: PageView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                Home(),
                PersonalProfile(),
              ],
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.black, width: 2.h),
                  ),
                ),
                child: BottomNavigationBar(
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: "Profile",
                    ),
                  ],
                  currentIndex: select,
                  onTap: (index) {
                    setState(() {
                      select = index;
                      controller.jumpToPage(select);
                    });
                  },
                  elevation: 0,
                  selectedItemColor: Colors.orange,
                  selectedFontSize: 12.sp,
                  unselectedFontSize: 10.sp,
                  selectedIconTheme:
                      IconThemeData(size: 30.r, color: Colors.orange),
                  showUnselectedLabels: true,
                  unselectedIconTheme:
                      IconThemeData(size: 25.r, color: Colors.grey),
                  unselectedItemColor: Colors.grey,
                  type: BottomNavigationBarType.fixed,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  bool get wantKeepAlive => true;
}
