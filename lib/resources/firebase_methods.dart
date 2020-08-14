import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo3rdwheelhp/constants/strings.dart';
import 'package:demo3rdwheelhp/models/message.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:google_sign_in/google_sign_in.dart';
import 'package:demo3rdwheelhp/models/user.dart';
import 'package:demo3rdwheelhp/utils/utilities.dart';

class FirebaseMethods {
  /*
    User Authentication
   */
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //Sign in with google
  GoogleSignIn _googleSignIn = GoogleSignIn();

  static final Firestore firestore = Firestore.instance;
  User user = User();

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser currentUser;
    currentUser = await _auth.currentUser();
    return currentUser;
  }

  Future<FirebaseUser> signIn() async {
    //Responsible for google sign in pop up
    GoogleSignInAccount _signInAccount = await _googleSignIn.signIn();
    //Google Authentication
    GoogleSignInAuthentication _signInAuthentication =
        await _signInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: _signInAuthentication.idToken,
        accessToken: _signInAuthentication.accessToken);

    AuthResult result = await _auth.signInWithCredential(credential);
    return result.user;
  }

  Future<bool> authenticateUser(FirebaseUser user) async {
    //Tell Firebase ro retrun list of all docs
    QuerySnapshot result = await firestore
        .collection(USERS_COLLECTION)
        .where(EMAIL_FIELD, isEqualTo: user.email)
        .getDocuments();

    final List<DocumentSnapshot> docs = result.documents;

    //if user is registerted then length of list > 0 or else less than 0
    return docs.length == 0 ? true : false;
  }

  Future<void> addDataToDb(FirebaseUser currentUser) async {
    String username = Utils.getUsername(currentUser.email);
    user = User(
      uid: currentUser.uid,
      email: currentUser.email,
      name: currentUser.displayName,
      profilePhoto: currentUser.photoUrl,
      username: username,
    );

    firestore
        .collection(USERS_COLLECTION)
        .document(currentUser.uid)
        .setData(user.toMap(user));
  }
  //Allow user to sign out of their accounts

  Future<bool> signOut() async {
    try {
      //await _googleSignIn.disconnect();
      await _googleSignIn.signOut();
      await _auth.signOut();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  //Create a list of all users for searching
  Future<List<User>> fetchAllUsers(FirebaseUser currentUser) async {
    List<User> userList = List<User>();

    QuerySnapshot querySnapshot =
        await firestore.collection(USERS_COLLECTION).getDocuments();
    for (var i = 0; i < querySnapshot.documents.length; i++) {
      //Prevent user from finding themselves
      if (querySnapshot.documents[i].documentID != currentUser.uid) {
        userList.add(User.fromMap(querySnapshot.documents[i].data));
      }
    }
    return userList;
  }

  //Text messaging feature - adding to database & sending
  Future<void> addMessageToDb(
      Message message, User sender, User receiver) async {
    //Handle message
    var map = message.toMap();

    //Link to Firestore
    await firestore
        .collection(MESSAGES_COLLECTION)
        .document(message.senderId)
        .collection(message.receiverId)
        .add(map);
    //Adding data for other user
    return await firestore
        .collection(MESSAGES_COLLECTION)
        .document(message.receiverId)
        .collection(message.senderId)
        .add(map);
  }
}
