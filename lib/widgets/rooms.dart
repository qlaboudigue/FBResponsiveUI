import 'package:facebook_adaptative_xp/config/palette.dart';
import 'package:facebook_adaptative_xp/widgets/profile_avatar.dart';
import 'package:facebook_adaptative_xp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:facebook_adaptative_xp/models/models.dart';

class Rooms extends StatelessWidget {

  final List<User> onlineUsers;

  Rooms({@required this.onlineUsers});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        height: 60.0,
        color: Colors.white,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
          scrollDirection: Axis.horizontal,
            itemCount: 1 + onlineUsers.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: _CreateRoomButton(),
                );
              }
              final User user = onlineUsers[index - 1];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: ProfileAvatar(imageUrl: user.imageUrl, isActive: true,),
              );
            }
        ),
      ),
    );
  }
}


class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => print("Create Room"),
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(
                  width: 3.0,
                  color: Colors.blueAccent[100],
              ),
            )
          ),
        ),
        child: Row(
          children: [
            /*
            ShaderMask(
              shaderCallback: (rect) => Palette.createRoomGradient.createShader(rect),
              child: Icon(
                Icons.video_call,
                size: 35.0,
                color: Colors.white,
              ),
            ),
             */
            Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.purple,
            ),
            SizedBox(width: 4.0),
            Text(
                'Create\nRoom',
              style: TextStyle(
                color: Palette.facebookBlue
              ),
            ),
          ],
        )
    );
  }
}

