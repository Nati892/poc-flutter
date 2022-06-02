import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostScreenImagePicker extends StatefulWidget {
  const PostScreenImagePicker({Key? key}) : super(key: key);

  @override
  State<PostScreenImagePicker> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreenImagePicker> {
  XFile? PickedImage;
  
  bool isFileimage = true;

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: TakePicture,
          child: Text("take picture"),
        ),
        TextButton(onPressed: TakeVideo, child: Text("take videoF")),
        if (PickedImage != null && isFileimage)
          Center(
            child: Image.file(
              File(PickedImage!.path),
            ),
          ),
          if(PickedImage!=null && !isFileimage)
          Center(child: Text("took video"),)

      ],
    ))));
  }

  // Future<CameraDescription> setupCamera() async {
  //   final cameras = await availableCameras();
  //   final firstCamera = cameras.first;
  //   return firstCamera;
  // }

  Future TakePicture() async {
    try {
      final  image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = image.path;
      setState(() {
        PickedImage =XFile( imageTemp);
        isFileimage = true;
      });
    } catch (e) {}
  }

  Future TakeVideo() async {
    try {
      final video = await ImagePicker().pickVideo(source: ImageSource.camera);
      if (video == null) return;
      final imageTemp = video.path;
      setState(() {
        PickedImage = XFile( imageTemp);
        isFileimage = false;
      });
    } catch (e) {}
  }
}
