import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_creater/modal/dataModal.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends ChangeNotifier {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  List<DataModal> dataList = [
    DataModal(
        name: "Apna Bana  Le",
        path: "assets/video/Apna_Bana_Le.mp4",
        photopath: "assets/images/Apna_Bana_Le.jpg"),
    DataModal(
        name: "Barbaadiyan",
        path: "assets/video/Barbaadiyan.mp4",
        photopath: "assets/images/Barbaadiyan.jpg"),
    DataModal(
        name: "Jhoome jo Pathaan",
        path: "assets/video/Jhoome_Jo_Pathaan.mp4",
        photopath: "assets/images/Jhoome_Jo_Pathaan.jpg"),
    DataModal(
        name: "Kesariya",
        path: "assets/video/Kesariya.mp4",
        photopath: "assets/images/Kesariya.jpg"),
    DataModal(
        name: "Mehabooba",
        path: "assets/video/Mehabooba.mp4",
        photopath: "assets/images/Mehabooba.jpg"),
    DataModal(
        name: "Mere Raske Qamar",
        path: "assets/video/Mere-Rashke_Qamar.mp4",
        photopath: "assets/images/Mere-Rashke_Qamar.jpg"),
    DataModal(
        name: "Ooo Bedardeya",
        path: "assets/video/O_Bedardeya.mp4",
        photopath: "assets/images/O_Bedardeya.jpg"),
  ];

  void changeVideo() {
    videoPlayerController = VideoPlayerController.asset("${dataList[videoindex].path}");
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        autoPlay: true,
        materialProgressColors: ChewieProgressColors(
          backgroundColor: Colors.white,
          playedColor: Colors.white,
          handleColor: Colors.white
        ));
    notifyListeners();
  }
  int videoindex=0;
  void changeindex(int index)
  {
    videoindex=index;
    notifyListeners();
  }
}
