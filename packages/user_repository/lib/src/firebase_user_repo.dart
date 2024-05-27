import 'dart:developer';

import 'package:rxdart/rxdart.dart';
import 'package:user_repository/src/entities/user_entities.dart';
import 'package:user_repository/src/models/user.dart';
import 'package:user_repository/src/user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUserRepo implements UserRepository {
  final FirebaseAuth _firebaseAuth;
  final userColletion = FirebaseFirestore.instance.collection('user');

  FirebaseUserRepo({
    FirebaseAuth? firebaseAuth,

  }) : _firebaseAuth=firebaseAuth ?? FirebaseAuth.instance;

  @override
  Stream <MyUser?> get user {
    return _firebaseAuth.authStateChanges().flatMap((fireBaseUser) async* {
      if (fireBaseUser == null) {
        yield MyUser.empty;
      } else {
        yield await userColletion
            .doc(fireBaseUser.uid)
            .get()
            .then((value) =>
            MyUser.fromEntity
              (MyUserEntity.fromDocument(value.data()!)));
      }
    });
  }

  @override
  Future<void> setUserData(MyUser myUser) async {
    try{
await userColletion
    .doc(myUser.userId)
    .set(myUser.toEntity().toDocuments());
    }
    catch(e){
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signIn(String email, String password) async {
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

    } catch(e){
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> signUp(MyUser myUser, String password) async {
    try{
          UserCredential user=
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: myUser.email,
              password: password
          );
          myUser.userId= user.user!.uid;
          return myUser;
    }
    catch(e){
      log(e.toString());
      rethrow;
    }

  }
  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }




}
