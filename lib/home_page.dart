import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nav/LinePainter.dart';
import 'package:flutter_nav/const.dart';
import 'package:flutter_nav/custom_clip.dart';
import 'package:flutter_nav/responsive.dart';
import 'package:flutter_nav/top_bar_contents.dart';
import 'package:flutter_nav/widgets/button_elevated.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
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
  }

  Test tst = Test();

  @override
  void initState() {
    tst.addtoList();

    print('pp');
    print(tst.lsts[0].pic[0]);

    _scrollController.addListener(_scrollListener);
    animationControllerLine1 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    animationLine1 =
        Tween<double>(begin: 0, end: 1).animate(animationControllerLine1);

    animationControllerContainerLeft1 = AnimationController(
        lowerBound: -0.5,
        upperBound: 0.0,
        vsync: this,
        animationBehavior: AnimationBehavior.preserve,
        duration: Duration(milliseconds: 2000));
    animationContainerLeft1 =
        Tween<double>(begin: 0, end: 1).animate(animationControllerLine1);

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

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: ResponsiveWidget.isSmallScreen(context)
            ? AppBar(
                iconTheme: IconThemeData(color: Colors.green),
                backgroundColor: Colors.white70,
                elevation: 0,
                centerTitle: true,
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
                preferredSize: Size(screenSize.width, 70),
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

                  ///portfolio
                  Text('Portfolio'),

                  Container(
                    height: 400,
                    width: 650,
                    color: Colors.red,
                    child: Swiper(
                      autoplay: false,
                      itemCount: 3,
                      // loop: true,
                      // layout: SwiperLayout.DEFAULT,
                      scrollDirection: Axis.vertical,
                      pagination: SwiperPagination(),
                      control: SwiperControl(),
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0)
                          return Row(
                            children: [
                              Text('lol'),
                              Container(
                                height: 200,
                                width: 450,
                                child: Swiper(
                                  indicatorLayout: PageIndicatorLayout.NONE,
                                  autoplay: true,
                                  itemCount: 3,
                                  // loop: true,
                                  // layout: SwiperLayout.DEFAULT,
                                  scrollDirection: Axis.horizontal,
                                  pagination: SwiperPagination(),
                                  control: SwiperControl(),
                                  containerHeight: 100,
                                  containerWidth: 100,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    if (index == 0)
                                      return Container(
                                          width: 50,
                                          height: 50,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          child: Image.asset(
                                            'assets/images/about.jpg',
                                            fit: BoxFit.cover,
                                          ));
                                    if (index == 1)
                                      return Container(
                                          alignment: Alignment.center,
                                          child: Text('lol2'));
                                    if (index == 2)
                                      return Container(
                                          alignment: Alignment.center,
                                          child: Text('lol3'));
                                    return Text('pp');
                                  },
                                ),
                              ),
                            ],
                          );
                        if (index == 1)
                          return Container(
                              alignment: Alignment.center, child: Text('lol2'));
                        if (index == 2)
                          return Container(
                              alignment: Alignment.center, child: Text('lol3'));
                        return Text('pp');
                      },
                    ),
                  ),

                  SizedBox(
                    height: 200,
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
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Column(
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
                                  AnimatedBuilder(
                                      animation: animationContainerLeft1,
                                      builder: (context, child) {
                                        return Container(
                                          height: 100,
                                          width: 200,
                                          color: Colors.amber,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: screenSize.width *
                                                    animationControllerContainerLeft1
                                                        .value,
                                                child: Column(
                                                  children: [
                                                    Text(
                                                        '{animationControllerContainerLeft1.value}'),
                                                    Text('Computer'),
                                                    Text('Computer'),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 150,
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
                            SizedBox(
                              width: 150,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                  ),
                                  Container(
                                    width: 200,
                                    height: 100,
                                    color: Colors.amber,
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

                  ///portfolio
                  Text('Portfolio'),

                  Container(
                    height: 200,
                    width: 450,
                    color: Colors.red,
                    child: Swiper(
                      autoplay: false,
                      containerHeight: 100,
                      containerWidth: 100,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0)
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  width: 250,
                                  height: 150,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Image.asset(
                                    'assets/images/about.jpg',
                                    fit: BoxFit.cover,
                                  )),
                              Container(
                                  alignment: Alignment.center,
                                  child: Text('lol')),
                            ],
                          );
                        if (index == 1)
                          return Container(
                              alignment: Alignment.center, child: Text('lol2'));
                        if (index == 2)
                          return Container(
                              alignment: Alignment.center, child: Text('lol3'));
                        return Text('pp');
                      },
                      itemCount: 3,
                      pagination: SwiperPagination(),
                      control: SwiperControl(),
                    ),
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
                          width: 250,
                          color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.add),
                                Text('UI'),
                                ButtonElevated(
                                    text: 'View More',
                                    icons: Icon(Icons.arrow_back_ios))
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

                  ///intro

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 20,
                      ),

                      Column(
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
                          SizedBox(
                            height: 10,
                          ),
                          Icon(Icons.facebook),
                          SizedBox(
                            height: 10,
                          ),
                          Icon(Icons.facebook),
                          SizedBox(
                            height: 10,
                          ),
                          Icon(Icons.facebook),
                          SizedBox(
                            height: 10,
                          ),
                        ],
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi I am a Bot',
                            style: Get.theme.textTheme.headline1!
                                .copyWith(fontSize: 25),
                          ),
                          Text(
                            'Hi I am a Bot',
                            style: Get.theme.textTheme.headline1!
                                .copyWith(fontSize: 20),
                          ),
                          Container(
                            width: 300,
                            color: Colors.red,
                            alignment: Alignment.center,
                            child: Text(
                              'Lorem ipsum, dolor sit amet cons adipisicing elit. Ipsam debitisvoluptates consequuntur repellat nulla possimus?',
                              style: Get.theme.textTheme.headline1!.copyWith(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          ButtonElevated(
                            icons: Icon(Icons.arrow_forward_ios),
                            text: 'Press',
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            splashFactory: NoSplash.splashFactory,
                            onHover: (val) {
                              print(val);
                              setState(() {
                                scrollDown = val;
                              });
                            },
                            onTap: () {},
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
                          )
                        ],
                      ),
                      Expanded(
                        child: Container(
                            height: 300,
                            width: 300,
                            child: Image.asset('assets/images/about.jpg')),
                      ),

                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),

                  ///about
                  Text('About Me'),
                  Text('intro'),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 300,
                        width: 300,
                        color: Colors.red,
                        child: Image.asset(
                          'assets/images/about.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 250,
                            child: Text(
                                'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Assumenda quas sit tempore temporibus velit aspernatur, itaque quibusdam alias voluptatum pariatur?'),
                          ),
                          ButtonElevated(
                            text: 'Download CV',
                            icons: Icon(Icons.download),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
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
                        width: 250,
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
                        width: 250,
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
                      height: screenSize.height * .9,
                      width: screenSize.width,
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
