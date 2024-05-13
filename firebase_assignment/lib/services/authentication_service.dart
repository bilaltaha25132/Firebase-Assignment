import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in with Google
  Future<User?> signInWithGoogle() async {
    try {
      // Trigger the Google Sign In flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        // Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        // Create a new credential
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in to Firebase with the Google credential
        final UserCredential userCredential = await _auth.signInWithCredential(credential);

        // Return the user from the userCredential
        return userCredential.user;
      }
    } catch (e) {
      print("Error signing in with Google: $e");
      return null;
    }
    return null;
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  String? getUserDisplayName(User user) {
    return user.displayName;
  }
}
