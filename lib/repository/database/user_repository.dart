import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mindowl/model/user.dart';
import 'package:mindowl/utils/log.dart';

abstract class IUserRepository {
  Future<User> createUser(User user);
  Future<User?> getUser(String uid);
  Future<void> updateUser(User user);
  Future<void> deleteUser(String uid);
  Future<bool> userExists(String uid);

  Stream<User?> streamUser(String uid);
}

class UserRepository with MyLog implements IUserRepository {
  @override
  Future<User> createUser(User user) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid);
      await docRef.set(user.toJson());
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<User?> getUser(String uid) async {
    try {
      final docRef = FirebaseFirestore.instance.collection('users').doc(uid);
      final doc = await docRef.get();
      return User.fromJson(doc.data()!);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateUser(User user) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid);
      await docRef.update(user.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteUser(String uid) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).delete();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> userExists(String uid) async {
    try {
      final docRef = FirebaseFirestore.instance.collection('users').doc(uid);
      final doc = await docRef.get();
      return doc.exists;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Stream<User?> streamUser(String uid) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots()
        .map((event) => User.fromJson(event.data()!));
  }
}
