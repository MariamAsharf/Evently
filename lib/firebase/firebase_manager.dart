import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/models/user_model.dart';

class FirebaseManager {
  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  static Future<void> addUser(UserModel model) {
    var collection = getUsersCollection();
    var docRef = collection.doc(model.id);
    return docRef.set(model);
  }

  static Future<void> addEvent(TaskModel model) {
    var collection = getTaskCollection();
    var docRef = collection.doc();
    model.id = docRef.id;
    return docRef.set(model);
  }

  static Future<UserModel?> readUserData(String id) async {
    var collection = getUsersCollection();
    DocumentSnapshot<UserModel> snapshot = await collection.doc(id).get();
    return snapshot.data();
  }

  static Stream<QuerySnapshot<TaskModel>> getEvent(String categoryName) {
    var collection = getTaskCollection();
    if (categoryName == "All" ) {
      return collection
          .orderBy("date")
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots();
    } else {
      return collection
          .orderBy("date")
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where('category', isEqualTo: categoryName)
          .snapshots();
    }
  }

  static Future<void> deleteTask(String id) {
    var collection = getTaskCollection();
    return collection.doc(id).delete();
  }

  static Future<void> updateTask(TaskModel model) {
    var collection = getTaskCollection();
    return collection.doc(model.id).update(model.toJson());
  }

  static Future<void> favouriteTask (String id, bool currentStatus) async {
    await FirebaseFirestore.instance
        .collection('Tasks')
        .doc(id)
        .update({'isFavourite': !currentStatus});
  }


  static createUser(
    String email,
    String password,
    String name,
    Function onLoading,
    Function onSuccess,
    Function onError,
  ) async {
    try {
      onLoading();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel model = UserModel(
        id: credential.user!.uid,
        email: email,
        name: name,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
      await addUser(model);
      credential.user!.sendEmailVerification();
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        onError(e.message);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        onError(e.message);
      }
    } catch (e) {
      onError("Something Went Wrong");
      print(e);
    }
  }

  static Future<void> login(
    String email,
    String password,
    Function onLoading,
    Function onSuccess,
    Function onError,
  ) async {
    try {
      onLoading();
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      onSuccess();
      // if (credential.user!.emailVerified) {
      //   onSuccess();
      // } else {
      //   onError("Email is Not Verified , Please Check Your Email First");
      // }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        onError("Wrong Email");
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        onError("Wrong Password");
      }
    }
  }

  static Future<void> logOut() {
    return FirebaseAuth.instance.signOut();
  }

  static Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
