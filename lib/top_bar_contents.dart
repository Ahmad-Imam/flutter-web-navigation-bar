import 'package:flutter/material.dart';
import 'package:flutter_nav/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TopBarContents extends StatefulWidget {
  final scrollPos;
  ScrollController scrollController;
  TopBarContents({this.scrollPos, required this.scrollController});

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  bool themeMode = false;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'AI',
              style: TextStyle(
                color: context.theme.backgroundColor,
                fontSize: 26,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w900,
                letterSpacing: 3,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ///home
                SizedBox(width: screenSize.width / 15),
                InkWell(
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[0] = true : _isHovering[0] = false;
                    });
                  },
                  onTap: () {
                    widget.scrollController.animateTo(10,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInBack);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Home',
                        style: TextStyle(
                            color: _isHovering[0]
                                ? context.theme.primaryColor
                                : context.theme.backgroundColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHovering[0],
                        child: Container(
                          height: 2,
                          width: 20.w,
                          color: context.theme.backgroundColor,
                        ),
                      )
                    ],
                  ),
                ),

                ///about
                SizedBox(width: screenSize.width / 45),
                InkWell(
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[1] = true : _isHovering[1] = false;
                    });
                  },
                  onTap: () {
                    print('ok');
                    setState(() {
                      Get.changeTheme(
                          Get.isDarkMode ? k_lightTheme : k_darkTheme);
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'About',
                        style: TextStyle(
                            color: _isHovering[1]
                                ? context.theme.primaryColor
                                : context.theme.backgroundColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHovering[1],
                        child: Container(
                          height: 2,
                          width: 20.w,
                          color: context.theme.backgroundColor,
                        ),
                      )
                    ],
                  ),
                ),

                ///journey
                SizedBox(width: screenSize.width / 45),
                InkWell(
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[2] = true : _isHovering[2] = false;
                    });
                  },
                  onTap: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Journey',
                        style: TextStyle(
                            color: _isHovering[2]
                                ? context.theme.primaryColor
                                : context.theme.backgroundColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHovering[2],
                        child: Container(
                          height: 2,
                          width: 20.w,
                          color: context.theme.backgroundColor,
                        ),
                      )
                    ],
                  ),
                ),

                ///skills
                SizedBox(width: screenSize.width / 45),
                InkWell(
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[3] = true : _isHovering[3] = false;
                    });
                  },
                  onTap: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Skills',
                        style: TextStyle(
                            color: _isHovering[3]
                                ? context.theme.primaryColor
                                : context.theme.backgroundColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHovering[3],
                        child: Container(
                          height: 2,
                          width: 20.w,
                          color: context.theme.backgroundColor,
                        ),
                      )
                    ],
                  ),
                ),

                ///projects
                SizedBox(width: screenSize.width / 45),
                InkWell(
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[4] = true : _isHovering[4] = false;
                    });
                  },
                  onTap: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Projects',
                        style: TextStyle(
                            color: _isHovering[4]
                                ? context.theme.primaryColor
                                : context.theme.backgroundColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHovering[4],
                        child: Container(
                            height: 2,
                            width: 20.w,
                            color: context.theme.backgroundColor),
                      )
                    ],
                  ),
                ),

                ///hobbies
                SizedBox(width: screenSize.width / 45),
                InkWell(
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[5] = true : _isHovering[5] = false;
                    });
                  },
                  onTap: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Hobby',
                        style: TextStyle(
                            color: _isHovering[5]
                                ? context.theme.primaryColor
                                : context.theme.backgroundColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHovering[5],
                        child: Container(
                          height: 2,
                          width: 20.w,
                          color: context.theme.backgroundColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Icon(
              Icons.light_mode,
              color: context.theme.backgroundColor,
            ),
          ],
        ),
      ),
    );
    //);
  }
}
