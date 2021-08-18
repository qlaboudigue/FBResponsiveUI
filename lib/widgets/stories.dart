import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_adaptative_xp/config/palette.dart';
import 'package:facebook_adaptative_xp/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:facebook_adaptative_xp/models/models.dart';
import 'package:flutter/widgets.dart';
import 'package:facebook_adaptative_xp/widgets/widgets.dart';


class Stories extends StatelessWidget {

  final User currentUser;
  final List<Story> stories;

  Stories({@required this.currentUser, @required this.stories});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Responsive.isDesktop(context) ? Colors.transparent : Colors.white,
      height: 200.0,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 8.0
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + stories.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.0,
                ),
                child: _StoryCard(
                  currentUser: currentUser,
                  isAddStory: true
                ),
              );
            } else {
              final Story story = stories[index - 1];
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.0
                ),
                child: _StoryCard(
                    isAddStory: false,
                    story: story
                ),
              );
            }
          }
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {

  final bool isAddStory;
  final User currentUser;
  final Story story;

  _StoryCard({
    this.isAddStory,
    this.currentUser,
    this.story
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: CachedNetworkImage(
              imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl,
              height: double.infinity,
              width: 110.0,
              fit: BoxFit.cover
          ),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: Responsive.isDesktop(context)
                ? [BoxShadow(color: Colors.black26, offset: Offset(0,2), blurRadius: 4.0)]
                : null,
          ),
        ),
        Positioned(
            top: 8.0,
            left: 8.0,
            child: isAddStory
                ? Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                  icon: Icon(Icons.add),
                  color: Palette.facebookBlue,
                  onPressed: () {print("Add Story");}),
            )
                : ProfileAvatar(imageUrl: story.user.imageUrl, hasBorder: !story.isViewed,)
        ),
        Positioned(
            bottom: 8.0,
            left: 8.0,
            right: 8.0,
            child: Text(
              isAddStory ? "Add story" : story.user.name,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
        ),
      ],
    );
  }
}


