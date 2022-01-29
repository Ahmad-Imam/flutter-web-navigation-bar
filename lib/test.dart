import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController transitionAnimation;
  @override
  void initState() {
    super.initState();
    transitionAnimation = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    transitionAnimation.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.15,
                  child: AnimatedBuilder(
                    animation: transitionAnimation,
                    builder: (context, child) {
                      return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(-2, 0),
                            end: const Offset(0, 0),
                          ).animate(CurvedAnimation(
                              curve: const Interval(0, 1, curve: Curves.easeIn),
                              parent: transitionAnimation)),
                          child: child);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * 0.85,
                      color: Colors.orange,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  child: AnimatedBuilder(
                    animation: transitionAnimation,
                    builder: (context, child) {
                      return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(-1, 0),
                            end: const Offset(0, 0),
                          ).animate(CurvedAnimation(
                              curve: const Interval(.01, 0.25,
                                  curve: Curves.easeInExpo),
                              parent: transitionAnimation)),
                          child: child);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * 0.15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          
          
          
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          transitionAnimation.repeat();
//           Navigator.of(context).push(MaterialPageRoute(
//             builder: (context) => FirstPage(),
//           ));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
