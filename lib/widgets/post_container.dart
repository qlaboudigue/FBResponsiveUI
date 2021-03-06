import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_adaptative_xp/config/palette.dart';
import 'package:facebook_adaptative_xp/widgets/profile_avatar.dart';
import 'package:facebook_adaptative_xp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:facebook_adaptative_xp/models/models.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {

  final Post post;

  PostContainer({@required this.post});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0, vertical: 5.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: 8.0
        ),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(post: post),
                  SizedBox(height: 4.0),
                  Text(post.caption),
                  SizedBox(height: 8.0),
                  post.imageUrl != null ? SizedBox.shrink() : SizedBox(height: 6.0)
                ],
              ),
            ),
            post.imageUrl != null ? CachedNetworkImage(imageUrl: post.imageUrl) : SizedBox.shrink(),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12.0
              ),
              child: _PostStats(post: post),
            ),
          ],
        ),
      ),
    );
  }
}


class _PostHeader extends StatelessWidget {

  final Post post;

  _PostHeader({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        SizedBox(width: 8.0,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  post.user.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w600
                  ),
              ),
              Row(
                children: [
                  Text(
                      '${post.timeAgo} ??? ',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12.0
                      ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  )
                ],
              ),
            ],
          ),
        ),
        IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () => print("More")
        )
      ],
    );
  }
}

class _PostStats extends StatelessWidget {

  final Post post;

  _PostStats({
    @required this.post
});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle
              ),
              child: Icon(
                Icons.thumb_up,
                color: Colors.white,
                size: 10.0,
              ),
            ),
            SizedBox(width: 4.0,),
            Expanded(
              child: Text('${post.likes}',
                style: TextStyle(
                  color: Colors.grey[600]
                )
              ),
            ),
            Text('${post.comments} Comments',
                style: TextStyle(
                    color: Colors.grey[600]
                )
            ),
            SizedBox(width: 8.0,),
            Text('${post.shares} Shares',
                style: TextStyle(
                    color: Colors.grey[600]
                )
            )
          ],
        ),
        Divider(),
        Row(
          children: [
            _PostButton(
                icon: Icon(MdiIcons.thumbUpOutline,  color: Colors.grey[600], size: 20.0,),
              label: "Like",
              onTap: () => print('Like'),
            ),
            _PostButton(
              icon: Icon(MdiIcons.commentOutline,  color: Colors.grey[600], size: 20.0,),
              label: "Comment",
              onTap: () => print('Like'),
            ),
            _PostButton(
              icon: Icon(MdiIcons.shareOutline,  color: Colors.grey[600], size: 25.0,),
              label: "Share",
              onTap: () => print('Like'),
            )
          ],
        )
      ],
    );
  }
}


class _PostButton extends StatelessWidget {

  final Icon icon;
  final String label;
  final Function onTap;

  _PostButton({@required this.icon, @required this.label, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                SizedBox(width: 4.0),
                Text(label)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
