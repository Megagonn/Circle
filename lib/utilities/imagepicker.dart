import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

/// Image pickers class
/// It has method [pickImage] that takes [ImageSource] as parameter
class PickImage {
  XFile? image;
  // ImagePicker _picker = ImagePicker();
  Future pickImage(ImageSource source) async {
    try {
      image = await ImagePicker().pickImage(source: source);
    } on PlatformException catch (e) {
      print(e.toString());
    }
    // setState(() async {
    //   image = await ImagePicker().pickImage(source: ImageSource.gallery);
    // });
    // return image;
  }

  /// This function allows user to either select image from gallery or
  /// camera
  chooseLocation(context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      elevation: 4,
      enableDrag: true,
      context: context,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white,
        ),
        height: 100,
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () async {
                  await pickImage(ImageSource.camera);
                },
                child: Column(
                  children: const [
                    Expanded(
                        child: Icon(Icons.camera_outlined,
                            size: 80, color: Colors.blueAccent)),
                    Text("Camera")
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () async {
                  await pickImage(ImageSource.gallery);
                },
                child: Column(
                  children: const [
                    Expanded(
                        child: Icon(Icons.image_outlined,
                            size: 80, color: Colors.blueAccent)),
                    Text("Gallery")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}