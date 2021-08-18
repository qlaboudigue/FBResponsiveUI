import 'package:facebook_adaptative_xp/config/palette.dart';
import 'package:flutter/material.dart';


class CustomTabBar extends StatelessWidget {

  final List<IconData> icons;
  final int selectedIndex;
  final Function onTap;
  final bool isBottomIndicator;

  CustomTabBar({@required this.icons, @required this.selectedIndex, @required this.onTap, this.isBottomIndicator = false});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicator: BoxDecoration(
        border: isBottomIndicator ?
        Border(
          bottom: BorderSide(
                color: Palette.facebookBlue,
                width: 3.0,
          )
        )
            : Border(
            top: BorderSide(
              color: Palette.facebookBlue,
              width: 3.0,
            )
        )
      ),
      tabs: icons.asMap().map((i, e) => MapEntry(
          i,
          Tab(
            icon: Icon(
            e,
            color: i == selectedIndex
              ? Palette.facebookBlue
              : Colors.black45,
              size: 30.0,
            ),
          ),
      ))
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
