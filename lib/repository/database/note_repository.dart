import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mindowl/model/note.dart';
import 'package:mindowl/model/exo.dart';
import 'package:mindowl/utils/log.dart';

abstract class INoteRepository {
  Future<Note> createNote(String uid, Note note);
  Future<Note?> getNote(String uid, String noteId);
  Future<void> updateNote(String uid, Note note);
  Future<void> deleteNote(String uid, String noteId);
  Stream<Note?> watchNote(String uid, String noteId);
  Future<List<Note>> getAllNotes(String uid);
  Stream<List<Exo>> watchNoteExos(String uid, String noteId, {int? limit});
  Future<List<Exo>> getNewExosAfter(String uid, String noteId, DateTime sinceCreatedAt, {int limit = 10});
}

class NoteRepository with MyLog implements INoteRepository {
  @override
  Future<Note> createNote(String uid, Note note) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('notes')
          .doc(note.id);
      await docRef.set(note.toJson());
      return note;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Note?> getNote(String uid, String noteId) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('notes')
          .doc(noteId);
      final doc = await docRef.get();
      if (!doc.exists) return null;
      return Note.fromJson(doc.data()!);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateNote(String uid, Note note) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('notes')
          .doc(note.id);
      await docRef.update(note.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteNote(String uid, String noteId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('notes')
          .doc(noteId)
          .delete();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Stream<Note?> watchNote(String uid, String noteId) {
    try {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('notes')
          .doc(noteId)
          .snapshots()
          .map((doc) => doc.exists ? Note.fromJson(doc.data()!) : null);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Note>> getAllNotes(String uid) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('notes')
          .orderBy('updatedAt', descending: true)
          .get();
      return snapshot.docs.map((doc) => Note.fromJson(doc.data())).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Stream<List<Exo>> watchNoteExos(String uid, String noteId, {int? limit}) {
    try {
      Query query = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('notes')
          .doc(noteId)
          .collection('exos')
          .orderBy('createdAt', descending: true);
      
      if (limit != null) {
        query = query.limit(limit);
      }
      
      return query.snapshots()
          .map((snapshot) => 
              snapshot.docs.map((doc) => Exo.fromJson(doc.data())).toList());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Exo>> getNewExosAfter(String uid, String noteId, DateTime sinceCreatedAt, {int limit = 10}) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('notes')
          .doc(noteId)
          .collection('exos')
          .where('createdAt', isGreaterThan: Timestamp.fromDate(sinceCreatedAt))
          .orderBy('createdAt', descending: false)
          .limit(limit)
          .get();
      return snapshot.docs.map((doc) => Exo.fromJson(doc.data())).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}