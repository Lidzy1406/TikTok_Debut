// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:video_player/video_player.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class VideoPickerScreen extends StatefulWidget {
//   const VideoPickerScreen ({super.key});
//   @override
//   _VideoPickerScreenState createState() => _VideoPickerScreenState();
// }

// class _VideoPickerScreenState extends State<VideoPickerScreen> {
  
//   VideoPlayerController? _videoPlayerController;
//   File? _videoFile;
//   final picker = ImagePicker();
//   String? _selectedLanguage;
//   Future<void> _pickVideoFromGallery() async {
//     final pickedFile = await picker.getVideo(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _videoFile = File(pickedFile.path);
//         _videoPlayerController = VideoPlayerController.file(_videoFile!);
//       });
//       _videoPlayerController!.initialize();
//       _videoPlayerController!.play();
//     }
//   }

//   Future<void> _pickVideoFromCamera() async {
//     final pickedFile = await picker.getVideo(source: ImageSource.camera);
//     if (pickedFile != null) {
//       setState(() {
//         _videoFile = File(pickedFile.path);
//         _videoPlayerController = VideoPlayerController.file(_videoFile!);
//       });
//       _videoPlayerController!.initialize();
//       _videoPlayerController!.play();
//     }
//   }
//   Future _getVideo(ImageSource source) async {
//     final pickedFile = await picker.getVideo(source: source);

//     setState(() {
//       if (pickedFile != null) {
//         _video = File(pickedFile.path);
//         _controller = VideoPlayerController.file(_video!);
//         _controller!.addListener(_listener!);
//         _controller!.setLooping(true);
//         _controller!.initialize().then((_) {
//         _controller!.play();
//         });
//       } else {
//         print('No video selected.');
//       }
//     });
//   }

//   Future Valide() async {
//     try {
//       final usersRef = FirebaseFirestore.instance.collection('post');
//       final Reference storageReference = FirebaseStorage.instance
//           .ref()
//           .child('/video/${_video?.path.split('/').last}');
//       final UploadTask uploadTask = storageReference.putFile(_videoFile!!);

//       final TaskSnapshot storageTaskSnapshot =
//           await uploadTask.whenComplete(() => null);
//       final String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();

//       await usersRef.doc().set({
//         'idpost': downloadUrl,
//         'description': DescriptionController.text.trim(),
//         'pathvideo': downloadUrl,
//         'nombreslikes': 0,
//         'category': _selectedLanguage,
//         'name': '',
//         'createdAt': '',
//         'uiduser': 'MvP0dQ4pjeTxdXmZ2EdDokG5pT62',
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('nouveau post ajouter'),
//         ),
//       );
//     } on FirebaseAuthException catch (e) {
//       print('error failed : $e');
//     }
//   }


//   @override
//   void dispose() {
//     super.dispose();
//     _videoPlayerController!.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,

//       appBar: AppBar(
//         title: Text('add videos'),
//         backgroundColor: Color.fromARGB(255, 49, 48, 48),
        
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (_videoPlayerController != null)
//               AspectRatio(
//                 aspectRatio: _videoPlayerController!.value.aspectRatio,
//                 child: VideoPlayer(_videoPlayerController!),
//               ),
              
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
//               child: DropdownButtonFormField(
//                 decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: "categorie de video"),
                    
//                 value: _selectedLanguage,
//                 onChanged: (newValue) {
//                   setState(() {
//                     _selectedLanguage = newValue;
//                   });
//                 },
//                 items: [
//                   DropdownMenuItem(
//                     value: "lu",
//                     child: Text("Ludique"),
//                   ),
//                   DropdownMenuItem(
//                     value: "sc",
//                     child: Text("Scolaire"),
//                   ),
//                   DropdownMenuItem(
//                     value: "mo",
//                     child: Text("motivation"),
//                   ),
//                   DropdownMenuItem(
//                     value: "co",
//                     child: Text("Comedie"),
//                   ),
//                 ],
//               ),
//             ),
//             Row(
//                mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 FloatingActionButton(
//                   backgroundColor:Colors.black,
//                   onPressed: _pickVideoFromGallery,
//                   child: Icon(Icons.video_library),
                 
