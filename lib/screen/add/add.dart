import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_storage/firebase_storage.dart';

class VideoPickerScreen extends StatefulWidget {
  const VideoPickerScreen ({super.key});
  @override
  _VideoPickerScreenState createState() => _VideoPickerScreenState();
}

class _VideoPickerScreenState extends State<VideoPickerScreen> {
  
  VideoPlayerController? _videoPlayerController;
  File? _videoFile;
  final picker = ImagePicker();

  Future<void> _pickVideoFromGallery() async {
    final pickedFile = await picker.getVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _videoFile = File(pickedFile.path);
        _videoPlayerController = VideoPlayerController.file(_videoFile!);
      });
      _videoPlayerController!.initialize();
      _videoPlayerController!.play();
    }
  }

  Future<void> _pickVideoFromCamera() async {
    final pickedFile = await picker.getVideo(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _videoFile = File(pickedFile.path);
        _videoPlayerController = VideoPlayerController.file(_videoFile!);
      });
      _videoPlayerController!.initialize();
      _videoPlayerController!.play();
    }
  }
  @override
  void dispose() {
    super.dispose();
    _videoPlayerController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text('add videos'),
        backgroundColor: Color.fromARGB(255, 49, 48, 48),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_videoPlayerController != null)
              AspectRatio(
                aspectRatio: _videoPlayerController!.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController!),
              ),
              
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  backgroundColor:Colors.black,
                  onPressed: _pickVideoFromGallery,
                  child: Icon(Icons.video_library),
                 
                ),
                FloatingActionButton(
                  backgroundColor:Colors.black,
                  onPressed: _pickVideoFromCamera,
                  child: Icon(Icons.camera_alt),
                ),
                 FloatingActionButton(
                  backgroundColor:Colors.black,
                  onPressed: _pickVideoFromCamera,
                  child:  Icon( Icons.category_outlined,), 
                  
                 ),
              ],
              
            ),
          ],
        ),
      ),
    );
  }
}

// class  AddPage extends StatefulWidget {
//   const AddPage({super.key});

//   @override
//   State<AddPage> createState() => _AddPageState();
// }

// class _AddPageState extends State<AddPage> {
//   Color mainColor = Color.fromARGB(255, 49, 48, 48);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: mainColor,
//         title: Text(
//           "Add",
//           style: TextStyle(
//             color: Color.fromARGB(255, 248, 246, 246),
//             fontSize: 22.5,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.more_vert,
//               color: Colors.black,
//             ),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Center(
//         child: Text(" Add"),
//       ),
//     );
//   }
// }
