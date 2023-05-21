import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_creater/provider/videoProvider.dart';
import 'package:video_creater/view/homeScreen.dart';
import 'package:video_creater/view/playScreen.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => VideoPlayer())],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeScreen(),
        'play': (context) => PlayScreen(),
      },
    ),
  ));
}
