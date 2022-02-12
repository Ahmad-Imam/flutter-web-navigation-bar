import 'dart:async';
import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blur/blur.dart';
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
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';
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
  bool serviceAnimation = true;

  late AnimationController animationControllerLine1;
  late Animation animationLine1;

  late AnimationController animationControllerContainerLeft1;
  late Animation animationContainerLeft1;

  late AnimationController animationControllerContainerRight1;
  late Animation animationContainerRight1;

  late AnimationController animationControllerOpacity;
  late Animation animationOpacity;

  final taxUrl =
      'https://firebasestorage.googleapis.com/v0/b/portfolio-e107d.appspot.com/o/a.pdf?alt=media&token=2e721f01-fd56-4150-a539-ef44bd7295f6';
  final mailUrl = 'mailto:ahmadimam71@gmail.com';
  GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: ResponsiveWidget.isSmallScreen(context)
            ? null
            : PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 70),
                child: TopBarContents(
                  scrollPos: _scrollPosition,
                  scrollController: _scrollController,
                ),
              ),
        body: ResponsiveWidget.isSmallScreen(context)
            ? SliderDrawer(
                key: _key,
                appBar: SliderAppBar(
                  trailing: Icon(
                    Icons.light_mode,
                    color: context.theme.backgroundColor,
                  ),
                  drawerIconColor: context.theme.backgroundColor,
                  appBarColor: context.theme.scaffoldBackgroundColor,
                  title: Text(
                    'AI',
                    style: context.textTheme.headline1!.copyWith(fontSize: 25),
                  ),
                ),
                slider: MenuDrawer(),
                child: SingleChildScrollView(
                  controller: _scrollController,
                  physics: BouncingScrollPhysics(),
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
                                  isActive.value
                                      ? ThemeMode.light
                                      : ThemeMode.dark,
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

                          ///intro
                          ResponsiveWidget.isSmallScreen(context)
                              //  || ResponsiveWidget.isMediumScreen(context)
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .2,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .3,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .6,
                                          // alignment: Alignment.topCenter,
                                          child: Image.asset(
                                            'assets/images/about.jpg',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .45,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .6,
                                          // color: Colors.red,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              AnimatedTextKit(
                                                animatedTexts: [
                                                  WavyAnimatedText(
                                                      'Hi I am Ahmad Imam',
                                                      textStyle: context
                                                          .textTheme.headline1!
                                                          .copyWith(
                                                        fontSize: 25,
                                                      ),
                                                      speed: Duration(
                                                          milliseconds: 200)),
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
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .4,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'I am a computer science graduate from Islamic University of Technology. I am currently working in mobile application development using Flutter framework',
                                                  style: Get.theme.textTheme
                                                      .headline2!
                                                      .copyWith(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              ButtonElevated(
                                                icons: Icon(
                                                    Icons.arrow_forward_ios),
                                                text: 'Contact',
                                                ontap: () async {
                                                  try {
                                                    await launch(mailUrl);
                                                  } catch (e) {
                                                    throw 'couldt $e';
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .1,
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),

                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .2,
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
                                      width: MediaQuery.of(context).size.width *
                                          .1,
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .8,
                                      // color: Colors.red,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            // color: Colors.blue,
                                            height: 50,
                                            width: 200.w,
                                            child: AnimatedTextKit(
                                              animatedTexts: [
                                                WavyAnimatedText(
                                                    'Hi I am Ahmad Imam',
                                                    textStyle: context
                                                        .textTheme.headline1!
                                                        .copyWith(
                                                      fontSize: 25,
                                                    ),
                                                    speed: Duration(
                                                        milliseconds: 200)),
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .35,
                                            alignment: Alignment.center,
                                            child: Text(
                                              'I am a computer science graduate from Islamic University of Technology. I am currently working in mobile application development using Flutter framework',
                                              style: Get
                                                  .theme.textTheme.headline2!
                                                  .copyWith(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 50.h,
                                          ),
                                          ButtonElevated(
                                            icons:
                                                Icon(Icons.arrow_forward_ios),
                                            text: 'Contact',
                                            ontap: () async {
                                              try {
                                                await launch(mailUrl);
                                              } catch (e) {
                                                throw 'couldt $e';
                                              }
                                            },
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
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .6,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .4,
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
                                padding:
                                    EdgeInsets.only(top: scrollDown ? 5 : 0),
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
                            height: 50,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .05,
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .3,
                                      width: MediaQuery.of(context).size.width *
                                          .8,
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
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .05,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .8,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'My goal is to work in a dynamic professional environment with a growing organization and utilize my creativity and innovative thinking for benefit of the organizaton and myself.',
                                            style: context.textTheme.headline2
                                                ?.copyWith(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .05,
                                    ),
                                    ButtonElevated(
                                      text: 'CV',
                                      icons: Icon(Icons.download),
                                      ontap: () async {
                                        await canLaunch(taxUrl)
                                            ? await launch(taxUrl)
                                            : throw 'Could not launch $taxUrl';
                                      },
                                    )
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .2,
                                    ),
                                    Container(
                                      height: 300,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
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
                                      width: MediaQuery.of(context).size.width *
                                          .4,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              width: 250,
                                              child: Text(
                                                'My goal is to work in a dynamic professional environment with a growing organization and utilize my creativity and innovative thinking for benefit of the organizaton and myself.',
                                                style: context
                                                    .textTheme.headline2
                                                    ?.copyWith(
                                                  fontSize: 16,
                                                ),
                                              )),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          ButtonElevated(
                                            text: 'CV',
                                            icons: Icon(Icons.download),
                                            ontap: () async {
                                              // await canLaunch(taxUrl)
                                              //     ? await launch(taxUrl)
                                              //     : throw 'Could not launch $taxUrl';
                                            },
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
                            height: 100,
                          ),

                          ///skills
                          Text(
                            'Skills',
                            style: context.textTheme.headline1?.copyWith(
                              fontSize: 25,
                            ),
                          ),
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
                                    'Programming Languages',
                                    style: context.textTheme.headline1
                                        ?.copyWith(fontSize: 16),
                                  ),
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ProgressbarAnimation(
                                      number: 0.7,
                                      text: 'C',
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ProgressbarAnimation(
                                      number: 0.7,
                                      text: 'C++',
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ProgressbarAnimation(
                                      number: 0.7,
                                      text: 'Dart',
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ProgressbarAnimation(
                                      number: 0.6,
                                      text: 'Python',
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ProgressbarAnimation(
                                      number: 0.6,
                                      text: 'HTML',
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ProgressbarAnimation(
                                      number: 0.6,
                                      text: 'CSS',
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ProgressbarAnimation(
                                      number: 0.6,
                                      text: 'Javascript',
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
                                    'Tools & Softwares',
                                    style: context.textTheme.headline1
                                        ?.copyWith(fontSize: 16),
                                  ),
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ProgressbarAnimation(
                                      number: 0.7,
                                      text: 'Android Studio',
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ProgressbarAnimation(
                                      number: 0.7,
                                      text: 'VS Code',
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ProgressbarAnimation(
                                      number: 0.6,
                                      text: 'Git',
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ProgressbarAnimation(
                                      number: 0.6,
                                      text: 'PyCharm',
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ProgressbarAnimation(
                                      number: 0.7,
                                      text: 'Google Colab',
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ProgressbarAnimation(
                                      number: 0.7,
                                      text: 'Latex',
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ProgressbarAnimation(
                                      number: 0.6,
                                      text: 'Microsoft Powerpoint',
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ProgressbarAnimation(
                                      number: 0.6,
                                      text: 'Blender',
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ProgressbarAnimation(
                                      number: 0.6,
                                      text: 'Adobe Illustrator',
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ProgressbarAnimation(
                                      number: 0.7,
                                      text: 'Adobe Premiere PRo',
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
                            height: 100,
                          ),

                          ///portfolio final
                          Text(
                            'Projects',
                            style: context.textTheme.headline1?.copyWith(
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 100,
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height * .8,
                                width: MediaQuery.of(context).size.width * .8,
                                // color: Colors.blueAccent,
                                child: Swiper(
                                  autoplay: false,
                                  itemCount: tst.lsts.length,
                                  // loop: true,
                                  // layout: SwiperLayout.DEFAULT,
                                  scrollDirection: Axis.vertical,
                                  pagination: SwiperPagination(),

                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .7,
                                          // color: Colors.black,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
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
                                                  style: Get.theme.textTheme
                                                      .headline1!
                                                      .copyWith(
                                                    fontSize: ResponsiveWidget
                                                            .isSmallScreen(
                                                                context)
                                                        ? 14
                                                        : 16,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 50.h,
                                                ),
                                                Text(
                                                  '${tst.lsts[index].description}',
                                                  style: Get.theme.textTheme
                                                      .headline2!
                                                      .copyWith(
                                                    fontSize: ResponsiveWidget
                                                            .isSmallScreen(
                                                                context)
                                                        ? 12
                                                        : 16,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Expanded(
                                                  child: ListView.builder(
                                                      itemCount: tst.lsts[index]
                                                          .features.length,
                                                      itemBuilder:
                                                          (context, snapshot) {
                                                        return Text(
                                                          '- ${tst.lsts[index].features[snapshot]}',
                                                          style: Get
                                                              .theme
                                                              .textTheme
                                                              .headline2!
                                                              .copyWith(
                                                            fontSize: ResponsiveWidget
                                                                    .isSmallScreen(
                                                                        context)
                                                                ? 12
                                                                : 14,
                                                          ),
                                                        );
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Swiper(
                                            autoplay: false,
                                            itemCount:
                                                tst.lsts[index].pic.length,
                                            // loop: true,
                                            // layout: SwiperLayout.DEFAULT,
                                            scrollDirection: Axis.horizontal,
                                            pagination: SwiperPagination(),
                                            layout: SwiperLayout.TINDER,

                                            outer: true,

                                            itemBuilder: (BuildContext context,
                                                int indexHori) {
                                              return Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${tst.lsts[index].pic[indexHori]![1]}',
                                                    style: Get.theme.textTheme
                                                        .headline1!
                                                        .copyWith(
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  Expanded(
                                                      child: Container(
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),
                                                        border: Border.all(
                                                            color: context.theme
                                                                .backgroundColor,
                                                            width: 5)),
                                                    child: Image.asset(
                                                      '${tst.lsts[index].pic[indexHori]![0]}',
                                                      isAntiAlias: true,
                                                      fit: BoxFit.cover,
                                                    ),
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
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  textStyle: Get.theme.textTheme
                                                      .headline2!
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
                                        textStyle: Get
                                            .theme.textTheme.headline2!
                                            .copyWith(
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
                            height: 50,
                          ),

                          ///qualification
                          Text(
                            'Journey',
                            style: context.textTheme.headline1?.copyWith(
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
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
                                child: Text('Education'),
                                icon: Icon(Icons.directions_bike),
                              ),
                              Tab(
                                child: Text('Experience'),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      // color: Colors.blue,
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 120,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3,
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
                                                  duration:
                                                      Duration(seconds: 2),
                                                  child: Container(
                                                    height: 100,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .3,
                                                    // color: Colors.red,
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Secondary School Certificate',
                                                          style: context
                                                              .textTheme
                                                              .headline1
                                                              ?.copyWith(
                                                                  fontSize: 15),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          'Ideal School and College',
                                                          style: context
                                                              .textTheme
                                                              .headline1
                                                              ?.copyWith(
                                                                  fontSize: 13),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          'GPA: 5.00 / 5.00',
                                                          style: context
                                                              .textTheme
                                                              .headline2
                                                              ?.copyWith(
                                                                  fontSize: 13),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          '- May 2014',
                                                          style: context
                                                              .textTheme
                                                              .headline2
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
                                          SizedBox(
                                            height: 120,
                                          ),
                                          Container(
                                            height: 150,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3,
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
                                                  duration:
                                                      Duration(seconds: 2),
                                                  child: Container(
                                                    height: 150,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .3,
                                                    // color: Colors.red,
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Bachelor of Science',
                                                          style: context
                                                              .textTheme
                                                              .headline1
                                                              ?.copyWith(
                                                                  fontSize: 15),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          'Computer Science and Engineering',
                                                          style: context
                                                              .textTheme
                                                              .headline1
                                                              ?.copyWith(
                                                                  fontSize: 14),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          'Islamic University of Technology',
                                                          style: context
                                                              .textTheme
                                                              .headline1
                                                              ?.copyWith(
                                                                  fontSize: 13),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          'GPA: 5.00 / 5.00',
                                                          style: context
                                                              .textTheme
                                                              .headline2
                                                              ?.copyWith(
                                                                  fontSize: 13),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          '- March 2021',
                                                          style: context
                                                              .textTheme
                                                              .headline2
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
                                                      builder:
                                                          (context, child) {
                                                        return LinearProgressIndicator(
                                                          backgroundColor: context
                                                              .theme
                                                              .backgroundColor,
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
                                                color: context.theme.textTheme
                                                    .headline1?.color,
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
                                                      builder:
                                                          (context, child) {
                                                        return LinearProgressIndicator(
                                                          backgroundColor: context
                                                              .theme
                                                              .backgroundColor,
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
                                                color: context.theme.textTheme
                                                    .headline1?.color,
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
                                                color: context.theme.textTheme
                                                    .headline1?.color,
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .3,
                                          // color: Colors.blue,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 100,
                                                child: Stack(children: [
                                                  AnimatedPositioned(
                                                    curve: Curves.easeInOut,
                                                    duration:
                                                        Duration(seconds: 2),
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
                                                      duration:
                                                          Duration(seconds: 2),
                                                      child: Container(
                                                        height: 100,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            .3,
                                                        // color: Colors.red,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              'Higher Secondary Certificate',
                                                              textAlign:
                                                                  TextAlign
                                                                      .right,
                                                              style: context
                                                                  .textTheme
                                                                  .headline1
                                                                  ?.copyWith(
                                                                      fontSize:
                                                                          15),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              'Notre Dame College',
                                                              style: context
                                                                  .textTheme
                                                                  .headline1
                                                                  ?.copyWith(
                                                                      fontSize:
                                                                          13),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              'GPA: 5.00 / 5.00',
                                                              style: context
                                                                  .textTheme
                                                                  .headline2
                                                                  ?.copyWith(
                                                                      fontSize:
                                                                          13),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              '- August 2016',
                                                              style: context
                                                                  .textTheme
                                                                  .headline2
                                                                  ?.copyWith(
                                                                      fontSize:
                                                                          13),
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

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 130,
                                        ),
                                        Container(
                                          height: 100,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .3,
                                          // color: Colors.blue,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 100,
                                                child: Stack(children: [
                                                  AnimatedPositioned(
                                                    curve: Curves.easeInOut,
                                                    duration:
                                                        Duration(seconds: 2),
                                                    right: circle1
                                                        ? MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0
                                                        : MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .5,
                                                    top: 0,
                                                    bottom: 0,
                                                    child: AnimatedOpacity(
                                                      opacity: circle1 ? 1 : 0,
                                                      curve: Curves.easeInOut,
                                                      duration:
                                                          Duration(seconds: 2),
                                                      child: Container(
                                                        alignment:
                                                            Alignment.topCenter,
                                                        height: 100,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            .3,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Executive Secretary',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: context
                                                                  .textTheme
                                                                  .headline1
                                                                  ?.copyWith(
                                                                      fontSize:
                                                                          15),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              'IUT Computer Society',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: context
                                                                  .textTheme
                                                                  .headline1
                                                                  ?.copyWith(
                                                                      fontSize:
                                                                          13),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              'January 2020 - February 2021',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: context
                                                                  .textTheme
                                                                  .headline2
                                                                  ?.copyWith(
                                                                      fontSize:
                                                                          13),
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
                                                      builder:
                                                          (context, child) {
                                                        return LinearProgressIndicator(
                                                          backgroundColor: context
                                                              .theme
                                                              .backgroundColor,
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
                                                color: context.theme.textTheme
                                                    .headline1?.color,
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
                                                      builder:
                                                          (context, child) {
                                                        return LinearProgressIndicator(
                                                          backgroundColor: context
                                                              .theme
                                                              .backgroundColor,
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
                                                color: context.theme.textTheme
                                                    .headline1?.color,
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
                                                color: context.theme.textTheme
                                                    .headline1?.color,
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
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      // color: Colors.blue,
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 120,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3,
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
                                                        .5,
                                                child: AnimatedOpacity(
                                                  opacity: circle1 ? 1 : 0,
                                                  curve: Curves.easeInOut,
                                                  duration:
                                                      Duration(seconds: 2),
                                                  child: Container(
                                                    height: 100,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .3,
                                                    // color: Colors.red,
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          'Industrial Trainee',
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: context
                                                              .textTheme
                                                              .headline1
                                                              ?.copyWith(
                                                                  fontSize: 15),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          'Battery Low Interactive',
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: context
                                                              .textTheme
                                                              .headline1
                                                              ?.copyWith(
                                                                  fontSize: 13),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          'November 2019 - December 2019',
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: context
                                                              .textTheme
                                                              .headline2
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
                                          SizedBox(
                                            height: 120,
                                          ),
                                          Container(
                                            height: 150,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3,
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
                                                        .5,
                                                child: AnimatedOpacity(
                                                  opacity: circle1 ? 1 : 0,
                                                  curve: Curves.easeInOut,
                                                  duration:
                                                      Duration(seconds: 2),
                                                  child: Container(
                                                    height: 150,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .3,
                                                    // color: Colors.red,
                                                    padding: EdgeInsets.only(
                                                        left: 5),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          'Mobile Application Developer',
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: context
                                                              .textTheme
                                                              .headline1
                                                              ?.copyWith(
                                                                  fontSize: 15),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          'BMS Systems',
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: context
                                                              .textTheme
                                                              .headline1
                                                              ?.copyWith(
                                                                  fontSize: 14),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          'October 2021 - November 2021',
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: context
                                                              .textTheme
                                                              .headline1
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
                          ),

                          SizedBox(
                            height: 50,
                          ),

                          ///services
                          Text(
                            'Service',
                            style: context.textTheme.headline1?.copyWith(
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          InkWell(
                            child: Text('offer'),
                            onTap: () {
                              setState(() {
                                serviceAnimation = !serviceAnimation;
                              });
                            },
                          ),

                          SizedBox(
                            height: 50,
                          ),

                          Container(
                            height: 350,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Stack(
                              alignment: Alignment.center,
                              fit: StackFit.loose,
                              children: [
                                AnimatedPositioned(
                                  curve: Curves.easeInBack,
                                  duration: Duration(seconds: 1),
                                  left: serviceAnimation
                                      ? MediaQuery.of(context).size.width * .0
                                      : MediaQuery.of(context).size.width * .35,
                                  right: serviceAnimation
                                      ? MediaQuery.of(context).size.width * .7
                                      : MediaQuery.of(context).size.width * .35,
                                  top: 0,
                                  bottom: 0,
                                  child: InkWell(
                                    onTap: () {},
                                    onHover: (lol) {
                                      setState(() {
                                        serviceHover1 = lol;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      decoration: BoxDecoration(
                                        borderRadius: serviceHover1
                                            ? BorderRadius.circular(15)
                                            : BorderRadius.circular(0.0),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      height: 350,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      alignment: Alignment.centerLeft,
                                      duration: Duration(milliseconds: 500),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            right: 0,
                                            child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              height: 350,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .3,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                borderRadius: serviceHover1
                                                    ? BorderRadius.circular(15)
                                                    : BorderRadius.circular(
                                                        0.0),
                                              ),
                                              child: Blur(
                                                blur: .5,
                                                blurColor: Colors.transparent,
                                                colorOpacity: .5,
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  height: 350,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .3,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius: serviceHover1
                                                        ? BorderRadius.circular(
                                                            15)
                                                        : BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                  child: Image.asset(
                                                    'images/about.jpg',
                                                    isAntiAlias: true,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              top: 10,
                                              left: 0,
                                              right: 0,
                                              child: Icon(Icons.add)),
                                          Positioned(
                                              top: 50,
                                              left: 0,
                                              right: 0,
                                              child: Text(
                                                'UI 3',
                                                textAlign: TextAlign.center,
                                              )),
                                          Positioned(
                                            child: Container(
                                              alignment: Alignment.center,

                                              // width: 120,
                                              child: ButtonElevated(
                                                text: 'View More',
                                                icons:
                                                    Icon(Icons.arrow_back_ios),
                                                ontap: () {},
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                AnimatedPositioned(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.easeInBack,
                                  left: serviceAnimation
                                      ? MediaQuery.of(context).size.width * .7
                                      : MediaQuery.of(context).size.width * .35,
                                  right: serviceAnimation
                                      ? MediaQuery.of(context).size.width * .0
                                      : MediaQuery.of(context).size.width * .35,
                                  top: 0,
                                  bottom: 0,
                                  child: InkWell(
                                    onTap: () {},
                                    onHover: (lol) {
                                      setState(() {
                                        serviceHover2 = lol;
                                      });
                                    },
                                    child: Stack(
                                      // mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Positioned(
                                          top: 0,
                                          left: 0,
                                          right: 0,
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 500),
                                            height: 350,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3,
                                            decoration: BoxDecoration(
                                              borderRadius: serviceHover2
                                                  ? BorderRadius.circular(15)
                                                  : BorderRadius.circular(0),
                                            ),
                                            clipBehavior: Clip.antiAlias,
                                            child: Blur(
                                              blur: .5,
                                              blurColor: Colors.transparent,
                                              colorOpacity: .5,
                                              child: AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 500),
                                                height: 350,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .3,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  borderRadius: serviceHover2
                                                      ? BorderRadius.circular(
                                                          15)
                                                      : BorderRadius.circular(
                                                          0),
                                                ),
                                                child: Image.asset(
                                                  'images/about.jpg',
                                                  isAntiAlias: true,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            top: 10,
                                            left: 0,
                                            right: 0,
                                            child: Icon(Icons.add)),
                                        Positioned(
                                            top: 50,
                                            left: 0,
                                            right: 0,
                                            child: Text(
                                              'UI 2',
                                              textAlign: TextAlign.center,
                                            )),
                                        Positioned(
                                          child: Container(
                                            alignment: Alignment.center,

                                            // width: 120,
                                            child: ButtonElevated(
                                              text: 'View More',
                                              icons: Icon(Icons.arrow_back_ios),
                                              ontap: () {},
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                AnimatedPositioned(
                                  duration: Duration(seconds: 1),
                                  left: MediaQuery.of(context).size.width * .35,
                                  right:
                                      MediaQuery.of(context).size.width * .35,
                                  child: InkWell(
                                    onTap: () {},
                                    onHover: (lol) {
                                      setState(() {
                                        serviceHover3 = lol;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      decoration: BoxDecoration(
                                        borderRadius: serviceHover3
                                            ? BorderRadius.circular(15)
                                            : BorderRadius.circular(0.0),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      height: 350,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      alignment: Alignment.centerLeft,
                                      duration: Duration(milliseconds: 500),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            right: 0,
                                            child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              height: 350,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .3,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                borderRadius: serviceHover3
                                                    ? BorderRadius.circular(15)
                                                    : BorderRadius.circular(
                                                        0.0),
                                              ),
                                              child: Blur(
                                                blur: .5,
                                                blurColor: Colors.transparent,
                                                colorOpacity: .5,
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  height: 350,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .3,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius: serviceHover3
                                                        ? BorderRadius.circular(
                                                            15)
                                                        : BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                  child: Image.asset(
                                                    'images/about.jpg',
                                                    isAntiAlias: true,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              top: 10,
                                              left: 0,
                                              right: 0,
                                              child: Icon(Icons.add)),
                                          Positioned(
                                              top: 50,
                                              left: 0,
                                              right: 0,
                                              child: Text(
                                                'UI 3',
                                                textAlign: TextAlign.center,
                                              )),
                                          Positioned(
                                            child: Container(
                                              alignment: Alignment.center,

                                              // width: 120,
                                              child: ButtonElevated(
                                                text: 'View More',
                                                icons:
                                                    Icon(Icons.arrow_back_ios),
                                                ontap: () {},
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 50,
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
              )
            : SingleChildScrollView(
                controller: _scrollController,
                physics: BouncingScrollPhysics(),
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
                                isActive.value
                                    ? ThemeMode.light
                                    : ThemeMode.dark,
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

                        ///intro
                        ResponsiveWidget.isSmallScreen(context)
                            //  || ResponsiveWidget.isMediumScreen(context)
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height * .2,
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
                                            MediaQuery.of(context).size.height *
                                                .3,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .6,
                                        // alignment: Alignment.topCenter,
                                        child: Image.asset(
                                          'assets/images/about.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .45,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .6,
                                        // color: Colors.red,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            AnimatedTextKit(
                                              animatedTexts: [
                                                WavyAnimatedText(
                                                    'Hi I am Ahmad Imam',
                                                    textStyle: context
                                                        .textTheme.headline1!
                                                        .copyWith(
                                                      fontSize: 25,
                                                    ),
                                                    speed: Duration(
                                                        milliseconds: 200)),
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
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .4,
                                              alignment: Alignment.center,
                                              child: Text(
                                                'I am a computer science graduate from Islamic University of Technology. I am currently working in mobile application development using Flutter framework',
                                                style: Get
                                                    .theme.textTheme.headline2!
                                                    .copyWith(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            ButtonElevated(
                                              icons:
                                                  Icon(Icons.arrow_forward_ios),
                                              text: 'Contact',
                                              ontap: () async {
                                                try {
                                                  await launch(mailUrl);
                                                } catch (e) {
                                                  throw 'couldt $e';
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .1,
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),

                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height * .2,
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
                                    width:
                                        MediaQuery.of(context).size.width * .1,
                                  ),
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height * .8,
                                    // color: Colors.red,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          // color: Colors.blue,
                                          height: 50,
                                          width: 200.w,
                                          child: AnimatedTextKit(
                                            animatedTexts: [
                                              WavyAnimatedText(
                                                  'Hi I am Ahmad Imam',
                                                  textStyle: context
                                                      .textTheme.headline1!
                                                      .copyWith(
                                                    fontSize: 25,
                                                  ),
                                                  speed: Duration(
                                                      milliseconds: 200)),
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .35,
                                          alignment: Alignment.center,
                                          child: Text(
                                            'I am a computer science graduate from Islamic University of Technology. I am currently working in mobile application development using Flutter framework',
                                            style: Get
                                                .theme.textTheme.headline2!
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
                                          text: 'Contact',
                                          ontap: () async {
                                            try {
                                              await launch(mailUrl);
                                            } catch (e) {
                                              throw 'couldt $e';
                                            }
                                          },
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
                                            MediaQuery.of(context).size.height *
                                                .6,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .4,
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
                          height: 50,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .05,
                                  ),
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height * .3,
                                    width:
                                        MediaQuery.of(context).size.width * .8,
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
                                    height: MediaQuery.of(context).size.height *
                                        .05,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .8,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'My goal is to work in a dynamic professional environment with a growing organization and utilize my creativity and innovative thinking for benefit of the organizaton and myself.',
                                          style: context.textTheme.headline2
                                              ?.copyWith(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .05,
                                  ),
                                  ButtonElevated(
                                    text: 'CV',
                                    icons: Icon(Icons.download),
                                    ontap: () async {
                                      await canLaunch(taxUrl)
                                          ? await launch(taxUrl)
                                          : throw 'Could not launch $taxUrl';
                                    },
                                  )
                                ],
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .2,
                                  ),
                                  Container(
                                    height: 300,
                                    width:
                                        MediaQuery.of(context).size.width * .3,
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
                                    width:
                                        MediaQuery.of(context).size.width * .4,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: 250,
                                            child: Text(
                                              'My goal is to work in a dynamic professional environment with a growing organization and utilize my creativity and innovative thinking for benefit of the organizaton and myself.',
                                              style: context.textTheme.headline2
                                                  ?.copyWith(
                                                fontSize: 16,
                                              ),
                                            )),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        ButtonElevated(
                                          text: 'CV',
                                          icons: Icon(Icons.download),
                                          ontap: () async {
                                            // await canLaunch(taxUrl)
                                            //     ? await launch(taxUrl)
                                            //     : throw 'Could not launch $taxUrl';
                                          },
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
                          height: 100,
                        ),

                        ///skills
                        Text(
                          'Skills',
                          style: context.textTheme.headline1?.copyWith(
                            fontSize: 25,
                          ),
                        ),
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
                                  'Programming Languages',
                                  style: context.textTheme.headline1
                                      ?.copyWith(fontSize: 16),
                                ),
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ProgressbarAnimation(
                                    number: 0.7,
                                    text: 'C',
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ProgressbarAnimation(
                                    number: 0.7,
                                    text: 'C++',
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ProgressbarAnimation(
                                    number: 0.7,
                                    text: 'Dart',
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ProgressbarAnimation(
                                    number: 0.6,
                                    text: 'Python',
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ProgressbarAnimation(
                                    number: 0.6,
                                    text: 'HTML',
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ProgressbarAnimation(
                                    number: 0.6,
                                    text: 'CSS',
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ProgressbarAnimation(
                                    number: 0.6,
                                    text: 'Javascript',
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
                                  'Tools & Softwares',
                                  style: context.textTheme.headline1
                                      ?.copyWith(fontSize: 16),
                                ),
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ProgressbarAnimation(
                                    number: 0.7,
                                    text: 'Android Studio',
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ProgressbarAnimation(
                                    number: 0.7,
                                    text: 'VS Code',
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ProgressbarAnimation(
                                    number: 0.6,
                                    text: 'Git',
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ProgressbarAnimation(
                                    number: 0.6,
                                    text: 'PyCharm',
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ProgressbarAnimation(
                                    number: 0.7,
                                    text: 'Google Colab',
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ProgressbarAnimation(
                                    number: 0.7,
                                    text: 'Latex',
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ProgressbarAnimation(
                                    number: 0.6,
                                    text: 'Microsoft Powerpoint',
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ProgressbarAnimation(
                                    number: 0.6,
                                    text: 'Blender',
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ProgressbarAnimation(
                                    number: 0.6,
                                    text: 'Adobe Illustrator',
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ProgressbarAnimation(
                                    number: 0.7,
                                    text: 'Adobe Premiere PRo',
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
                          height: 100,
                        ),

                        ///portfolio final
                        Text(
                          'Projects',
                          style: context.textTheme.headline1?.copyWith(
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .8,
                              width: MediaQuery.of(context).size.width * .8,
                              // color: Colors.blueAccent,
                              child: Swiper(
                                autoplay: false,
                                itemCount: tst.lsts.length,
                                // loop: true,
                                // layout: SwiperLayout.DEFAULT,
                                scrollDirection: Axis.vertical,
                                pagination: SwiperPagination(),

                                itemBuilder: (BuildContext context, int index) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .3,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .7,
                                        // color: Colors.black,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
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
                                                style: Get
                                                    .theme.textTheme.headline1!
                                                    .copyWith(
                                                  fontSize: ResponsiveWidget
                                                          .isSmallScreen(
                                                              context)
                                                      ? 14
                                                      : 16,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 50.h,
                                              ),
                                              Text(
                                                '${tst.lsts[index].description}',
                                                style: Get
                                                    .theme.textTheme.headline2!
                                                    .copyWith(
                                                  fontSize: ResponsiveWidget
                                                          .isSmallScreen(
                                                              context)
                                                      ? 12
                                                      : 16,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Expanded(
                                                child: ListView.builder(
                                                    itemCount: tst.lsts[index]
                                                        .features.length,
                                                    itemBuilder:
                                                        (context, snapshot) {
                                                      return Text(
                                                        '- ${tst.lsts[index].features[snapshot]}',
                                                        style: Get
                                                            .theme
                                                            .textTheme
                                                            .headline2!
                                                            .copyWith(
                                                          fontSize: ResponsiveWidget
                                                                  .isSmallScreen(
                                                                      context)
                                                              ? 12
                                                              : 14,
                                                        ),
                                                      );
                                                    }),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Swiper(
                                          autoplay: false,
                                          itemCount: tst.lsts[index].pic.length,
                                          // loop: true,
                                          // layout: SwiperLayout.DEFAULT,
                                          scrollDirection: Axis.horizontal,
                                          pagination: SwiperPagination(),
                                          layout: SwiperLayout.TINDER,

                                          outer: true,

                                          itemBuilder: (BuildContext context,
                                              int indexHori) {
                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${tst.lsts[index].pic[indexHori]![1]}',
                                                  style: Get.theme.textTheme
                                                      .headline1!
                                                      .copyWith(
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                Expanded(
                                                    child: Container(
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      border: Border.all(
                                                          color: context.theme
                                                              .backgroundColor,
                                                          width: 5)),
                                                  child: Image.asset(
                                                    '${tst.lsts[index].pic[indexHori]![0]}',
                                                    isAntiAlias: true,
                                                    fit: BoxFit.cover,
                                                  ),
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
                                                textDirection:
                                                    TextDirection.rtl,
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
                                      textStyle: Get.theme.textTheme.headline2!
                                          .copyWith(
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
                          height: 50,
                        ),

                        ///qualification
                        Text(
                          'Journey',
                          style: context.textTheme.headline1?.copyWith(
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
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
                              child: Text('Education'),
                              icon: Icon(Icons.directions_bike),
                            ),
                            Tab(
                              child: Text('Experience'),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .3,
                                    // color: Colors.blue,
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 120,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .3,
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
                                                  padding:
                                                      EdgeInsets.only(left: 5),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Secondary School Certificate',
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
                                        SizedBox(
                                          height: 120,
                                        ),
                                        Container(
                                          height: 150,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .3,
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
                                                  padding:
                                                      EdgeInsets.only(left: 5),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Bachelor of Science',
                                                        style: context
                                                            .textTheme.headline1
                                                            ?.copyWith(
                                                                fontSize: 15),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        'Computer Science and Engineering',
                                                        style: context
                                                            .textTheme.headline1
                                                            ?.copyWith(
                                                                fontSize: 14),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        'Islamic University of Technology',
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
                                                        '- March 2021',
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
                                                            .theme
                                                            .backgroundColor,
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
                                              color: context.theme.textTheme
                                                  .headline1?.color,
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
                                                            .theme
                                                            .backgroundColor,
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
                                              color: context.theme.textTheme
                                                  .headline1?.color,
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
                                                backgroundColor: context
                                                    .theme.backgroundColor,
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                            Color?>(
                                                        context.theme
                                                            .backgroundColor),
                                                value: animationControllerLine1
                                                    .value,
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
                                              color: context.theme.textTheme
                                                  .headline1?.color,
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .3,
                                        // color: Colors.blue,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 100,
                                              child: Stack(children: [
                                                AnimatedPositioned(
                                                  curve: Curves.easeInOut,
                                                  duration:
                                                      Duration(seconds: 2),
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
                                                    duration:
                                                        Duration(seconds: 2),
                                                    child: Container(
                                                      height: 100,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .3,
                                                      // color: Colors.red,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            'Higher Secondary Certificate',
                                                            textAlign:
                                                                TextAlign.right,
                                                            style: context
                                                                .textTheme
                                                                .headline1
                                                                ?.copyWith(
                                                                    fontSize:
                                                                        15),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            'Notre Dame College',
                                                            style: context
                                                                .textTheme
                                                                .headline1
                                                                ?.copyWith(
                                                                    fontSize:
                                                                        13),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            'GPA: 5.00 / 5.00',
                                                            style: context
                                                                .textTheme
                                                                .headline2
                                                                ?.copyWith(
                                                                    fontSize:
                                                                        13),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            '- August 2016',
                                                            style: context
                                                                .textTheme
                                                                .headline2
                                                                ?.copyWith(
                                                                    fontSize:
                                                                        13),
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

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 130,
                                      ),
                                      Container(
                                        height: 100,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .3,
                                        // color: Colors.blue,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 100,
                                              child: Stack(children: [
                                                AnimatedPositioned(
                                                  curve: Curves.easeInOut,
                                                  duration:
                                                      Duration(seconds: 2),
                                                  right: circle1
                                                      ? MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0
                                                      : MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          .5,
                                                  top: 0,
                                                  bottom: 0,
                                                  child: AnimatedOpacity(
                                                    opacity: circle1 ? 1 : 0,
                                                    curve: Curves.easeInOut,
                                                    duration:
                                                        Duration(seconds: 2),
                                                    child: Container(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      height: 100,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .3,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Executive Secretary',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: context
                                                                .textTheme
                                                                .headline1
                                                                ?.copyWith(
                                                                    fontSize:
                                                                        15),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            'IUT Computer Society',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: context
                                                                .textTheme
                                                                .headline1
                                                                ?.copyWith(
                                                                    fontSize:
                                                                        13),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            'January 2020 - February 2021',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: context
                                                                .textTheme
                                                                .headline2
                                                                ?.copyWith(
                                                                    fontSize:
                                                                        13),
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
                                                            .theme
                                                            .backgroundColor,
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
                                              color: context.theme.textTheme
                                                  .headline1?.color,
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
                                                            .theme
                                                            .backgroundColor,
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
                                              color: context.theme.textTheme
                                                  .headline1?.color,
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
                                                backgroundColor: context
                                                    .theme.backgroundColor,
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                            Color?>(
                                                        context.theme
                                                            .backgroundColor),
                                                value: animationControllerLine1
                                                    .value,
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
                                              color: context.theme.textTheme
                                                  .headline1?.color,
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
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .3,
                                    // color: Colors.blue,
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 120,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .3,
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
                                                      .5,
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
                                                  padding:
                                                      EdgeInsets.only(left: 5),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        'Industrial Trainee',
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
                                                        'Battery Low Interactive',
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: context
                                                            .textTheme.headline1
                                                            ?.copyWith(
                                                                fontSize: 13),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        'November 2019 - December 2019',
                                                        textAlign:
                                                            TextAlign.right,
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
                                        SizedBox(
                                          height: 120,
                                        ),
                                        Container(
                                          height: 150,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .3,
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
                                                      .5,
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
                                                  padding:
                                                      EdgeInsets.only(left: 5),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        'Mobile Application Developer',
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
                                                        'BMS Systems',
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: context
                                                            .textTheme.headline1
                                                            ?.copyWith(
                                                                fontSize: 14),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        'October 2021 - November 2021',
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: context
                                                            .textTheme.headline1
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
                        ),

                        SizedBox(
                          height: 50,
                        ),

                        ///services
                        Text(
                          'Service',
                          style: context.textTheme.headline1?.copyWith(
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        InkWell(
                          child: Text('offer'),
                          onTap: () {
                            setState(() {
                              serviceAnimation = !serviceAnimation;
                            });
                          },
                        ),

                        SizedBox(
                          height: 50,
                        ),

                        Container(
                          height: 350,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Stack(
                            alignment: Alignment.center,
                            fit: StackFit.loose,
                            children: [
                              AnimatedPositioned(
                                curve: Curves.easeInBack,
                                duration: Duration(seconds: 1),
                                left: serviceAnimation
                                    ? MediaQuery.of(context).size.width * .0
                                    : MediaQuery.of(context).size.width * .35,
                                right: serviceAnimation
                                    ? MediaQuery.of(context).size.width * .7
                                    : MediaQuery.of(context).size.width * .35,
                                top: 0,
                                bottom: 0,
                                child: InkWell(
                                  onTap: () {},
                                  onHover: (lol) {
                                    setState(() {
                                      serviceHover1 = lol;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    decoration: BoxDecoration(
                                      borderRadius: serviceHover1
                                          ? BorderRadius.circular(15)
                                          : BorderRadius.circular(0.0),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    height: 350,
                                    width:
                                        MediaQuery.of(context).size.width * .3,
                                    alignment: Alignment.centerLeft,
                                    duration: Duration(milliseconds: 500),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 0,
                                          left: 0,
                                          right: 0,
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 500),
                                            height: 350,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              borderRadius: serviceHover1
                                                  ? BorderRadius.circular(15)
                                                  : BorderRadius.circular(0.0),
                                            ),
                                            child: Blur(
                                              blur: .5,
                                              blurColor: Colors.transparent,
                                              colorOpacity: .5,
                                              child: AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 500),
                                                height: 350,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .3,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius: serviceHover1
                                                      ? BorderRadius.circular(
                                                          15)
                                                      : BorderRadius.circular(
                                                          0.0),
                                                ),
                                                child: Image.asset(
                                                  'images/about.jpg',
                                                  isAntiAlias: true,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            top: 10,
                                            left: 0,
                                            right: 0,
                                            child: Icon(Icons.add)),
                                        Positioned(
                                            top: 50,
                                            left: 0,
                                            right: 0,
                                            child: Text(
                                              'UI 3',
                                              textAlign: TextAlign.center,
                                            )),
                                        Positioned(
                                          child: Container(
                                            alignment: Alignment.center,

                                            // width: 120,
                                            child: ButtonElevated(
                                              text: 'View More',
                                              icons: Icon(Icons.arrow_back_ios),
                                              ontap: () {},
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              AnimatedPositioned(
                                duration: Duration(seconds: 1),
                                curve: Curves.easeInBack,
                                left: serviceAnimation
                                    ? MediaQuery.of(context).size.width * .7
                                    : MediaQuery.of(context).size.width * .35,
                                right: serviceAnimation
                                    ? MediaQuery.of(context).size.width * .0
                                    : MediaQuery.of(context).size.width * .35,
                                top: 0,
                                bottom: 0,
                                child: InkWell(
                                  onTap: () {},
                                  onHover: (lol) {
                                    setState(() {
                                      serviceHover2 = lol;
                                    });
                                  },
                                  child: Stack(
                                    // mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        right: 0,
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 500),
                                          height: 350,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .3,
                                          decoration: BoxDecoration(
                                            borderRadius: serviceHover2
                                                ? BorderRadius.circular(15)
                                                : BorderRadius.circular(0),
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          child: Blur(
                                            blur: .5,
                                            blurColor: Colors.transparent,
                                            colorOpacity: .5,
                                            child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              height: 350,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .3,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                borderRadius: serviceHover2
                                                    ? BorderRadius.circular(15)
                                                    : BorderRadius.circular(0),
                                              ),
                                              child: Image.asset(
                                                'images/about.jpg',
                                                isAntiAlias: true,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          top: 10,
                                          left: 0,
                                          right: 0,
                                          child: Icon(Icons.add)),
                                      Positioned(
                                          top: 50,
                                          left: 0,
                                          right: 0,
                                          child: Text(
                                            'UI 2',
                                            textAlign: TextAlign.center,
                                          )),
                                      Positioned(
                                        child: Container(
                                          alignment: Alignment.center,

                                          // width: 120,
                                          child: ButtonElevated(
                                            text: 'View More',
                                            icons: Icon(Icons.arrow_back_ios),
                                            ontap: () {},
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              AnimatedPositioned(
                                duration: Duration(seconds: 1),
                                left: MediaQuery.of(context).size.width * .35,
                                right: MediaQuery.of(context).size.width * .35,
                                child: InkWell(
                                  onTap: () {},
                                  onHover: (lol) {
                                    setState(() {
                                      serviceHover3 = lol;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    decoration: BoxDecoration(
                                      borderRadius: serviceHover3
                                          ? BorderRadius.circular(15)
                                          : BorderRadius.circular(0.0),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    height: 350,
                                    width:
                                        MediaQuery.of(context).size.width * .3,
                                    alignment: Alignment.centerLeft,
                                    duration: Duration(milliseconds: 500),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 0,
                                          left: 0,
                                          right: 0,
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 500),
                                            height: 350,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              borderRadius: serviceHover3
                                                  ? BorderRadius.circular(15)
                                                  : BorderRadius.circular(0.0),
                                            ),
                                            child: Blur(
                                              blur: .5,
                                              blurColor: Colors.transparent,
                                              colorOpacity: .5,
                                              child: AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 500),
                                                height: 350,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .3,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius: serviceHover3
                                                      ? BorderRadius.circular(
                                                          15)
                                                      : BorderRadius.circular(
                                                          0.0),
                                                ),
                                                child: Image.asset(
                                                  'images/about.jpg',
                                                  isAntiAlias: true,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            top: 10,
                                            left: 0,
                                            right: 0,
                                            child: Icon(Icons.add)),
                                        Positioned(
                                            top: 50,
                                            left: 0,
                                            right: 0,
                                            child: Text(
                                              'UI 3',
                                              textAlign: TextAlign.center,
                                            )),
                                        Positioned(
                                          child: Container(
                                            alignment: Alignment.center,

                                            // width: 120,
                                            child: ButtonElevated(
                                              text: 'View More',
                                              icons: Icon(Icons.arrow_back_ios),
                                              ontap: () {},
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 50,
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
