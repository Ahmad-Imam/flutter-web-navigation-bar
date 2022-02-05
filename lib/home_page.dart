import 'package:flutter/cupertino.dart';
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

      animationControllerContainerRight1.forward();
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

      print('ooopppp $_scrollPosition');
    });
  }

  Test tst = Test();

  @override
  void initState() {
    tst.addtoList();

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

                  ///intro

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 20,
                      ),

                      Container(
                        height: MediaQuery.of(context).size.height * .2,
                        color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Hi I am a Bot',
                              style: context.textTheme.headline1!.copyWith(
                                fontSize: 20.sp,
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .4,
                              color: Colors.red,
                              alignment: Alignment.center,
                              child: Text(
                                'Lorem ipsum, dolor sit amet cons adipisicing elit. Ipsam debitisvoluptates consequuntur repellat nulla possimus?',
                                style: Get.theme.textTheme.headline2!.copyWith(
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
                      Container(
                        width: MediaQuery.of(context).size.width * .1,
                      ),
                      Expanded(
                        child: ClipPath(
                          clipper: CustomClippersPath(),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .6,
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
                    height: 100.h,
                  ),

                  ///qualification
                  Text('qualificatiom'),
                  InkWell(
                      onTap: () {
                        animationControllerLine1.forward();
                        animationControllerContainerLeft1.forward();
                        print(animationControllerContainerLeft1.value);
                      },
                      child: Text('journey')),

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
                    // color: Colors.black87,
                    child: TabBarView(
                      children: [
                        // first tab bar view widget
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .3,
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width:
                                        MediaQuery.of(context).size.width * .3,
                                    color: Colors.red,
                                    child: Column(
                                      children: [
                                        Expanded(
                                            child: Text(
                                                'Computersasd asd adccas asdasd')),
                                        Text('Computer'),
                                        Text('Computer'),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 90,
                                  ),
                                  AnimatedBuilder(
                                      animation: animationContainerLeft1,
                                      builder: (context, child) {
                                        return Opacity(
                                          opacity:
                                              animationControllerOpacity.value,
                                          child: Container(
                                            height: 100,
                                            color: Colors.teal,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      animationControllerContainerLeft1
                                                          .value,
                                                  child: Container(
                                                    height: 100,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .3,
                                                    color: Colors.red,
                                                    padding: EdgeInsets.all(5),
                                                    child: Column(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                              '{animationControllerContainerLeft1.value}'),
                                                        ),
                                                        Text('Computer'),
                                                        Text('Computer'),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Stack(
                              children: [
                                AnimatedPositioned(
                                  duration: Duration(seconds: 2),
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),

                                ///line1
                                AnimatedPositioned(
                                  duration: Duration(seconds: 2),
                                  child: Container(
                                    height: 90,
                                    child: RotatedBox(
                                        quarterTurns: 1,
                                        child: AnimatedBuilder(
                                            animation: animationLine1,
                                            builder: (context, child) {
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
                                                    value:
                                                        animationControllerLine1
                                                            .value,
                                                  ),
                                                ],
                                              );
                                            })),
                                  ),
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

                                ///line2
                                Container(
                                  height: 90,
                                  child: RotatedBox(
                                      quarterTurns: 1,
                                      child: AnimatedBuilder(
                                          animation: animationLine1,
                                          builder: (context, child) {
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
                                                  value:
                                                      animationControllerLine1
                                                          .value,
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
                                //line3
                                Container(
                                  height: 90,
                                  child: RotatedBox(
                                      quarterTurns: 1,
                                      child: AnimatedBuilder(
                                          animation: animationLine1,
                                          builder: (context, child) {
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
                                                  value:
                                                      animationControllerLine1
                                                          .value,
                                                ),
                                              ],
                                            );
                                          })),
                                ),
                              
                              
                              ],
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            AnimatedBuilder(
                                animation: animationContainerRight1,
                                builder: (context, child) {
                                  return Opacity(
                                    opacity: animationControllerOpacity.value,
                                    child: Container(
                                      height: 100,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                animationControllerContainerRight1
                                                    .value,
                                            child: Container(
                                              height: 100,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .3,
                                              color: Colors.red,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                        '{animationControllerContainerLeft1.value}'),
                                                  ),
                                                  Text('Computsser'),
                                                  Text('Computer'),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
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

                  ///about
                  Text(
                    'About Me',
                    style: context.textTheme.headline1?.copyWith(
                      fontSize: 20.sp,
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width * .4,
                        color: Colors.red,
                        child: Image.asset(
                          'assets/images/about.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 250,
                              child: Text(
                                'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Assumenda quas sit tempore temporibus velit aspernatur, itaque quibusdam alias voluptatum pariatur?',
                                style: context.textTheme.headline2?.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            ButtonElevated(
                              text: 'CV',
                              icons: Icon(Icons.download),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),

                  ///portfolio final
                  Text('Portfoliosss'),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .7,
                            width: MediaQuery.of(context).size.width * .8,
                            color: Colors.blueAccent,
                            child: Swiper(
                              autoplay: false,
                              itemCount: 3,
                              // loop: true,
                              // layout: SwiperLayout.DEFAULT,
                              scrollDirection: Axis.vertical,
                              pagination: SwiperPagination(),
                              control: SwiperControl(),
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .7,
                                      color: Colors.black,
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
                                            Text('${tst.lsts[index].name}'),
                                            SizedBox(
                                              height: 50.h,
                                            ),
                                            Text(
                                                '${tst.lsts[index].description}'),
                                            SizedBox(
                                              height: 50.h,
                                            ),
                                            Text('-Feature 1'),
                                            Text('-Feature 2'),
                                            Text('-Feature 3'),
                                            Text('-Feature 4'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          .5,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .7,
                                      color: Colors.red,
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
                                            MediaQuery.of(context).size.height *
                                                .7,
                                        itemWidth:
                                            MediaQuery.of(context).size.width *
                                                .3,

                                        itemBuilder: (BuildContext context,
                                            int indexHori) {
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                  '${tst.lsts[index].pic[indexHori]![1]}'),
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
                                                    borderRadius:
                                                        BorderRadius.all(
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Pages'),
                              Container(
                                width: 50.w,
                                height: 60.h,
                                // color: Colors.black,
                                child: RiveAnimation.asset(
                                  '/images/horiz.riv',
                                ),
                              ),
                              Text('Projects'),
                              Container(
                                width: 30.w,
                                height: 100.h,
                                // color: Colors.black,
                                child: RiveAnimation.asset(
                                  '/images/ver.riv',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 200,
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
                          title: Text('Frontend Dev'),
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
                          title: Text('Frontend Dev'),
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

                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.black,
                    child: RiveAnimation.asset(
                      '/images/horiz.riv',
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.black,
                    child: RiveAnimation.asset(
                      '/images/ver.riv',
                    ),
                  ),

                  SizedBox(
                    height: 100,
                  ),

                  SizedBox(
                    height: 200,
                  ),

                  ///services
                  Text('service'),
                  Text('offer'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: HoverContainer(
                          height: 350,
                          width: 260,
                          color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.add),
                                Text('UI'),
                                Container(
                                  width: 140,
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
                      Expanded(
                        child: HoverContainer(
                          height: 350,
                          width: 250,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: HoverContainer(
                          height: 350,
                          width: 250,
                          color: Colors.red,
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

                  ///skills

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

                  ///qualification
                  Text('qualificatiom'),
                  Text('journey'),
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
