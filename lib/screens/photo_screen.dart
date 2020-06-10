import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FullScreenImageArguments {
  FullScreenImageArguments({
    this.key,
    this.altDescription = "Beautiful girl in a yellow dress with a flower on her head in the summer in the forest",
    this.userName = "Dianne Miles",
    this.name = "Dianne Miles"
  });

  final String altDescription;
  final String userName;
  final String name;
  final Key key;
}


class FullScreenImage extends StatefulWidget {
  final String altDescription;
  final String userName;
  final String name;
  final String heroTag;
  final String photo;
  final String userPhoto;

  const FullScreenImage({
    Key key,
    this.heroTag,
    this.altDescription = "Beautiful girl in a yellow dress with a flower on her head in the summer in the forest",
    this.userName = "Dianne Miles",
    this.name = "Dianne Miles",
    this.photo = "https://flutter.dev/assets/404/dash_nest-c64796b59b65042a2b40fae5764c13b7477a592db79eaf04c86298dcb75b78ea.png",
    this.userPhoto = "https://yt3.ggpht.com/a/AATXAJz27iTj3TgFPlucLd6iqiUgjcOJ3FJ_WQg1kQ=s48-c-k-c0xffffffff-no-rj-mo"
  }) : super(key: key);


  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> with SingleTickerProviderStateMixin {

  AnimationController animationController;
  Animation<double> avatarAnimation;
  Animation<double> userIfoAnation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500)
    );

    avatarAnimation = Tween<double>(
      begin: 0,
      end: 1
    ).animate(
      CurvedAnimation(
        parent: animationController, 
        curve: const Interval(0, .5, curve: Curves.ease)
      )
    );

    userIfoAnation = Tween<double>(
      begin: 0,
      end: 1
    ).animate(
      CurvedAnimation(
        parent: animationController, 
        curve: Interval(.5, 1, curve: Curves.ease)
      )
    );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Color(0xFF9FA8B3),
          ), 
          onPressed: (){
            Navigator.of(context).pop();
          }
        ),
        title: Text(
          "Photo",
          style: AppStyles.h1Black,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 10
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: widget.heroTag,
              child: Photo(
                photoLink: widget.photo,
              ),
            ),
            SizedBox(height: 16),
            Text(
              widget.altDescription,
              style: AppStyles.h3,
            ),
            SizedBox(height: 15),
            AnimatedBuilder(
              animation: animationController,
              builder: (context, child){
                return Row(
                  children: <Widget>[
                    Opacity(
                      opacity: avatarAnimation.value,
                      child: UserAvatar(
                        avatarLink: widget.userPhoto,
                      ),
                    ),
                    SizedBox(width: 10),
                    Opacity(
                      opacity: userIfoAnation.value,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            widget.name, 
                            style: AppStyles.h1Black,
                          ),
                          Text(
                            "@${widget.userName}",
                            style: AppStyles.h5Black.copyWith(
                              color: AppColors.manatee
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 17),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: LikeButton(likeCount: 2157, isLiked: false),
                  )
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF39CEFD),
                        borderRadius: BorderRadius.circular(7)
                      ),
                      height: 36,
                      child: Center(
                        child: Text(
                          "Save",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                          )
                        ),
                      ),
                    ),
                  )
                ),
                SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: (){},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF39CEFD),
                        borderRadius: BorderRadius.circular(7)
                      ),
                      height: 36,
                      child: Center(
                        child: Text(
                          "Visit",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                          )
                        ),
                      ),
                    ),
                  )
                )
              ],
            )
          ], 
        ),
      ),
    );
  }
}

