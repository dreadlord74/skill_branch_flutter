// import 'package:FlutterGalleryApp/app.dart';
// import 'package:FlutterGalleryApp/screens/feed_screen.dart';
// import 'dart:io';

import 'package:FlutterGalleryApp/screens/home.dart';
// import 'package:FlutterGalleryApp/screens/photo_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

void main(){
  // debugRepaintRainbowEnabled = true;
  runApp(
    MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      // onGenerateRoute: (RouteSettings settings){
      //   if (settings.name == "/fullScreenImage"){
      //     FullScreenImageArguments args = settings.arguments as FullScreenImageArguments;

      //     final route = FullScreenImage(
      //       altDescription: args.altDescription,
      //       name: args.name,
      //       userName: args.userName,
      //       key: args.key,
      //     );

      //     if (Platform.isAndroid)
      //       return MaterialPageRoute(
      //         builder: (context) => route,
      //       );
      //     else
      //       return CupertinoPageRoute(
      //         builder: (context) => route,
      //       );
      //   }
      // },
    )
  );
}