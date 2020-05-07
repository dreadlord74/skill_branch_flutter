import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullScreenImage extends StatefulWidget {
  final String altDescription;
  final String userName;
  final String name;

  const FullScreenImage({
    Key key,
    this.altDescription = "Beautiful girl in a yellow dress with a flower on her head in the summer in the forest",
    this.userName = "Dianne Miles",
    this.name = "Dianne Miles"
  }) : super(key: key);


  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
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
            Photo(
              photoLink: "https://flutter.dev/assets/404/dash_nest-c64796b59b65042a2b40fae5764c13b7477a592db79eaf04c86298dcb75b78ea.png",
            ),
            SizedBox(height: 16),
            Text(
              widget.altDescription,
              style: AppStyles.h3,
            ),
            SizedBox(height: 15),
            Row(
              children: <Widget>[
                UserAvatar(
                  avatarLink: "https://yt3.ggpht.com/a/AATXAJz27iTj3TgFPlucLd6iqiUgjcOJ3FJ_WQg1kQ=s48-c-k-c0xffffffff-no-rj-mo"
                ),
                SizedBox(width: 10),
                Column(
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
              ],
            ),
            SizedBox(height: 17,),
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

