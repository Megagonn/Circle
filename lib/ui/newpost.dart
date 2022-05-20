import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
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

  // String imagePreview(){
  //   Image.file(File(_imageFileList![index].path)),
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            chooseLocation(context);
            // pickImage(ImageSource.gallery);
            // image = await _picker.pickImage(source: ImageSource.gallery);
          },
          child: const Icon(Icons.add_a_photo_outlined),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.close_outlined,
                                    color: Colors.blueAccent),),
                            InkWell(
                              onTap: (){},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 15),
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  "Circulate",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/img2.jpeg'),
                                  ),
                                )
                              ],
                            ),
                            const Expanded(
                              flex: 5,
                              child: TextField(
                                maxLines: 6,
                                maxLength: 250,
                                decoration: InputDecoration(
                                  hintText: "What's happening?",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 50,
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(top: 5),
                            // padding: const EdgeInsets.only(left: 50,),
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                              image: const DecorationImage(
                                image: AssetImage('assets/img2.jpeg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