//                 ),
//                 FloatingActionButton(
//                   backgroundColor:Colors.black,
//                   onPressed: _pickVideoFromCamera,
//                   child: Icon(Icons.camera_alt),
//                 ),
//                  FloatingActionButton(
//                   backgroundColor:Colors.black,
//                   onPressed: _pickVideoFromCamera,
//                   child:  Icon( Icons.category_outlined,), 
                  
//                  ),
//               ],
              
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPage();
}

class _AddPage extends State<AddPage> {
  Color mainColor = const Color.fromARGB(255, 0, 0, 0);
  File? _video;
  final picker = ImagePicker();
  String? _selectedLanguage;
  VideoPlayerController? _controller;
  VoidCallback? _listener;
  TextEditingController DescriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _listener = () {
      setState(() {});
    };
  }

  Future _getVideo(ImageSource source) async {
    final pickedFile = await picker.getVideo(source: source);

    setState(() {
      if (pickedFile != null) {
        _video = File(pickedFile.path);
        _controller = VideoPlayerController.file(_video!);
        _controller!.addListener(_listener!);
        _controller!.setLooping(true);
        _controller!.initialize().then((_) {
          _controller!.play();
        });
      } else {
        print('No video selected.');
      }
    });
  }

  Future Valide() async {
    try {
      final usersRef = FirebaseFirestore.instance.collection('post');
      final Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('/video/${_video?.path.split('/').last}');
      final UploadTask uploadTask = storageReference.putFile(_video!);

      final TaskSnapshot storageTaskSnapshot =
          await uploadTask.whenComplete(() => null);
      final String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();

      await usersRef.doc().set({
        'idpost': downloadUrl,
        'description': DescriptionController.text.trim(),
        'pathvideo': downloadUrl,
        'nombreslikes': 0,
        'category': _selectedLanguage,
        'name': '',
        'createdAt': '',
        'uiduser': 'MvP0dQ4pjeTxdXmZ2EdDokG5pT62',
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('new post added'),
        ),
      );
    } on FirebaseAuthException catch (e) {
      print('error failed : $e');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.removeListener(_listener!);
    _controller?.dispose();
  }
@override
  Widget build(BuildContext context) {
    var _selectedOption;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          "Add Videos",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          
            Container(
              height: 350,
              color: Color.fromARGB(240, 48, 48, 48),
              child: _controller != null && _controller!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    )
                  : Center(
                      child: Text(
                        '',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () => _getVideo(ImageSource.camera),
                  icon: Icon(Icons.camera_alt),
                  label: Text('camera'),
                ),
                ElevatedButton.icon(
                  onPressed: () => _getVideo(ImageSource.gallery),
                  icon: Icon(Icons.video_library),
                  label: Text('gallery'),
                ),
              ],
            ),
            SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "category"),
                value: _selectedLanguage,
                onChanged: (newValue) {
                  setState(() {
                    _selectedLanguage = newValue;
                  });
                },
                items: [
                  DropdownMenuItem(
                    value: "danse",
                    child: Text("danse"),
                  ),
                  DropdownMenuItem(
                    value: "acedemique",
                    child: Text("academique"),
                  ),
                  DropdownMenuItem(
                    value: "motivation",
                    child: Text("motivation"),
                  ),
                  DropdownMenuItem(
                    value: "comedie",
                    child: Text("Comedie"),
                  ),
                   DropdownMenuItem(
                    value: "nourriture",
                    child: Text("nourriture"),
                  ),
                   DropdownMenuItem(
                    value: "voyage",
                    child: Text("voyage"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: TextFormField(
                controller: DescriptionController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: " description"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {},
      
                  child: const Text(
                    "cancel",
                    style: TextStyle(
                      color: Colors.white,
),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Valide();
                    
                  },
                  child: const Text(
                    "submit",
                    style: TextStyle(
                      color: Colors.white,
                      
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

