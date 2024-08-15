import 'package:firebase_auth/firebase_auth.dart';
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
