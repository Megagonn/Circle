// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:twit/model/post.dart';
import 'package:uuid/uuid.dart';

class PostMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> addPost({
    String text = '',
    var file,
    required String uid,
    required String username,
    required String firstName,
    required String lastName,
    required String profileImg,
  }) async {
    String res = "some error occur";
    String postId = const Uuid().v1();
    var uint8list;
    if (file == '' || file == null) {
      uint8list = '';
    } else {
      uint8list = file.readAsBytesSync();
    }
    try {
      String? postUrl;
      if (file == null || file == '') {
        print('no file picked');
      } else {
        print('a was file picked');
        Reference imageRef = _storage.ref().child('circleImages').child(postId);

        UploadTask upload = imageRef.putData(uint8list);
        TaskSnapshot snapShot = await upload;

        postUrl = await snapShot.ref.getDownloadURL();
      }

      Post post = Post(
        text: text,
        uid: uid,
        postId: postId,
        username: username,
        dateTime: DateTime.now(),
        postURL: postUrl ?? '',
        profileImage: profileImg,
        like: [],
        repost: [],
        comment: [],
        firstName: firstName,
        lastName: lastName,
      );

      await _firestore.collection('posts').doc(postId).set(post.toJson());

      /// Adding each user's post to the each user's document.
      // try {
      //   Iterable<QueryDocumentSnapshot<Map<String, dynamic>>> posts = [];
      //   await _firestore.collection('posts').get().then((value) {
      //     List<QueryDocumentSnapshot<Map<String, dynamic>>> userPosts =
      //         value.docs;
      //     posts = userPosts.where((data) => uid == data.data()['uid']);
      //   });
      //   await _firestore.collection('users').doc(uid).update({'posts': posts});
      // } on FirebaseException catch (e) {
      //   // TODO
      //   print(e.toString());
      // }

      res = 'success';
    } catch (e) {
      res = "some error occured!";
      return e.toString();
    }
    print('res is function is $res');
    return res;
  }

  Future<List<dynamic>> readPosts() async {
    QuerySnapshot<Map<String, dynamic>> postList =
        await _firestore.collection('posts').get();
    var allPost = [...postList.docs];
    var refinedpost = [];
    for (var i = 0; i < allPost.length; i++) {
      refinedpost.add(allPost[i].data());
    }
    // print(refinedpost);
    // print(refinedpost.length);

    // Uint8List? postImages =
    //     await _storage.ref().child('firebaseImage').child('post').getData();

    // print(postImages);

    ///{uid: 013d0520-e0c8-11ec-a8f8-e7f9205c2f2a, postUrl: https://firebasestorage.googleapis.com/v0/b/circles-762a7.appspot.com/o/firebaseImage%2Fpost?alt=media&token=8ebcd277-242e-4b97-9863-f815ec472aaa, comment: [], text: This is my first post. , postId: 013d5340-e0c8-11ec-8b94-41714da1f2f0, userName: @meg, profileImg: profileImg, likes: []}
    return refinedpost;
  }

  Future<bool> likePost(String postId, String uid, List likes) async {
    bool liked = false;
    print(likes);
    try {
      if (likes.contains(uid)) {
        await _firestore.collection('posts').doc(postId).update({
          "likes": FieldValue.arrayRemove([uid])
        });
      } else {
        await _firestore.collection('posts').doc(postId).update({
          "likes": FieldValue.arrayUnion([uid])
        });
      }
      liked = true;
    } catch (e) {
      liked = false;
      print(e.toString());
    }
    return liked;
  }

  Future<void> postComment(String postId, String text, String uid, String name,
      String userName, String profilePic) async {
    try {
      String commentId = const Uuid().v1();
      if (text.isNotEmpty) {
        var post = await _firestore.collection("posts").doc(postId).get();
        List previousComment = post.data()!['comment'];
        await _firestore.collection("posts").doc(postId).update({
          'comment': [
            ...previousComment,
            {
              "profilePic": profilePic,
              "name": name,
              "userName": userName,
              "uid": uid,
              "text": text,
              "commentId": commentId,
              "datePublished": DateTime.now()
            }
          ]
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<dynamic> readpostComments(postId) async {
    var allposts = await _firestore.collection('posts').get();
    var post = allposts.docs.where((element) => element.id == postId).first;
    var comments = post.data()['comment'];
    // print(post);
    // print(comments);
    return comments;
  }
  // Future<dynamic> readpostComments(postId) async {
  //   var list = [];
  //   Map? map = {};
  //   var currentPost = _firestore
  //       .collection('posts')
  //       .doc(postId)
  //       .snapshots()
  //       .forEach((element) {
  //     map = element.data();
  //   list = map!['comment'];
  //   });
  //   // var currentPostComments = currentPost.single;
  //   // currentPostComments.then((value) {
  //   //   list = [...value.data()!['comment']];
  //   //   print('this is value :${value.data()!['comment']}');
  //   //   // return value;
  //   print(list);
  //   return list;
  //   // });
  // }

  Future<void> deletePost(String postId) async {
    try {
      await _firestore.collection("posts").doc(postId).delete();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> followUser(String uid, String followId) async {
    try {
      DocumentSnapshot<dynamic> snap =
          await _firestore.collection('users').doc(uid).get();

      List following = snap.data()!['following'];

      if (following.contains(followId)) {
        await _firestore.collection('users').doc(followId).update({
          "followers": FieldValue.arrayRemove([uid])
        });
        await _firestore.collection('users').doc(uid).update({
          "following": FieldValue.arrayRemove([followId])
        });
      } else {
        await _firestore.collection('users').doc(uid).update({
          "following": FieldValue.arrayUnion([followId])
        });
        await _firestore.collection('users').doc(followId).update({
          "followers": FieldValue.arrayUnion([uid])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> likeComment(postId, commentId, uid, likes) async {
    try {
      if (likes.contains(uid)) {
        await _firestore
            .collection('posts')
            .doc(postId)
            .collection("comments")
            .doc(commentId)
            .update({
          "likes": FieldValue.arrayRemove([uid])
        });
      } else {
        await _firestore
            .collection('posts')
            .doc(postId)
            .collection("comments")
            .doc(commentId)
            .update({
          "likes": FieldValue.arrayUnion([uid])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}






//  Future<String> signUpUser(
//       {required String email,
//       required String password,
//       required String username,
//       required String bio,
//       required Uint8List file}) async {
//     String res = "Some error occur";
//     try {

//       if (email.isNotEmpty &&
//           password.isNotEmpty &&
//           username.isNotEmpty &&
//           bio.isNotEmpty &&      
//           file != null) {
//         UserCredential cred = await _auth.createUserWithEmailAndPassword(
//             email: email, password: password);
    
//         String photoUrl = await StorageMethods()
//             .uploadImageToStorage("profilePicture", file, false);

//         model.User  user = model.User(email: email, uid:cred.user!.uid, photoUrl: photoUrl, username: username, bio: bio, followers: [], following: []);
//         await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson());
//         res = "success";
//       }
//     }
//      catch (e) {
//       res = e.toString();
//     }

//     return res;
//   }