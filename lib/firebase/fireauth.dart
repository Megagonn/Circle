import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class FireAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String firstName, 
    required String lastName,
    Uint8List? image,
    String bio = '',
  }) async {
    String res = 'error';
    var userImage = image;
    String downloadedImage = '';
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (image != null) {
        Reference imageRef =
            _storage.ref().child('firebaseImage').child(cred.user!.uid);

        UploadTask upload = imageRef.putData(image);
        TaskSnapshot snapShot = await upload;

        downloadedImage = await snapShot.ref.getDownloadURL();
      }

      // add, set
      await _store.collection('users').doc(cred.user!.uid).set({
        'email': cred.user!.email,
        'photoUrl': image != null ? downloadedImage : userImage,
        'followings': [],
        'followers': [],
        'bio': bio,
        'uid': cred.user!.uid,
        'username': username
      });

      res = 'success';
    } on FirebaseAuthException catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<String> login({
    required String email,
    required String password,
  }) async {
    String res = 'error';
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      res = 'success';
    } on FirebaseAuthException catch (e) {
      res = e.toString();
    }

    return res;
  }

  signInWithGoogle() async {
    String res = 'error';
    try {
      if (kIsWeb) {
        GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
        _googleAuthProvider
            .addScope("https://www.googleapis.com/auth/contacts.readonly");

        await _auth.signInWithPopup(_googleAuthProvider);
      } else {
        GoogleSignInAccount? _googleSignIn = await GoogleSignIn().signIn();

        if (_googleSignIn != null) {
          GoogleSignInAuthentication authUser =
              await _googleSignIn.authentication;

          var realUser = GoogleAuthProvider.credential(
              accessToken: authUser.accessToken, idToken: authUser.idToken);

          UserCredential cred = await _auth.signInWithCredential(realUser);
        }
        // var googleSignIn = await GoogleAuthProvider.GOOGLE_SIGN_IN_METHOD;
      }

      res = 'success';
    } on FirebaseAuthException catch (e) {
      res = e.toString();
    }
  }
}
