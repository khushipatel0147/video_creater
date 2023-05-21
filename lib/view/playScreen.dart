import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_creater/provider/videoProvider.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  VideoPlayer? providerF;
  VideoPlayer? providerT;

  @override
  void initState() {
    super.initState();
    Provider.of<VideoPlayer>(context, listen: false).changeVideo();
  }
  @override
  Widget build(BuildContext context) {
    int io=ModalRoute.of(context)!.settings.arguments as int;
    providerF = Provider.of<VideoPlayer>(context, listen: false);
    providerT = Provider.of<VideoPlayer>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        title: Text(
          "Video Screen",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 1,
              color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 80),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 350,
              width: double.infinity,
              child: Consumer<VideoPlayer>(
                builder: (context, value, child) => Chewie(
                  controller: providerT!.chewieController!,
                ),
              ),
            ),
          ),
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 50,width: double.infinity,
              decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 1)),
              child: Center(
                child: Text(
                  "${providerF!.dataList[io].name}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      letterSpacing: 1,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
