// // ignore_for_file: avoid_print

// import 'dart:typed_data';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flufire/Test/model/model.dart';
// import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';

// class PostMethods {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;

//   Future<String> addPost(
//       {String text = '',
//       Uint8List? file,
//       required String uid,
//       required String username,
//       required String profileImg}) async {
//     String res = "some error occur";
//     String postId = const Uuid().v1();
//     try {
//       String? postUrl;
//       if (file != null) {
//         Reference imageRef =
//             _storage.ref().child('firebaseImage').child('post');

//         UploadTask upload = imageRef.putData(file);
//         TaskSnapshot snapShot = await upload;

//         postUrl = await snapShot.ref.getDownloadURL();
//       }

//       Post post = Post(
//           text: text,
//           uid: uid,
//           postId: postId,
//           username: username,
//           datePublished: DateTime.now(),
//           postUrl: postUrl ?? '',
//           profileImg: profileImg,
//           likes: []);

//       await _firestore.collection('posts').doc(postId).set(post.toJson());

//       res = 'success';
//     } catch (e) {
//       return e.toString();
//     }

//     return res;
//   }




//   Future<void> likePost(String postId, String uid, List likes) async {
//     try {
//       if (likes.contains(uid)) {
//         await _firestore.collection('posts').doc(postId).update({
//           "likes": FieldValue.arrayRemove([uid])
//         });
//       } else {
//         await _firestore.collection('posts').doc(postId).update({
//           "likes": FieldValue.arrayUnion([uid])
//         });
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Future<void> postComment(String postId, String text, String uid, String name,
//       String profilePic) async {
//     try {
//       String commentId = const Uuid().v1();
//       if (text.isNotEmpty) {
//         await _firestore
//             .collection("posts")
//             .doc(postId)
//             .collection('comments')
//             .doc(commentId)
//             .set({
//           "profilePic": profilePic,
//           "name": name,
//           "uid": uid,
//           "text": text,
//           "commentId": commentId,
//           "datePublished": DateTime.now()
//         });
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Future<void> deletePost(String postId) async {
//     try {
//       await _firestore.collection("posts").doc(postId).delete();
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Future<void> followUser(String uid, String followId) async {
//     try {
//       DocumentSnapshot<dynamic> snap =
//           await _firestore.collection('users').doc(uid).get();

//       List following = snap.data()!['following'];

//       if (following.contains(followId)) {
//         await _firestore.collection('users').doc(followId).update({
//           "followers": FieldValue.arrayRemove([uid])
//         });
//         await _firestore.collection('users').doc(uid).update({
//           "following": FieldValue.arrayRemove([followId])
//         });
//       } else {
//         await _firestore.collection('users').doc(uid).update({
//           "following": FieldValue.arrayUnion([followId])
//         });
//         await _firestore.collection('users').doc(followId).update({
//           "followers": FieldValue.arrayUnion([uid])
//         });
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Future<void> likeComment(postId, commentId, uid, likes) async {
//     try {
//       if (likes.contains(uid)) {
//         await _firestore
//             .collection('posts')
//             .doc(postId)
//             .collection("comments")
//             .doc(commentId)
//             .update({
//           "likes": FieldValue.arrayRemove([uid])
//         });
//       } else {
//         await _firestore
//             .collection('posts')
//             .doc(postId)
//             .collection("comments")
//             .doc(commentId)
//             .update({
//           "likes": FieldValue.arrayUnion([uid])
//         });
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Future<void> signOut() async {
//     await _auth.signOut();
//   }
// }






// //  Future<String> signUpUser(
// //       {required String email,
// //       required String password,
// //       required String username,
// //       required String bio,
// //       required Uint8List file}) async {
// //     String res = "Some error occur";
// //     try {

// //       if (email.isNotEmpty &&
// //           password.isNotEmpty &&
// //           username.isNotEmpty &&
// //           bio.isNotEmpty &&      
// //           file != null) {
// //         UserCredential cred = await _auth.createUserWithEmailAndPassword(
// //             email: email, password: password);
    
// //         String photoUrl = await StorageMethods()
// //             .uploadImageToStorage("profilePicture", file, false);

// //         model.User  user = model.User(email: email, uid:cred.user!.uid, photoUrl: photoUrl, username: username, bio: bio, followers: [], following: []);
// //         await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson());
// //         res = "success";
// //       }
// //     }
// //      catch (e) {
// //       res = e.toString();
// //     }

// //     return res;
// //   }