import 'package:flutter/material.dart';

import '../constants.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    required this.title,
    required this.tapEvent
  });

  final String title;
  final GestureTapCallback tapEvent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapEvent,
      hoverColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title,
          style: TextStyle(
            color: kTextColor,
            fontWeight: FontWeight.w300
          ),
        ),
      ),
    );
  }
}