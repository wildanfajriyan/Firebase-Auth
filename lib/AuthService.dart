import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class SignInSignUpResult {
  final FirebaseUser user;
  final String message;
  SignInSignUpResult({required this.user, required this.message});
}

class AuthService {
  static Future<SignInSignUpResult> createUser(
      {String? email, String? pass}) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      return SignInSignUpResult(user: result.user, message: "success");
    } catch (e) {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      return SignInSignUpResult(user: result.user, message: e.toString());
    }
  }

  static Future<SignInSignUpResult> signInWithEmail(
      {String? email, String? pass}) async {
    try {
      AuthResult result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      return SignInSignUpResult(user: result.user, message: "success");
    } catch (e) {
      AuthResult result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      return SignInSignUpResult(user: result.user, message: e.toString());
    }
  }

  static GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly'],
  );

  static Future<SignInSignUpResult> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      final AuthResult result = await _auth.signInWithCredential(credential);
      return SignInSignUpResult(user: result.user, message: result.toString());
    } catch (e) {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      final AuthResult result = await _auth.signInWithCredential(credential);
      return SignInSignUpResult(user: result.user, message: e.toString());
    }
  }

  static Future<void> signOutGoogle() async {
    await googleSignIn.signOut();
  }

  void signOut() {
    _auth.signOut();
  }
}
