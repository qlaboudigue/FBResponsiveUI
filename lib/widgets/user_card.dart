import 'package:facebook_adaptative_xp/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:facebook_adaptative_xp/models/models.dart';

class UserCard extends StatelessWidget {

  final User user;

  UserCard({@required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imageUrl: user.imageUrl),
          SizedBox(width: 6.0,),
          Flexible(
            child: Text(
              user.name,
              style: TextStyle(
                fontSize: 16.0,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
