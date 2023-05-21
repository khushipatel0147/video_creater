import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_creater/provider/videoProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  VideoPlayer? providerF;
  VideoPlayer? providerT;

  @override
  Widget build(BuilCodeContextcontext) {
    providerF = Provider.of<VideoPlayer>(context, listen: false);
    providerT = Provider.of<VideoPlayer>(context, listen: true);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              elevation: 0,
              centerTitle: true,
              actions:[ Icon(Icons.music_note,size: 20,color: Colors.black,)],
              title: Text(
                "Video List",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 1,
                    color: Colors.white),
              ),
            ),
            body: ListView.builder(
              itemBuilder: (context, index) => myvideo(index),
              itemCount: providerF!.dataList.length,
            )));
  }

  Widget myvideo(int index) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
            onTap: () {
              providerF!.changeindex(index);
              Navigator.pushNamed(context, 'play', arguments: index);
            },
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 2)),
              child: Image.asset("${providerF!.dataList[index].photopath}"),
              margin: EdgeInsets.all(15),
            )));
  }
}
