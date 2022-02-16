import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuDrawer extends StatelessWidget {
  ScrollController scrollController;
  MenuDrawer({
    required this.scrollController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'AI',
              style: context.textTheme.headline1!.copyWith(fontSize: 25),
            ),
            SizedBox(
              height: 30,
            ),

            ///home
            InkWell(
              onTap: () {
                scrollController.animateTo(1500,
                    duration: Duration(seconds: 1), curve: Curves.easeInBack);
              },
              child: Text(
                'Home',
                style: context.textTheme.headline1?.copyWith(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Divider(
                color: context.theme.backgroundColor,
                thickness: 2,
              ),
            ),

            ///about
            InkWell(
              onTap: () {},
              child: Text(
                'About',
                style: context.textTheme.headline1?.copyWith(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Divider(
                color: context.theme.backgroundColor,
                thickness: 2,
              ),
            ),

            ///Journey
            InkWell(
              onTap: () {},
              child: Text(
                'Journey',
                style: context.textTheme.headline1?.copyWith(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Divider(
                color: context.theme.backgroundColor,
                thickness: 2,
              ),
            ),

            ///Skills
            InkWell(
              onTap: () {},
              child: Text(
                'Skills',
                style: context.textTheme.headline1?.copyWith(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Divider(
                color: context.theme.backgroundColor,
                thickness: 2,
              ),
            ),

            ///Projects
            InkWell(
              onTap: () {},
              child: Text(
                'Projects',
                style: context.textTheme.headline1?.copyWith(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Divider(
                color: context.theme.backgroundColor,
                thickness: 2,
              ),
            ),

            ///Hobby
            InkWell(
              onTap: () {},
              child: Text(
                'Hobby',
                style: context.textTheme.headline1?.copyWith(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Divider(
                color: context.theme.backgroundColor,
                thickness: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
