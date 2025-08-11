import 'package:flutter/material.dart';
import 'package:mindowl/model/note.dart';
import 'package:mindowl/model/session.dart';
import 'package:mindowl/model/exo.dart';
import 'package:mindowl/data/fake_data.dart';
import 'package:mindowl/presentation/screen/notedetail/organism/note_detail_content.dart';

class NoteDetailScreen extends StatefulWidget {
  final String noteId;

  const NoteDetailScreen({super.key, required this.noteId});

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  late Note note;
  List<Session> sessions = [];
  List<Exo> exos = [];

  @override
  void initState() {
    super.initState();
    _loadNoteData();
  }

  void _loadNoteData() {
    note = FakeData.getNoteById(widget.noteId)!;
    sessions = FakeData.getSessionsForNote(widget.noteId);
    exos = FakeData.getExosForNote(widget.noteId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: NoteDetailContent(
        note: note,
        sessions: sessions,
        exos: exos,
        onBackTap: () => Navigator.of(context).pop(),
        onFavoriteTap: () {
          setState(() {
            note = note.copyWith(isFavorite: !note.isFavorite);
          });
        },
        onMenuAction: (action) {
          switch (action) {
            case 'share':
              // Share note
              break;
            case 'export':
              // Export markdown
              break;
            case 'duplicate':
              // Duplicate note
              break;
            case 'delete':
              // Delete note
              break;
          }
        },
        onRelatedNotesTap: () {
          // Navigate to related notes
        },
        onExoPractice: (exo) {
          // Navigate to individual exo detail
        },
        onExoFavorite: (exo) {
          final index = exos.indexOf(exo);
          setState(() {
            exos[index] = exo.copyWith(isFavorite: !exo.isFavorite);
          });
        },
        onQuizAll: () {
          // Start quiz with all exos
        },
        onQuizIncomplete: () {
          // Start quiz with incomplete exos only
        },
        onQuizFavorites: () {
          // Quiz favorites
        },
        onMixedQuiz: () {
          // Mixed quiz
        },
        onExport: () {
          // Export note
        },
      ),
    );
  }
}