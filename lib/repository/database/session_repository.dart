import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mindowl/model/session.dart';
import 'package:mindowl/utils/log.dart';

abstract class ISessionRepository {
  Future<Session> createSession(String uid, Session session);
  Future<Session?> getSession(String uid, String sessionId);
  Future<void> updateSession(String uid, Session session);
  Future<void> deleteSession(String uid, String sessionId);
  Stream<Session?> watchSession(String uid, String sessionId);
}

class SessionRepository with MyLog implements ISessionRepository {
  @override
  Future<Session> createSession(String uid, Session session) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('sessions')
          .doc(session.id);
      await docRef.set(session.toJson());
      return session;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Session?> getSession(String uid, String sessionId) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('sessions')
          .doc(sessionId);
      final doc = await docRef.get();
      if (!doc.exists) return null;
      return Session.fromJson(doc.data()!);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateSession(String uid, Session session) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('sessions')
          .doc(session.id);
      await docRef.update(session.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteSession(String uid, String sessionId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('sessions')
          .doc(sessionId)
          .delete();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Stream<Session?> watchSession(String uid, String sessionId) {
    try {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('sessions')
          .doc(sessionId)
          .snapshots()
          .map((doc) => doc.exists ? Session.fromJson(doc.data()!) : null);
    } catch (e) {
      throw Exception(e);
    }
  }
}
