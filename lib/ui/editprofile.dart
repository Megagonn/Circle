// ignore_for_file: unnecessary_const

import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twit/firebase/post_method.dart';
import 'package:twit/ui/homepage.dart';
import 'package:twit/utilities/ui.utl.dart';

class Edit extends StatefulWidget {
  const Edit({Key? key, required this.map}) : super(key: key);
  final Map map;

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  XFile? image;
  // ImagePicker _picker = ImagePicker();
  Future pickImage(ImageSource source) async {
    try {
      image = await ImagePicker().pickImage(source: source);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    File file = File(image!.path);
    var pFile = !kIsWeb ?  FileImage(file) :  NetworkImage(image!.path) ;
    return pFile;
  }

  var pickedImage;

  @override
  Widget build(BuildContext context) {
    Map profile = widget.map;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Container(
            // height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Stack(
                    children: [
                      pickedImage != null
                          ? CircleAvatar(
                              radius: 80,
                              backgroundImage: pickedImage
                            )
                          : CircleAvatar(
                              radius: 80,
                            ),
                      Positioned(
                          top: 120,
                          right: 10,
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: const Icon(Icons.add_a_photo_outlined),
                                onPressed: () async {
                                  // await pickImage(source)
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          padding: const EdgeInsets.all(20),
                                          decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                FloatingActionButton(
                                                  heroTag: 'camera',
                                                  onPressed: () async {
                                                    pickedImage =
                                                        await pickImage(
                                                            ImageSource.camera);
                                                    setState(() {
                                                      pickedImage = pickedImage;
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Icon(
                                                    Icons.camera,
                                                    size: 34,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 40,
                                                ),
                                                FloatingActionButton(
                                                  heroTag: 'gallery',
                                                  onPressed: () async {
                                                    pickedImage =
                                                        await pickImage(
                                                            ImageSource
                                                                .gallery);
                                                    setState(() {
                                                      pickedImage = pickedImage;
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Icon(
                                                    Icons.image_outlined,
                                                    size: 34,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                              ))),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: firstName,
                    cursorColor: const Color(0xff002081),
                    // readOnly: true,
                    // obscureText: !showPassword,
                    decoration: InputDecoration(
                      hintText: profile['firstName'],
                      contentPadding: const EdgeInsets.all(8),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: lastName,
                    cursorColor: const Color(0xff002081),
                    // readOnly: true,
                    // obscureText: !showPassword,
                    decoration: InputDecoration(
                      hintText: profile['lastName'],
                      contentPadding: const EdgeInsets.all(8),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: userName,
                    cursorColor: const Color(0xff002081),
                    // readOnly: true,
                    // obscureText: !showPassword,
                    decoration: InputDecoration(
                      hintText: profile['username'],
                      contentPadding: const EdgeInsets.all(8),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                //   child: TextFormField(
                //     cursorColor: const Color(0xff002081),
                //     // obscureText: !showPassword,
                //     decoration: const InputDecoration(
                //       hintText: 'Name Name',
                //       contentPadding: EdgeInsets.all(8),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //         borderSide: BorderSide(
                //           color: Colors.blueAccent,
                //           width: 2,
                //         ),
                //       ),
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //         borderSide: BorderSide(
                //           color: Colors.grey,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: bio,
                    cursorColor: const Color(0xff002081),
                    maxLines: 5,
                    // maxLength: 300,
                    // obscureText: !showPassword,
                    decoration: InputDecoration(
                      hintText: profile['bio'].toString().isNotEmpty
                          ? profile['bio']
                          : 'Bio',
                      contentPadding: const EdgeInsets.all(8),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: phone,
                    cursorColor: const Color(0xff002081),
                    keyboardType: TextInputType.phone,
                    // obscureText: !showPassword,
                    decoration: InputDecoration(
                      hintText: profile['phone'].toString().isNotEmpty
                          ? profile['phone']
                          : 'Phone',
                      contentPadding: const EdgeInsets.all(8),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(10)),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                //   child: TextFormField(
                //     cursorColor: const Color(0xff002081),
                //     // obscureText: !showPassword,
                //     decoration: InputDecoration(
                //       hintText: profile['password'],
                //       contentPadding: const EdgeInsets.all(8),
                //       focusedBorder: const OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //         borderSide: BorderSide(
                //           color: Colors.blueAccent,
                //           width: 2,
                //         ),
                //       ),
                //       border: const OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //         borderSide: BorderSide(
                //           color: Colors.grey,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                //   child: TextFormField(
                //     controller: password,
                //     cursorColor: const Color(0xff002081),
                //     // obscureText: !showPassword,
                //     decoration: const InputDecoration(
                //       hintText: 'New password',
                //       contentPadding: EdgeInsets.all(8),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //         borderSide: BorderSide(
                //           color: Colors.blueAccent,
                //           width: 2,
                //         ),
                //       ),
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //         borderSide: BorderSide(
                //           color: Colors.grey,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                FlatBtn(
                  label: "Update",
                  onPress: () async {
                    String? postUrl;
                    if (pickedImage == null || pickedImage == '') {
                      if (kDebugMode) {
                        print('no file picked');
                      }
                    } else {
                      if (kDebugMode) {
                        print('a was file picked');
                      }
                      Reference imageRef = FirebaseStorage.instance
                          .ref()
                          .child('users_profile_pics')
                          .child(profile['uid']);

                      UploadTask upload =
                          imageRef.putData(pickedImage.readAsBytesSync());
                      TaskSnapshot snapShot = await upload;

                      postUrl = await snapShot.ref.getDownloadURL();
                    }
                    Map<String, Object> data = {
                      "firstName": firstName.text,
                      "lastName": lastName.text,
                      "phone": phone.text,
                      "password": password.text,
                      "bio": bio.text,
                      "userName": userName.text,
                      "photoUrl": postUrl!,
                    };
                    var response =
                        await PostMethods().updateProfile(profile['uid'], data);
                    // await FirebaseFirestore.instance
                    //     .collection('posts').;
                    if (response == "success") {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home(),
                              settings: RouteSettings(arguments: profile)));
                    }
                  },
                  color: Colors.blueAccent,
                  labelColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
