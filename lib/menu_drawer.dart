import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
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
            ///home
            InkWell(
              onTap: () {},
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

            ///contact
            InkWell(
              onTap: () {},
              child: Text(
                'Contact',
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

            ///profile
            InkWell(
              onTap: () {},
              child: Text(
                'Profile',
                style: context.textTheme.headline1?.copyWith(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Divider(
                color: context.theme.backgroundColor,
                thickness: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
