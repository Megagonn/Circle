import 'dart:io';

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
      print(e.toString());
    }
    File file = File(image!.path);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    Map profile = widget.map;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Stack(
                    children: [
                      const CircleAvatar(
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
                    readOnly: true,
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
                    readOnly: true,
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
                    readOnly: true,
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    cursorColor: const Color(0xff002081),
                    // obscureText: !showPassword,
                    decoration: const InputDecoration(
                      hintText: 'Name Name',
                      contentPadding: EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                      ),
                      border: OutlineInputBorder(
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
                    controller: bio,
                    cursorColor: const Color(0xff002081),
                    maxLines: 5,
                    // maxLength: 300,
                    // obscureText: !showPassword,
                    decoration: const InputDecoration(
                      hintText: 'Bio',
                      contentPadding: EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                      ),
                      border: OutlineInputBorder(
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
                    controller: phone,
                    cursorColor: const Color(0xff002081),
                    // obscureText: !showPassword,
                    decoration: const InputDecoration(
                      hintText: 'Phone Contact',
                      contentPadding: EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                      ),
                      border: OutlineInputBorder(
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
                    cursorColor: const Color(0xff002081),
                    // obscureText: !showPassword,
                    decoration: const InputDecoration(
                      hintText: 'Current password',
                      contentPadding: EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                      ),
                      border: OutlineInputBorder(
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
                    controller: password,
                    cursorColor: const Color(0xff002081),
                    // obscureText: !showPassword,
                    decoration: const InputDecoration(
                      hintText: 'New password',
                      contentPadding: EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                FlatBtn(
                  label: "Update",
                  onPress: () async {
                    Map<String, Object> data = {
                      "firstName": firstName.text,
                      "lastName": lastName.text,
                      "phone": phone.text,
                      "password": password.text,
                      "bio": bio.text,
                      "userName": userName.text,
                    };
                    var response =
                        await PostMethods().updateProfile(profile['uid'], data);
                    if (response == "success") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home(), settings: RouteSettings(arguments: profile)));
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
