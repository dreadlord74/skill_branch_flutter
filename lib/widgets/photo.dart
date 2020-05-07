import 'package:FlutterGalleryApp/res/res.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Photo extends StatelessWidget {
  final String photoLink;

  Photo({
    Key key,
    this.photoLink
  }) : super(
    key: key
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(17)),
        child: Container(
          color: AppColors.grayChateau,
          child: CachedNetworkImage(
            imageUrl: photoLink,
            // placeholder: (context, url) => Center(child: CircleAvatar(),),
          ),
        ),
      ),
    );
  }
}