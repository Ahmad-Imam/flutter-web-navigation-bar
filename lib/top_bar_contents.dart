import 'package:flutter/material.dart';
import 'package:flutter_nav/const.dart';
import 'package:get/get.dart';

class TopBarContents extends StatefulWidget {

  TopBarContents();

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

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
        color: Colors.white.withOpacity(0.5),
        child: Padding(
          padding: EdgeInsets.all(20),
          child:
              Row(
                children: [
                  Text(
                    'Library',
                    style: TextStyle(
                      color: Color(0xFF077bd7),
                      fontSize: 26,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: screenSize.width/4,),

                      ///home
                      SizedBox(width: screenSize.width / 15),
                      InkWell(
                        onHover: (value) {
                          setState(() {
                            value
                                ? _isHovering[0] = true
                                : _isHovering[0] = false;
                          });
                        },
                        onTap: () {},
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Home',
                              style: TextStyle(
                                  color: _isHovering[0]
                                      ? Color(0xFF077bd7)
                                      : Color(0xFF077bd7),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                              ),
                            ),
                            SizedBox(height: 5),
                            Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              maintainSize: true,
                              visible: _isHovering[0],
                              child: Container(
                                height: 2,
                                width: 20,
                                color: Color(0xFF051441),
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
                            value
                                ? _isHovering[1] = true
                                : _isHovering[1] = false;
                          });
                        },
                        onTap: () {
                          print('ok');
                          setState(() {
                            Get.changeTheme(Get.isDarkMode? k_lightTheme: k_darkTheme);

                          });
                           },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'About',
                              style: TextStyle(
                                  color: _isHovering[1]
                                      ? Color(0xFF077bd7)
                                      : Color(0xFF077bd7),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                              ),
                            ),
                            SizedBox(height: 5),
                            Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              maintainSize: true,
                              visible: _isHovering[1],
                              child: Container(
                                height: 2,
                                width: 20,
                                color: Color(0xFF051441),
                              ),
                            )
                          ],
                        ),
                      ),
                      ///contact
                      SizedBox(width: screenSize.width / 45),
                      InkWell(
                        onHover: (value) {
                          setState(() {
                            value
                                ? _isHovering[2] = true
                                : _isHovering[2] = false;
                          });
                        },
                        onTap: () {},
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Contact',
                              style: TextStyle(
                                  color: _isHovering[0]
                                      ? Color(0xFF077bd7)
                                      : Color(0xFF077bd7),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                              ),
                            ),
                            SizedBox(height: 5),
                            Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              maintainSize: true,
                              visible: _isHovering[2],
                              child: Container(
                                height: 2,
                                width: 20,
                                color: Color(0xFF051441),
                              ),
                            )
                          ],
                        ),
                      ),
                      ///Profile
                      SizedBox(width: screenSize.width / 45),
                      InkWell(
                        onHover: (value) {
                          setState(() {
                            value
                                ? _isHovering[3] = true
                                : _isHovering[3] = false;
                          });
                        },
                        onTap: () {},
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Profile',
                              style: TextStyle(
                                  color: _isHovering[0]
                                      ? Color(0xFF077bd7)
                                      : Color(0xFF077bd7),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                              ),
                            ),
                            SizedBox(height: 5),
                            Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              maintainSize: true,
                              visible: _isHovering[3],
                              child: Container(
                                height: 2,
                                width: 20,
                                color: Color(0xFF051441),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Text('lol'),
                ],
              ),

          ),

      );
    //);
  }
}
