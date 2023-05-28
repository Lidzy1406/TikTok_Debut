import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

import '../../constants.dart';
import 'addcaption_screen.dart';

class addVideoScreen extends StatelessWidget {
 addVideoScreen
({super.key});
videoPick(ImageSource src , BuildContext context) async{
  final video  = await ImagePicker().pickVideo(source: src);
  if(video != null){
    Get.snackbar("Video Selected", video.path);
    Navigator.push(context, MaterialPageRoute(builder: (context)=> addCaption_Screen(videoFile: File(video.path), videoPath: video.path)));

  }else{
    Get.snackbar("Error In Selecting Video", "Please Choose A Different Video File");
  }
}

  showDialogOpt(BuildContext context){
     return showDialog(context: context, builder: (context)=>
     SimpleDialog(
       children: [
         SimpleDialogOption(
           onPressed: ()=>videoPick(ImageSource.gallery , context),
            child: const Icon(Icons.video_library),
         ),
         SimpleDialogOption(
           onPressed: ()=>videoPick(ImageSource.camera , context),
          child: const Icon(Icons.camera_alt),
         ),
         SimpleDialogOption(
           onPressed: (){
             Navigator.pop(context);
           },
         child: const Icon(Icons.close_outlined),
         )
       ],
     ));
   }


  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 20.0,
        bottom: 20.0,
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () => showDialogOpt(context),
          child: Icon(Icons.add),
        ),
      );
  }
}