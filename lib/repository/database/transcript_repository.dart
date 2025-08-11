import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mindowl/model/transcript.dart';
import 'package:mindowl/utils/log.dart';

abstract class ITranscriptRepository {
  Future<Transcript> createTranscript(String uid, Transcript transcript);
  Future<Transcript?> getTranscript(String uid, String sessionId, String transcriptId);
  Future<void> updateTranscript(String uid, Transcript transcript);
  Future<void> deleteTranscript(String uid, String sessionId, String transcriptId);
  Future<List<Transcript>> getSessionTranscripts(String uid, String sessionId);
}

class TranscriptRepository with MyLog implements ITranscriptRepository {
  @override
  Future<Transcript> createTranscript(String uid, Transcript transcript) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('sessions')
          .doc(transcript.sessionId)
          .collection('transcripts')
          .doc(transcript.id);
      await docRef.set(transcript.toJson());
      return transcript;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Transcript?> getTranscript(String uid, String sessionId, String transcriptId) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('sessions')
          .doc(sessionId)
          .collection('transcripts')
          .doc(transcriptId);
      final doc = await docRef.get();
      if (!doc.exists) return null;
      return Transcript.fromJson(doc.data()!);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateTranscript(String uid, Transcript transcript) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('sessions')
          .doc(transcript.sessionId)
          .collection('transcripts')
          .doc(transcript.id);
      await docRef.update(transcript.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteTranscript(String uid, String sessionId, String transcriptId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('sessions')
          .doc(sessionId)
          .collection('transcripts')
          .doc(transcriptId)
          .delete();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Transcript>> getSessionTranscripts(String uid, String sessionId) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('sessions')
          .doc(sessionId)
          .collection('transcripts')
          .orderBy('startSec')
          .get();
      return snapshot.docs.map((doc) => Transcript.fromJson(doc.data())).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}