import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

final _googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);

Future<UserCredential?> googleSignInFunc() async {
  try {
    if (kIsWeb) {
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithPopup(GoogleAuthProvider());
    }

    await signOutWithGoogle().catchError((_) => null);

    print('Starting Google Sign-In process...');
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser == null) {
      print('Google Sign-In was cancelled by user');
      return null;
    }

    print('Google Sign-In successful for: ${googleUser.email}');
    final GoogleSignInAuthentication auth = await googleUser.authentication;

    if (auth.idToken == null) {
      print('Error: ID token is null');
      return null;
    }

    final credential = GoogleAuthProvider.credential(
        idToken: auth.idToken, accessToken: auth.accessToken);

    print('Signing in to Firebase with Google credential...');
    return await FirebaseAuth.instance.signInWithCredential(credential);
  } catch (e) {
    print('Google Sign-In error: $e');
    if (e.toString().contains('10:')) {
      print('Error 10 detected - likely SHA-1 fingerprint mismatch');
      print(
          'Current debug SHA-1: 9b:bb:31:86:b2:18:9e:f1:6d:8f:27:2b:da:b5:93:62:c3:95:cb:b4');
      print('Please update Firebase Console with this SHA-1 fingerprint');
    }
    rethrow;
  }
}

Future signOutWithGoogle() => _googleSignIn.signOut();
