import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mindowl/model/session_exo.dart';
import 'package:mindowl/utils/log.dart';

abstract class ISessionExoRepository {
  Future<SessionExo> createSessionExo(String uid, SessionExo sessionExo);
  Future<SessionExo?> getSessionExo(String uid, String sessionId, String sessionExoId);
  Future<void> updateSessionExo(String uid, SessionExo sessionExo);
  Future<void> deleteSessionExo(String uid, String sessionId, String sessionExoId);
  Stream<List<SessionExo>> watchSessionExos(String uid, String sessionId);
  Future<List<SessionExo>> getSessionExos(String uid, String sessionId);
}

class SessionExoRepository with MyLog implements ISessionExoRepository {
  @override
  Future<SessionExo> createSessionExo(String uid, SessionExo sessionExo) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('sessions')
          .doc(sessionExo.sessionId)
          .collection('exos')
          .doc(sessionExo.id);
      await docRef.set(sessionExo.toJson());
      return sessionExo;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<SessionExo?> getSessionExo(String uid, String sessionId, String sessionExoId) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('sessions')
          .doc(sessionId)
          .collection('exos')
          .doc(sessionExoId);
      final doc = await docRef.get();
      if (!doc.exists) return null;
      return SessionExo.fromJson(doc.data()!);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateSessionExo(String uid, SessionExo sessionExo) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('sessions')
          .doc(sessionExo.sessionId)
          .collection('exos')
          .doc(sessionExo.id);
      await docRef.update(sessionExo.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteSessionExo(String uid, String sessionId, String sessionExoId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('sessions')
          .doc(sessionId)
          .collection('exos')
          .doc(sessionExoId)
          .delete();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Stream<List<SessionExo>> watchSessionExos(String uid, String sessionId) {
    try {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('sessions')
          .doc(sessionId)
          .collection('exos')
          .orderBy('spawnedAt', descending: true)
          .snapshots()
          .map((snapshot) => 
              snapshot.docs.map((doc) => SessionExo.fromJson(doc.data())).toList());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<SessionExo>> getSessionExos(String uid, String sessionId) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('sessions')
          .doc(sessionId)
          .collection('exos')
          .orderBy('spawnedAt', descending: true)
          .get();
      return snapshot.docs.map((doc) => SessionExo.fromJson(doc.data())).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}