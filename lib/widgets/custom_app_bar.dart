import 'package:facebook_adaptative_xp/config/palette.dart';
import 'package:facebook_adaptative_xp/widgets/custom_tab_bar.dart';
import 'package:facebook_adaptative_xp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:facebook_adaptative_xp/models/models.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget {

  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function onTap;

  CustomAppBar({@required this.currentUser, @required this.icons, @required this.selectedIndex, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      padding: EdgeInsets.symmetric(
        horizontal: 20.0
      ),
      decoration: BoxDecoration(
          color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4.0
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
                "facebook",
              style: TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: 600.0,
            child: CustomTabBar(
                icons: icons,
                selectedIndex: selectedIndex,
                onTap: onTap,
              isBottomIndicator: true,
            ),
          ),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  UserCard(user: currentUser),
                  SizedBox(width: 4.0,),
                  CircleButton(icon: Icons.search, iconSize: 30.0, onPressed: () {print("Search");}),
                  CircleButton(icon: MdiIcons.facebookMessenger, iconSize: 30.0, onPressed: () {print("Messenger");}),
                ],
          ))
        ],
      ),
    );
  }
}
