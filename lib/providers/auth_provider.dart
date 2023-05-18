
import 'package:firebase_auth/firebase_auth.dart';



class AuthProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      // Do something with the signed-in user
      print('Signed in: ${user?.uid}');
      return user;
    } catch (e) {
      // Handle sign-in errors
      print('Sign-in error: $e');
      return null;
    }
  }

  // Sign up with email and password
  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      // Do something with the newly signed-up user
      print('Signed up: ${user?.uid}');
      return user;
    } catch (e) {
      // Handle sign-up errors
      print('Sign-up error: $e');
      return null;
    }
  }

// Sign in with Google
  // Future<User?> signInWithGoogle() async {
  //   try {
  //     // Set up Google Sign-In configuration
  //     final GoogleSignIn googleSignIn = GoogleSignIn();
  //     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  //     final GoogleSignInAuthentication googleAuth = await googleUser?.authentication;
  //
  //     // Sign in with Firebase using Google credentials
  //     final UserCredential userCredential = await _firebaseAuth.signInWithCredential(
  //       GoogleAuthProvider.credential(
  //         idToken: googleAuth.idToken,
  //         accessToken: googleAuth.accessToken,
  //       ),
  //     );
  //     final User? user = userCredential.user;
  //     // Do something with the signed-in user
  //     print('Signed in with Google: ${user?.uid}');
  //     return user;
  //   } catch (e) {
  //     // Handle sign-in errors
  //     print('Google sign-in error: $e');
  //     return null;
  //   }
  // }

// Add more sign-in methods if needed (e.g., Facebook, Twitter, etc.)
}

// class AuthenticationProvider {
//   final FirebaseAuth firebaseAuth;
//
//   AuthenticationProvider(this.firebaseAuth);
//
//   Stream<User> get authState => firebaseAuth.idTokenChanges();
//
//   Future<void> signOut() async {
//     await firebaseAuth.signOut();
//   }
//
//   Future<String> signIn({String email, String password}) async {
//     try {
//       await firebaseAuth.signInWithEmailAndPassword(
//           email: email, password: password);
//       return "Signed in";
//     } on FirebaseAuthException catch (e) {
//       return e.message;
//     }
//   }
//
//   Future<String> signUp({String email, String password}) async {
//     try {
//       await firebaseAuth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       return "Signed up";
//     } on FirebaseAuthException catch (e) {
//       return e.message;
//     }
//   }
//
//   Future<String> uid() async {
//     return firebaseAuth.currentUser.uid;
//   }
// }