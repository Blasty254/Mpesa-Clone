import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final authControllerProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authNotifierProvider = StateNotifierProvider<AuthNotifier, User?>((ref) {
  return AuthNotifier(ref.watch(authControllerProvider));
});

class AuthNotifier extends StateNotifier<User?> {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool get isLoggedIn => state != null;

  String? get userDisplayName => state?.displayName;
  String? get userPhotoUrl => state?.photoURL;

  Future<String?> uploadProfileImage(File image) async {
    try {
      // Create a reference to the location where the image will be stored in Firebase Storage
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('profile_images/${state?.uid}.jpg'); // Using UID to store unique images per user

      // Upload the image to Firebase Storage
      await storageRef.putFile(image);

      // Get the download URL after the upload is complete
      return await storageRef.getDownloadURL();
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }

  // Update the user profile photo URL by first uploading the image
  void updateUserPhotoUrl(File image) async {
    if (state != null) {
      // Upload the image to Firebase Storage and get the download URL
      final String? downloadUrl = await uploadProfileImage(image);

      if (downloadUrl != null) {
        // Update the Firebase User profile with the new photo URL
        await state?.updatePhotoURL(downloadUrl);
        await refreshUser(); // Refresh user data to reflect changes
      }
    }
  }

  String? get userFirstName {
    final fullName = userDisplayName;
    if (fullName != null && fullName.isNotEmpty) {
      return fullName.split(' ').first;
    }
    return null;
  }

  AuthNotifier(this._auth) : super(null) {
    _initializeUser();
  }

  void _initializeUser() async {
    _auth.authStateChanges().listen((User? user) {
      state = user;
    });
  }

  Future<void> refreshUser() async {
    state = _auth.currentUser;
    await state?.reload();
    state = _auth.currentUser;
  }

  Future<bool> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      state = userCredential.user;
      return true;
    } on FirebaseAuthException catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return false; // user cancelled the sign in (to do = rearrange logic)
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      state = userCredential.user;
      return true;
    } catch (e) {
      print(e);
      print("Error signing in with Google : $e");
      return false;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    state = null;
  }
}
