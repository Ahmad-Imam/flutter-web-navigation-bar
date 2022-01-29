import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nav/LinePainter.dart';
import 'package:flutter_nav/const.dart';
import 'package:flutter_nav/custom_clip.dart';
import 'package:flutter_nav/responsive.dart';
import 'package:flutter_nav/top_bar_contents.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';

import 'menu_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  RxBool isActive = false.obs;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
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
              child: TopBarContents(),
            ),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Column(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        HoverAnimatedContainer(
                          width: 200,
                          height: 200,
                          color: Colors.red,
                          hoverColor: Colors.green,
                          hoverHeight: 220,
                          hoverWidth: 220,
                          curve: Curves.easeInOutBack,
                          child: Text('lol'),
                        ),
                        Text('Lol',
                            style: Theme.of(context).textTheme.headline1),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(),
                          onPressed: () {},
                          child: Text(
                            'press',
                            style: Get.textTheme.subtitle1!.copyWith(
                              color: Get.theme.primaryColor,
                            ),
                          ),
                        )
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
                  ],
                ),
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
    );
    ;
  }
}
