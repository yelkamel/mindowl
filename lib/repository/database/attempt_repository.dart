import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mindowl/model/attempt.dart';
import 'package:mindowl/utils/log.dart';

abstract class IAttemptRepository {
  Future<Attempt> createAttempt(String uid, Attempt attempt);
  Future<Attempt?> getAttempt(String uid, String noteId, String exoId, String attemptId);
  Future<void> updateAttempt(String uid, Attempt attempt);
  Future<void> deleteAttempt(String uid, String noteId, String exoId, String attemptId);
  Stream<List<Attempt>> watchExoAttempts(String uid, String noteId, String exoId);
  Future<List<Attempt>> getExoAttempts(String uid, String noteId, String exoId);
}

class AttemptRepository with MyLog implements IAttemptRepository {
  @override
  Future<Attempt> createAttempt(String uid, Attempt attempt) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('notes')
          .doc(attempt.noteId)
          .collection('exos')
          .doc(attempt.exoId)
          .collection('attempts')
          .doc(attempt.id);
      await docRef.set(attempt.toJson());
      return attempt;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Attempt?> getAttempt(String uid, String noteId, String exoId, String attemptId) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('notes')
          .doc(noteId)
          .collection('exos')
          .doc(exoId)
          .collection('attempts')
          .doc(attemptId);
      final doc = await docRef.get();
      if (!doc.exists) return null;
      return Attempt.fromJson(doc.data()!);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateAttempt(String uid, Attempt attempt) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('notes')
          .doc(attempt.noteId)
          .collection('exos')
          .doc(attempt.exoId)
          .collection('attempts')
          .doc(attempt.id);
      await docRef.update(attempt.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteAttempt(String uid, String noteId, String exoId, String attemptId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('notes')
          .doc(noteId)
          .collection('exos')
          .doc(exoId)
          .collection('attempts')
          .doc(attemptId)
          .delete();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Stream<List<Attempt>> watchExoAttempts(String uid, String noteId, String exoId) {
    try {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('notes')
          .doc(noteId)
          .collection('exos')
          .doc(exoId)
          .collection('attempts')
          .orderBy('answeredAt', descending: true)
          .snapshots()
          .map((snapshot) => 
              snapshot.docs.map((doc) => Attempt.fromJson(doc.data())).toList());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Attempt>> getExoAttempts(String uid, String noteId, String exoId) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('notes')
          .doc(noteId)
          .collection('exos')
          .doc(exoId)
          .collection('attempts')
          .orderBy('answeredAt', descending: true)
          .get();
      return snapshot.docs.map((doc) => Attempt.fromJson(doc.data())).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}