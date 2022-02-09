import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nav/LinePainter.dart';
import 'package:flutter_nav/const.dart';
import 'package:flutter_nav/custom_clip.dart';
import 'package:flutter_nav/responsive.dart';
import 'package:flutter_nav/top_bar_contents.dart';
import 'package:flutter_nav/widgets/button_elevated.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:rive/rive.dart';
import 'model/project_model.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';
import 'widgets/progress_bar.dart';

import 'menu_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;

      print('ooopppp $_scrollPosition');
    });

    animationControllerContainerRight1.forward();
    if (_scrollPosition > 00 && _scrollPosition < 400) {
      circle1 = true;
      print(circle1);

      animationControllerLine1.forward();
    } else {
      circle1 = false;
    }

    if (_scrollPosition > 600 && _scrollPosition <= 900) {
      //  dynamic anim =  animationControllerLine1.drive(CurveTween(curve: Curves.bounceIn));
      animationControllerLine1.forward();
      // animationControllerContainerLeft1.drive(CurveTween(curve: Curves.fastOutSlowIn));
      animationControllerContainerLeft1.forward();
      animationControllerOpacity.forward();
      animationControllerContainerRight1.forward();
      print(animationControllerContainerLeft1.value);
    }
    if (_scrollPosition < 600) {
      animationControllerLine1.reset();
      animationControllerOpacity.reset();
      animationControllerContainerRight1.reset();
      animationControllerContainerLeft1.reset();
    }
    if (_scrollPosition > 900) {
      animationControllerLine1.reverse();
      animationControllerOpacity.reverse();
      animationControllerContainerRight1.reverse();
      animationControllerContainerLeft1.reverse();
      print(animationControllerContainerLeft1.value);
    }
  }

  Test tst = Test();

  testFuture() {
    Timer(Duration(seconds: 0), () {
      setState(() {
        txtanimation = true;
      });
      print("Yeah, this line is printed after 3 seconds  and $txtanimation");
    });

    Timer(Duration(seconds: 2), () {
      setState(() {
        txtanimation = false;
      });
      print("Yeah, this line is printed lol 3 seconds  and $txtanimation");
    });
  }

  @override
  void initState() {
    tst.addtoList();

    testFuture();

    print('pp');
    print(tst.lsts[0].pic[0]![0]);

    _scrollController.addListener(_scrollListener);
    animationControllerLine1 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    animationLine1 = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animationControllerLine1, curve: Curves.decelerate));

    animationControllerContainerLeft1 = AnimationController(
        lowerBound: -0.5,
        upperBound: 0.0,
        vsync: this,
        duration: Duration(milliseconds: 2000));

    animationContainerLeft1 = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: animationControllerContainerLeft1,
            curve: Curves.decelerate));

    animationControllerContainerRight1 = AnimationController(
        lowerBound: -0.5,
        upperBound: 0.0,
        vsync: this,
        duration: Duration(milliseconds: 2000));

    animationContainerRight1 = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: animationControllerContainerRight1,
            curve: Curves.decelerate));

    animationControllerOpacity = AnimationController(
        lowerBound: 0,
        upperBound: 1,
        vsync: this,
        duration: Duration(milliseconds: 2000));

    animationOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationControllerOpacity,
        curve: Curves.decelerate,
      ),
    );

    super.initState();
  }

  RxBool isActive = false.obs;

  bool boxWidth = false;
  bool scrollDown = false;
  bool expansion1 = false;
  bool circle1 = false;
  bool txtanimation = false;
  bool serviceHover1 = false;
  bool serviceHover2 = false;
  bool serviceHover3 = false;

  late AnimationController animationControllerLine1;
  late Animation animationLine1;

  late AnimationController animationControllerContainerLeft1;
  late Animation animationContainerLeft1;

  late AnimationController animationControllerContainerRight1;
  late Animation animationContainerRight1;

  late AnimationController animationControllerOpacity;
  late Animation animationOpacity;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: ResponsiveWidget.isSmallScreen(context)
            ? AppBar(
                iconTheme: IconThemeData(color: Colors.green),
                backgroundColor: Colors.white70,
                elevation: 0,
                centerTitle: true,
                // leading: MenuDrawer(),
                title: Text(
                  'Library',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                ),
              )
            : PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 70),
                child: TopBarContents(
                  scrollPos: _scrollPosition,
                  scrollController: _scrollController,
                ),
              ),
        drawer: MenuDrawer(),
        body: SingleChildScrollView(
          controller: _scrollController,
          physics: ClampingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(
                    () => Switch(
                      value: isActive.value,
                      onChanged: (val) {
                        isActive.value = val;
                        Get.changeThemeMode(
                          isActive.value ? ThemeMode.light : ThemeMode.dark,
                        );
                      },
                    ),
                  ),

                  // Container(
                  //   height: 200,
                  //   color: Colors.red,
                  //   child: Stack(
                  //     children: <Widget>[
                  //       Positioned(
                  //         left: MediaQuery.of(context).size.width * 0.15,
                  //         child: AnimatedBuilder(
                  //           animation: AnimationController(
                  //             duration: const Duration(seconds: 1),
                  //             vsync: this,
                  //           ),
                  //           builder: (context, child) {
                  //             return SlideTransition(
                  //                 position: Tween<Offset>(
                  //                   begin: const Offset(-2, 0),
                  //                   end: const Offset(0, 0),
                  //                 ).animate(CurvedAnimation(
                  //                     curve: const Interval(0, 1,
                  //                         curve: Curves.easeIn),
                  //                     parent: AnimationController(
                  //                       duration: const Duration(seconds: 1),
                  //                       vsync: this,
                  //                     ))),
                  //                 child: child);
                  //           },
                  //           child: Container(
                  //             height: MediaQuery.of(context).size.height,
                  //             width: MediaQuery.of(context).size.width * 0.85,
                  //             color: Colors.orange,
                  //           ),
                  //         ),
                  //       ),
                  //       Positioned(
                  //         left: 0,
                  //         child: AnimatedBuilder(
                  //           animation: AnimationController(
                  //             duration: const Duration(seconds: 1),
                  //             vsync: this,
                  //           ),
                  //           builder: (context, child) {
                  //             return SlideTransition(
                  //                 position: Tween<Offset>(
                  //                   begin: const Offset(-1, 0),
                  //                   end: const Offset(0, 0),
                  //                 ).animate(CurvedAnimation(
                  //                     curve: const Interval(.01, 0.25,
                  //                         curve: Curves.easeInExpo),
                  //                     parent: AnimationController(
                  //                       duration: const Duration(seconds: 1),
                  //                       vsync: this,
                  //                     ))),
                  //                 child: child);
                  //           },
                  //           child: Container(
                  //             height: MediaQuery.of(context).size.height,
                  //             width: MediaQuery.of(context).size.width * 0.15,
                  //             color: Colors.black,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // Container(
                  //   width: 100,
                  //   height: 100,
                  //   color: Colors.black,
                  //   child: RiveAnimation.asset(
                  //     '/images/horiz.riv',
                  //   ),
                  // ),
                  // Container(
                  //   width: 100,
                  //   height: 100,
                  //   color: Colors.black,
                  //   child: RiveAnimation.asset(
                  //     '/images/ver.riv',
                  //   ),
                  // ),

                  ///services
                  Text('service'),
                  InkWell(
                    child: Text('offer'),
                    onTap: () {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {},
                        onHover: (lol) {
                          setState(() {
                            serviceHover3 = lol;
                          });
                        },
                        child: AnimatedContainer(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.red,
                            boxShadow: [
                              BoxShadow(
                                color:
                                    serviceHover3 ? Colors.grey : Colors.black,
                                blurRadius: 2.0,
                                spreadRadius: 0.0,
                                offset: Offset(
                                    2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                          ),
                          height: 350,
                          width: MediaQuery.of(context).size.width * .3,
                          alignment: Alignment.centerLeft,
                          duration: Duration(milliseconds: 500),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.add),
                                Text('UI'),
                                Container(
                                  alignment: Alignment.center,

                                  // width: 120,
                                  child: ButtonElevated(
                                      text: 'View More',
                                      icons: Icon(Icons.arrow_back_ios)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        onHover: (lol) {
                          setState(() {
                            serviceHover2 = lol;
                          });
                        },
                        child: AnimatedContainer(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.red,
                            boxShadow: [
                              BoxShadow(
                                color:
                                    serviceHover2 ? Colors.grey : Colors.black,
                                blurRadius: 2.0,
                                spreadRadius: 0.0,
                                offset: Offset(
                                    2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                          ),
                          height: 350,
                          width: MediaQuery.of(context).size.width * .3,
                          alignment: Alignment.centerLeft,
                          duration: Duration(milliseconds: 500),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.add),
                                Text('UI'),
                                Container(
                                  alignment: Alignment.center,

                                  // width: 120,
                                  child: ButtonElevated(
                                      text: 'View More',
                                      icons: Icon(Icons.arrow_back_ios)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        onHover: (lol) {
                          setState(() {
                            serviceHover1 = lol;
                          });
                        },
                        child: AnimatedContainer(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.red,
                            boxShadow: [
                              BoxShadow(
                                color:
                                    serviceHover1 ? Colors.grey : Colors.black,
                                blurRadius: 2.0,
                                spreadRadius: 0.0,
                                offset: Offset(
                                    2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                          ),
                          height: 350,
                          width: MediaQuery.of(context).size.width * .3,
                          alignment: Alignment.centerLeft,
                          duration: Duration(milliseconds: 500),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.add),
                                Text('UI'),
                                Container(
                                  alignment: Alignment.center,

                                  // width: 120,
                                  child: ButtonElevated(
                                      text: 'View More',
                                      icons: Icon(Icons.arrow_back_ios)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 100,
                  ),

                  ///intro
                  ResponsiveWidget.isSmallScreen(context)
                      //  || ResponsiveWidget.isMediumScreen(context)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * .2,
                              color: Colors.red,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  // HoverAnimatedContainer(
                                  //   width: 200,
                                  //   height: 200,
                                  //   color: Colors.red,
                                  //   hoverColor: Colors.green,
                                  //   hoverHeight: 220,
                                  //   hoverWidth: 220,
                                  //   curve: Curves.easeInOutBack,
                                  //   child: Text('lol'),
                                  // ),
                                  // Text('Lol',
                                  //     style: Theme.of(context).textTheme.headline1),
                                  // ElevatedButton(
                                  //   style: ElevatedButton.styleFrom(),
                                  //   onPressed: () {},
                                  //   child: Text(
                                  //     'press',
                                  //     style: Get.textTheme.subtitle1!.copyWith(
                                  //       color: Get.theme.primaryColor,
                                  //     ),
                                  //   ),
                                  // )

                                  Icon(Icons.facebook),

                                  Icon(Icons.facebook),

                                  Icon(Icons.facebook),
                                ],
                              ),
                            ),
                            // Container(
                            //   color: Colors.red,
                            //   child: Image.asset(
                            //     'assets/images/ahmad.jpg',
                            //     height: 400,
                            //     width: 400,
                            //     fit: BoxFit.cover,
                            //   ),
                            // ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * .3,
                                  width: MediaQuery.of(context).size.width * .6,
                                  // alignment: Alignment.topCenter,
                                  child: Image.asset(
                                    'assets/images/about.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * .45,
                                  width: MediaQuery.of(context).size.width * .6,
                                  // color: Colors.red,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      AnimatedTextKit(
                                        animatedTexts: [
                                          WavyAnimatedText('Hi I am Ahmad Imam',
                                              textStyle: context
                                                  .textTheme.headline1!
                                                  .copyWith(
                                                fontSize: 25,
                                              ),
                                              speed:
                                                  Duration(milliseconds: 200)),
                                        ],
                                        isRepeatingAnimation: true,
                                        repeatForever: true,
                                        onTap: () {
                                          print("Tap Event");
                                        },
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .4,
                                        color: Colors.red,
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Lorem ipsum, dolor sit amet cons adipisicing elit. Ipsam debitisvoluptates consequuntur repellat nulla possimus?',
                                          style: Get.theme.textTheme.headline2!
                                              .copyWith(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50.h,
                                      ),
                                      ButtonElevated(
                                        icons: Icon(Icons.arrow_forward_ios),
                                        text: 'Press',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .1,
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 20,
                            ),

                            Container(
                              height: MediaQuery.of(context).size.height * .2,
                              color: Colors.red,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  // HoverAnimatedContainer(
                                  //   width: 200,
                                  //   height: 200,
                                  //   color: Colors.red,
                                  //   hoverColor: Colors.green,
                                  //   hoverHeight: 220,
                                  //   hoverWidth: 220,
                                  //   curve: Curves.easeInOutBack,
                                  //   child: Text('lol'),
                                  // ),
                                  // Text('Lol',
                                  //     style: Theme.of(context).textTheme.headline1),
                                  // ElevatedButton(
                                  //   style: ElevatedButton.styleFrom(),
                                  //   onPressed: () {},
                                  //   child: Text(
                                  //     'press',
                                  //     style: Get.textTheme.subtitle1!.copyWith(
                                  //       color: Get.theme.primaryColor,
                                  //     ),
                                  //   ),
                                  // )

                                  Icon(Icons.facebook),

                                  Icon(Icons.facebook),

                                  Icon(Icons.facebook),
                                ],
                              ),
                            ),
                            // Container(
                            //   color: Colors.red,
                            //   child: Image.asset(
                            //     'assets/images/ahmad.jpg',
                            //     height: 400,
                            //     width: 400,
                            //     fit: BoxFit.cover,
                            //   ),
                            // ),

                            Container(
                              width: MediaQuery.of(context).size.width * .1,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .8,
                              // color: Colors.red,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    // color: Colors.blue,
                                    height: 50,
                                    width: 200.w,
                                    child: AnimatedTextKit(
                                      animatedTexts: [
                                        WavyAnimatedText('Hi I am Ahmad Imam',
                                            textStyle: context
                                                .textTheme.headline1!
                                                .copyWith(
                                              fontSize: 25,
                                            ),
                                            speed: Duration(milliseconds: 200)),
                                      ],
                                      isRepeatingAnimation: true,
                                      repeatForever: true,
                                      onTap: () {
                                        print("Tap Event");
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .35,
                                    color: Colors.red,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Lorem ipsum, dolor sit amet cons adipisicing elit. Ipsam debitisvoluptates consequuntur repellat nulla possimus?',
                                      style: Get.theme.textTheme.headline2!
                                          .copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50.h,
                                  ),
                                  ButtonElevated(
                                    icons: Icon(Icons.arrow_forward_ios),
                                    text: 'Press',
                                  ),
                                  SizedBox(
                                    height: 100,
                                  ),
                                ],
                              ),
                            ),

                            Expanded(
                              child: ClipPath(
                                clipper: CustomClippersPath(),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .6,
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: Image.asset(
                                    'assets/images/about.jpg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                  SizedBox(
                    height: 20.h,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      hoverColor: Colors.transparent,
                      enableFeedback: false,
                      onHover: (val) {
                        print(val);
                        setState(() {
                          scrollDown = val;
                        });
                      },
                      onTap: () {
                        _scrollController.animateTo(600,
                            duration: Duration(seconds: 1),
                            curve: Curves.decelerate);
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        padding: EdgeInsets.only(top: scrollDown ? 5 : 0),
                        child: Row(
                          children: [
                            Icon(Icons.mouse),
                            Text('Scroll Down'),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * .2,
                  ),

                  ///about
                  Text(
                    'About Me',
                    style: context.textTheme.headline1?.copyWith(
                      fontSize: 25,
                    ),
                  ),

                  ResponsiveWidget.isSmallScreen(context)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .05,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .3,
                              width: MediaQuery.of(context).size.width * .8,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Image.asset(
                                'assets/images/about.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .05,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'small Lorem ipsum, dolor sit amet consectetur adipisicing elit. Assumenda quas sit tempore temporibus velit aspernatur, itaque quibusdam alias voluptatum pariatur?',
                                    style:
                                        context.textTheme.headline2?.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .05,
                            ),
                            ButtonElevated(
                              text: 'CV',
                              icons: Icon(Icons.download),
                            )
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .2,
                            ),
                            Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width * .3,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Image.asset(
                                'assets/images/about.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .4,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 250,
                                    child: Text(
                                      'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Assumenda quas sit tempore temporibus velit aspernatur, itaque quibusdam alias voluptatum pariatur?',
                                      style:
                                          context.textTheme.headline2?.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ButtonElevated(
                                    text: 'CV',
                                    icons: Icon(Icons.download),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * .2,
                  ),

                  ///portfolio final
                  Text('Portfoliosss'),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .7,
                        width: MediaQuery.of(context).size.width * .8,
                        // color: Colors.blueAccent,
                        child: Swiper(
                          autoplay: false,
                          itemCount: 3,
                          // loop: true,
                          // layout: SwiperLayout.DEFAULT,
                          scrollDirection: Axis.vertical,
                          pagination: SwiperPagination(),

                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .3,
                                  height:
                                      MediaQuery.of(context).size.height * .7,
                                  // color: Colors.black,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 50.h,
                                        ),
                                        Text(
                                          '${tst.lsts[index].name}',
                                          style: Get.theme.textTheme.headline1!
                                              .copyWith(
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 50.h,
                                        ),
                                        Text(
                                          '${tst.lsts[index].description}',
                                          style: Get.theme.textTheme.headline2!
                                              .copyWith(
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 50.h,
                                        ),
                                        Text(
                                          '-Feature 1',
                                          style: Get.theme.textTheme.headline2!
                                              .copyWith(
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          '-Feature 2',
                                          style: Get.theme.textTheme.headline2!
                                              .copyWith(
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          '-Feature 3',
                                          style: Get.theme.textTheme.headline2!
                                              .copyWith(
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          '-Feature 4',
                                          style: Get.theme.textTheme.headline2!
                                              .copyWith(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * .5,
                                  height:
                                      MediaQuery.of(context).size.height * .7,
                                  // color: Colors.red,
                                  alignment: Alignment.topCenter,
                                  child: Swiper(
                                    autoplay: false,
                                    itemCount: 3,
                                    // loop: true,
                                    // layout: SwiperLayout.DEFAULT,
                                    scrollDirection: Axis.horizontal,
                                    pagination: SwiperPagination(),
                                    layout: SwiperLayout.TINDER,

                                    outer: true,
                                    itemHeight:
                                        MediaQuery.of(context).size.height * .7,
                                    itemWidth:
                                        MediaQuery.of(context).size.width * .3,

                                    itemBuilder:
                                        (BuildContext context, int indexHori) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${tst.lsts[index].pic[indexHori]![1]}',
                                            style: Get
                                                .theme.textTheme.headline1!
                                                .copyWith(
                                              fontSize: 15,
                                            ),
                                          ),
                                          Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .5,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .8,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                              child: Image.asset(
                                                '${tst.lsts[index].pic[indexHori]![0]}',
                                                fit: BoxFit.cover,
                                              )),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 50,
                                width: 40,
                                // color: Colors.green,
                                child: RotatedBox(
                                  quarterTurns: -1,
                                  child: Container(
                                    child: AnimatedTextKit(
                                      repeatForever: true,
                                      animatedTexts: [
                                        RotateAnimatedText(
                                          'Pages',
                                          textDirection: TextDirection.rtl,
                                          textStyle: Get
                                              .theme.textTheme.headline2!
                                              .copyWith(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Container(
                          //   width: 50,
                          //   height: 30,
                          //   alignment: Alignment.topCenter,
                          //   // color: Colors.black,
                          //   child: RiveAnimation.asset(
                          //     '/images/horiz.riv',
                          //   ),
                          // ),
                          AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              RotateAnimatedText(
                                'Projects',
                                textDirection: TextDirection.rtl,
                                textStyle:
                                    Get.theme.textTheme.headline2!.copyWith(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          // Container(
                          //   alignment: Alignment.topCenter,
                          //   width: 30,
                          //   height: 50,
                          //   // color: Colors.black,
                          //   child: RiveAnimation.asset(
                          //     '/images/ver.riv',
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 200,
                  ),

                  ///qualification
                  Text('qualificatiom'),
                  InkWell(
                      onTap: () {
                        setState(() {
                          circle1 = !circle1;
                        });

                        animationControllerLine1.forward();
                        // animationControllerContainerLeft1.drive(CurveTween(curve: Curves.fastOutSlowIn));
                        // animationControllerContainerLeft1.forward();
                        // animationControllerOpacity.forward();
                        // animationControllerContainerRight1.forward();
                        print(animationControllerContainerLeft1.value);
                        print(animationControllerContainerLeft1.value);
                      },
                      child: Text('journey')),

                  TabBar(
                    labelColor: context.theme.backgroundColor,
                    indicatorColor: Colors.transparent,
                    tabs: [
                      Tab(
                        icon: Icon(Icons.directions_bike),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.directions_car,
                        ),
                      ),
                    ],
                  ),

                  // create widgets for each tab bar here
                  Container(
                    height: 400,
                    // color: Colors.red,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.black87,
                    child: TabBarView(
                      children: [
                        // first tab bar view widget
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .3,
                              // color: Colors.blue,
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Container(
                                    height: 120,
                                    width:
                                        MediaQuery.of(context).size.width * .3,
                                    child: Stack(children: [
                                      AnimatedPositioned(
                                        curve: Curves.easeInOut,
                                        duration: Duration(seconds: 2),
                                        left: circle1
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0
                                            : MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                -.5,
                                        child: AnimatedOpacity(
                                          opacity: circle1 ? 1 : 0,
                                          curve: Curves.easeInOut,
                                          duration: Duration(seconds: 2),
                                          child: Container(
                                            height: 100,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3,
                                            // color: Colors.red,
                                            padding: EdgeInsets.only(left: 5),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Secondary School Certificate',
                                                  style: context
                                                      .textTheme.headline1
                                                      ?.copyWith(fontSize: 15),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'Ideal School and College',
                                                  style: context
                                                      .textTheme.headline1
                                                      ?.copyWith(fontSize: 13),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'GPA: 5.00 / 5.00',
                                                  style: context
                                                      .textTheme.headline2
                                                      ?.copyWith(fontSize: 13),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  '- May 2014',
                                                  style: context
                                                      .textTheme.headline2
                                                      ?.copyWith(fontSize: 13),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                  SizedBox(
                                    height: 120,
                                  ),
                                  Container(
                                    height: 150,
                                    width:
                                        MediaQuery.of(context).size.width * .3,
                                    child: Stack(children: [
                                      AnimatedPositioned(
                                        curve: Curves.easeInOut,
                                        duration: Duration(seconds: 2),
                                        left: circle1
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0
                                            : MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                -.5,
                                        child: AnimatedOpacity(
                                          opacity: circle1 ? 1 : 0,
                                          curve: Curves.easeInOut,
                                          duration: Duration(seconds: 2),
                                          child: Container(
                                            height: 150,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3,
                                            // color: Colors.red,
                                            padding: EdgeInsets.only(left: 5),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Bachelor of Science',
                                                  style: context
                                                      .textTheme.headline1
                                                      ?.copyWith(fontSize: 15),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'Computer Science and Engineering',
                                                  style: context
                                                      .textTheme.headline1
                                                      ?.copyWith(fontSize: 14),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'Islamic University of Technology',
                                                  style: context
                                                      .textTheme.headline1
                                                      ?.copyWith(fontSize: 13),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'GPA: 5.00 / 5.00',
                                                  style: context
                                                      .textTheme.headline2
                                                      ?.copyWith(fontSize: 13),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  '- May 2014',
                                                  style: context
                                                      .textTheme.headline2
                                                      ?.copyWith(fontSize: 13),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Container(
                              height: 390,
                              width: 10,
                              // color: Colors.green,
                              child: Stack(
                                children: [
                                  ///line1
                                  AnimatedPositioned(
                                    top: circle1 ? 10 : -100,
                                    left: 3,
                                    duration: Duration(seconds: 2),
                                    child: Container(
                                      height: 90,
                                      alignment: Alignment.center,
                                      child: RotatedBox(
                                          quarterTurns: 1,
                                          child: AnimatedBuilder(
                                              animation: animationLine1,
                                              builder: (context, child) {
                                                return LinearProgressIndicator(
                                                  backgroundColor: context
                                                      .theme.backgroundColor,
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                              Color?>(
                                                          context.theme
                                                              .backgroundColor),
                                                  value:
                                                      animationControllerLine1
                                                          .value,
                                                );
                                              })),
                                    ),
                                  ),

                                  ///circle1
                                  AnimatedPositioned(
                                    top: circle1 ? 0 : 400,
                                    duration: Duration(seconds: 2),
                                    curve: Curves.easeInOut,
                                    child: Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        color: context
                                            .theme.textTheme.headline1?.color,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                    ),
                                  ),

                                  ///line2
                                  AnimatedPositioned(
                                    top: 100,
                                    left: 3,
                                    duration: Duration(seconds: 2),
                                    child: Container(
                                      height: 100,
                                      alignment: Alignment.center,
                                      child: RotatedBox(
                                          quarterTurns: 1,
                                          child: AnimatedBuilder(
                                              animation: animationLine1,
                                              builder: (context, child) {
                                                return LinearProgressIndicator(
                                                  backgroundColor: context
                                                      .theme.backgroundColor,
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                              Color?>(
                                                          context.theme
                                                              .backgroundColor),
                                                  value:
                                                      animationControllerLine1
                                                          .value,
                                                );
                                              })),
                                    ),
                                  ),

                                  ///circle2
                                  AnimatedPositioned(
                                    top: circle1 ? 120 : 400,
                                    duration: Duration(seconds: 2),
                                    curve: Curves.easeInOut,
                                    child: Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        color: context
                                            .theme.textTheme.headline1?.color,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                    ),
                                  ),

                                  ///line3
                                  AnimatedPositioned(
                                    top: circle1 ? 200 : 400,
                                    left: 3,
                                    duration: Duration(seconds: 2),
                                    child: Container(
                                      height: 150,
                                      alignment: Alignment.center,
                                      child: RotatedBox(
                                        quarterTurns: 1,
                                        child: LinearProgressIndicator(
                                          backgroundColor:
                                              context.theme.backgroundColor,
                                          valueColor: AlwaysStoppedAnimation<
                                                  Color?>(
                                              context.theme.backgroundColor),
                                          value: animationControllerLine1.value,
                                        ),
                                      ),
                                    ),
                                  ),

                                  ///circle3
                                  AnimatedPositioned(
                                    top: circle1 ? 220 : 400,
                                    duration: Duration(seconds: 2),
                                    curve: Curves.easeInOut,
                                    child: Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        color: context
                                            .theme.textTheme.headline1?.color,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 130,
                                ),
                                Container(
                                  height: 100,
                                  width: MediaQuery.of(context).size.width * .3,
                                  // color: Colors.blue,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 100,
                                        child: Stack(children: [
                                          AnimatedPositioned(
                                            curve: Curves.easeInOut,
                                            duration: Duration(seconds: 2),
                                            right: circle1
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    -.5,
                                            child: AnimatedOpacity(
                                              opacity: circle1 ? 1 : 0,
                                              curve: Curves.easeInOut,
                                              duration: Duration(seconds: 2),
                                              child: Container(
                                                height: 100,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .3,
                                                // color: Colors.red,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      'Secondary School Certificate',
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: context
                                                          .textTheme.headline1
                                                          ?.copyWith(
                                                              fontSize: 15),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      'Ideal School and College',
                                                      style: context
                                                          .textTheme.headline1
                                                          ?.copyWith(
                                                              fontSize: 13),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      'GPA: 5.00 / 5.00',
                                                      style: context
                                                          .textTheme.headline2
                                                          ?.copyWith(
                                                              fontSize: 13),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      '- May 2014',
                                                      style: context
                                                          .textTheme.headline2
                                                          ?.copyWith(
                                                              fontSize: 13),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // second tab bar viiew widget
                        Container(
                          color: Colors.pink,
                          child: Center(
                            child: Text(
                              'Car',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 250,
                  ),

                  ///skills
                  Text('Skills'),
                  Text('Skills'),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        // color: Colors.red,
                        width: MediaQuery.of(context).size.width * .4,
                        child: ExpansionTile(
                          onExpansionChanged: (val) {
                            // setState(() {
                            //   expansion1 = val;
                            // });
                          },
                          title: Text(
                            'Frontend Dev',
                            style: context.textTheme.headline1
                                ?.copyWith(fontSize: 16),
                          ),
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            ProgressbarAnimation(
                              number: 0.9,
                              text: 'CSS',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ProgressbarAnimation(
                              number: 0.5,
                              text: 'CSS',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ProgressbarAnimation(
                              number: 0.8,
                              text: 'CSS',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ProgressbarAnimation(
                              number: 0.4,
                              text: 'CSS',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        child: ExpansionTile(
                          onExpansionChanged: (val) {
                            // setState(() {
                            //   expansion1 = val;
                            // });
                          },
                          title: Text(
                            'Frontend Dev',
                            style: context.textTheme.headline1
                                ?.copyWith(fontSize: 16),
                          ),
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            ProgressbarAnimation(
                              number: 0.9,
                              text: 'CSS',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ProgressbarAnimation(
                              number: 0.5,
                              text: 'CSS',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ProgressbarAnimation(
                              number: 0.8,
                              text: 'CSS',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ProgressbarAnimation(
                              number: 0.4,
                              text: 'CSS',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 250,
                  ),

                  ///qualification
                  Text('qualificatiom'),
                  Text('journey'),

                  TabBar(
                    labelColor: Colors.amber,
                    indicatorColor: Colors.brown.withOpacity(0),
                    tabs: [
                      Tab(
                        icon: Icon(Icons.directions_bike),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.directions_car,
                        ),
                      ),
                    ],
                  ),

                  // create widgets for each tab bar here
                  Container(
                    height: 300,
                    child: TabBarView(
                      children: [
                        // first tab bar view widget

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  color: Colors.red,
                                  child: Column(
                                    children: [
                                      Text('Computersasd asd adccas'),
                                      Text('Computer'),
                                      Text('Computer'),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 90,
                                ),
                                Container(
                                  height: 100,
                                  color: Colors.red,
                                  child: Column(
                                    children: [
                                      Text('Computer'),
                                      Text('Computer'),
                                      Text('Computer'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 90,
                                  child: RotatedBox(
                                      quarterTurns: 1,
                                      child: TweenAnimationBuilder(
                                          duration:
                                              Duration(milliseconds: 2000),
                                          curve: Curves.easeOut,
                                          tween:
                                              Tween<double>(begin: 0, end: 1),
                                          builder: (context, double gg, _) {
                                            return Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [],
                                                ),
                                                LinearProgressIndicator(
                                                  backgroundColor: Colors.red,
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    Colors.amber,
                                                  ),
                                                  value: gg,
                                                ),
                                              ],
                                            );
                                          })),
                                ),
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 80,
                                  child: RotatedBox(
                                      quarterTurns: 1,
                                      child: TweenAnimationBuilder(
                                          duration:
                                              Duration(milliseconds: 3000),
                                          curve: Curves.easeOut,
                                          tween:
                                              Tween<double>(begin: 0, end: 1),
                                          builder: (context, double gg, _) {
                                            return Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [],
                                                ),
                                                LinearProgressIndicator(
                                                  backgroundColor: Colors.red,
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    Colors.amber,
                                                  ),
                                                  value: gg,
                                                ),
                                              ],
                                            );
                                          })),
                                ),
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 90,
                                  child: RotatedBox(
                                      quarterTurns: 1,
                                      child: TweenAnimationBuilder(
                                          duration:
                                              Duration(milliseconds: 4000),
                                          curve: Curves.easeOut,
                                          tween:
                                              Tween<double>(begin: 0, end: 1),
                                          builder: (context, double gg, _) {
                                            return Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [],
                                                ),
                                                LinearProgressIndicator(
                                                  backgroundColor:
                                                      Colors.deepPurple,
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    Colors.amber,
                                                  ),
                                                  value: gg,
                                                ),
                                              ],
                                            );
                                          })),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 100,
                                ),
                                Container(
                                  height: 100,
                                  color: Colors.red,
                                  child: Column(
                                    children: [
                                      Text('Computer'),
                                      Text('Computer'),
                                      Text('Computer'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // second tab bar viiew widget
                        Container(
                          color: Colors.pink,
                          child: Center(
                            child: Text(
                              'Car',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 250,
                  ),

                  // Stack(
                  //   children: <Widget>[
                  //     Positioned(
                  //       left: MediaQuery.of(context).size.width * 0.15,
                  //       child: AnimatedBuilder(
                  //         animation: AnimationController(
                  //           duration: const Duration(seconds: 5),
                  //           vsync: this,
                  //         ),
                  //         builder: (context, child) {
                  //           return SlideTransition(
                  //               position: Tween<Offset>(
                  //                 begin: const Offset(-2, 0),
                  //                 end: const Offset(0, 0),
                  //               ).animate(CurvedAnimation(
                  //                 curve:
                  //                     const Interval(0, 1, curve: Curves.easeIn),
                  //                 parent: AnimationController(
                  //                   duration: const Duration(seconds: 5),
                  //                   vsync: this,
                  //                 ),
                  //               )),
                  //               child: child);
                  //         },
                  //         child: Container(
                  //           height: MediaQuery.of(context).size.height,
                  //           width: MediaQuery.of(context).size.width * 0.85,
                  //           color: Colors.orange,
                  //         ),
                  //       ),
                  //     ),
                  //     Positioned(
                  //       left: 0,
                  //       child: AnimatedBuilder(
                  //         animation: AnimationController(
                  //           duration: const Duration(seconds: 5),
                  //           vsync: this,
                  //         ),
                  //         builder: (context, child) {
                  //           return SlideTransition(
                  //               position: Tween<Offset>(
                  //                 begin: const Offset(-1, 0),
                  //                 end: const Offset(0, 0),
                  //               ).animate(CurvedAnimation(
                  //                 curve: const Interval(.01, 0.25,
                  //                     curve: Curves.easeInExpo),
                  //                 parent: AnimationController(
                  //                   duration: const Duration(seconds: 5),
                  //                   vsync: this,
                  //                 ),
                  //               )),
                  //               child: child);
                  //         },
                  //         child: Container(
                  //           height: MediaQuery.of(context).size.height,
                  //           width: MediaQuery.of(context).size.width * 0.15,
                  //           color: Colors.black,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  SizedBox(
                    height: 250,
                  ),

                  /// background
                  Container(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .9,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/images/background.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
