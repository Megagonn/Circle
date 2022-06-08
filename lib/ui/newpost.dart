import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twit/firebase/post_method.dart';
import 'package:twit/ui/homepage.dart';
// import 'package:twit/utilities/imagepicker.dart';
// import 'package:twit/utilities/ui.utl.dart';
// import 'package:uuid/uuid.dart';

var pickedImage;

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  TextEditingController controller = TextEditingController();
  bool showSourceOption = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // PostMethods().readPosts();
  }

  @override
  Widget build(BuildContext context) {
    Map profile = ModalRoute.of(context)!.settings.arguments as Map;
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: !showSourceOption
            ? FloatingActionButton(
                heroTag: '1',
                onPressed: () {
                  showSourceOption = !showSourceOption;
                  setState(() {});
                  // chooseLocation(context);
                },
                child: const Icon(Icons.add_a_photo_outlined),
              )
            : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                FloatingActionButton(
                  heroTag: '2',
                  onPressed: () async {
                    showSourceOption = !showSourceOption;
                    pickedImage = await pickImage(ImageSource.camera);
                    setState(() {});
                    // chooseLocation(context);
                  },
                  child: const Icon(
                    Icons.camera_outlined,
                    size: 34,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                FloatingActionButton(
                  heroTag: '3',
                  onPressed: () async {
                    showSourceOption = !showSourceOption;
                    pickedImage = await pickImage(ImageSource.gallery);
                    setState(() {});
                    // chooseLocation(context);
                  },
                  child: const Icon(
                    Icons.photo_outlined,
                    size: 34,
                  ),
                )
              ]),
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
                                pickedImage = null;
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close_outlined,
                                  color: Colors.blueAccent),
                            ),
                            InkWell(
                              onTap: () async {
                                // print(profile);
                                if (controller.text.isNotEmpty ||
                                    pickedImage != null) {
                                  var res = await PostMethods().addPost(
                                    uid: profile['uid'],
                                    username: profile['username'],
                                    profileImg: profile['photoUrl'] ?? '',
                                    text: controller.text,
                                    file: pickedImage,
                                    firstName: profile['firstName'],
                                    lastName: profile['lastName'],
                                  );
                                  print('res in newpost is $res');
                                  if (res == 'success') {
                                    pickedImage = null;
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const Home(),
                                            settings: RouteSettings(
                                                arguments: profile)));
                                  }
                                }
                              },
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
                            Expanded(
                              flex: 5,
                              child: TextField(
                                controller: controller,
                                maxLines: 6,
                                maxLength: 250,
                                decoration: const InputDecoration(
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
                          child: pickedImage != null
                              ? Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.red,
                                    image: pickedImage == null
                                        ? null
                                        : DecorationImage(
                                            image: FileImage(pickedImage!),
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                )
                              : null,
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

  XFile? image;
  // ImagePicker _picker = ImagePicker();
  Future pickImage(ImageSource source) async {
    try {
      image = await ImagePicker().pickImage(source: source);
    } on PlatformException catch (e) {
      print(e.toString());
    }
    File file = File(image!.path);
    return file;
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
        padding: const EdgeInsets.all(14),
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
                  pickedImage = await pickImage(ImageSource.camera);
                  setState(() {});
                  Navigator.pop(context);
                },
                child: Column(
                  children: const [
                    Expanded(
                      child: Icon(Icons.camera_outlined,
                          size: 60, color: Colors.blueAccent),
                    ),
                    Text(
                      "Camera",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () async {
                  pickedImage = await pickImage(ImageSource.gallery);
                  setState(() {});
                  Navigator.pop(context);
                },
                child: Column(
                  children: const [
                    Expanded(
                      child: Icon(Icons.image_outlined,
                          size: 60, color: Colors.blueAccent),
                    ),
                    Text(
                      "Gallery",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
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
