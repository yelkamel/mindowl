import 'package:flutter/material.dart';
import 'package:mindowl/model/note.dart';
import 'package:mindowl/model/session.dart';
import 'package:mindowl/model/exo.dart';
import 'package:mindowl/presentation/screen/notedetail/molecule/note_detail_header.dart';
import 'package:mindowl/presentation/screen/notedetail/molecule/session_info_card.dart';
import 'package:mindowl/presentation/screen/notedetail/molecule/theme_classification_section.dart';
import 'package:mindowl/presentation/screen/notedetail/molecule/markdown_content_section.dart';
import 'package:mindowl/presentation/screen/notedetail/molecule/exo_collection_section.dart';
import 'package:mindowl/presentation/screen/notedetail/molecule/actions_footer.dart';

class NoteDetailContent extends StatelessWidget {
  final Note note;
  final List<Session> sessions;
  final List<Exo> exos;
  final VoidCallback? onBackTap;
  final VoidCallback? onFavoriteTap;
  final Function(String)? onMenuAction;
  final VoidCallback? onRelatedNotesTap;
  final Function(Exo)? onExoPractice;
  final Function(Exo)? onExoFavorite;
  final VoidCallback? onQuizAll;
  final VoidCallback? onQuizIncomplete;
  final VoidCallback? onQuizFavorites;
  final VoidCallback? onMixedQuiz;
  final VoidCallback? onExport;

  const NoteDetailContent({
    super.key,
    required this.note,
    required this.sessions,
    required this.exos,
    this.onBackTap,
    this.onFavoriteTap,
    this.onMenuAction,
    this.onRelatedNotesTap,
    this.onExoPractice,
    this.onExoFavorite,
    this.onQuizAll,
    this.onQuizIncomplete,
    this.onQuizFavorites,
    this.onMixedQuiz,
    this.onExport,
  });

  @override
  Widget build(BuildContext context) {
    final completedExos = exos.where((e) => e.isMastered).length;
    final completionProgress = exos.isNotEmpty ? completedExos / exos.length : 0.0;

    return CustomScrollView(
      slivers: [
        NoteDetailHeader(
          note: note,
          totalExos: exos.length,
          completionProgress: completionProgress,
          onBackTap: onBackTap,
          onFavoriteTap: onFavoriteTap,
          onMenuAction: onMenuAction,
        ),
        if (sessions.isNotEmpty)
          SliverToBoxAdapter(
            child: SessionInfoCard(session: sessions.first),
          ),
        SliverToBoxAdapter(
          child: ThemeClassificationSection(
            note: note,
            onRelatedNotesTap: onRelatedNotesTap,
          ),
        ),
        SliverToBoxAdapter(
          child: MarkdownContentSection(
            markdownContent: note.markdownContent,
          ),
        ),
        if (exos.isNotEmpty)
          SliverToBoxAdapter(
            child: ExoCollectionSection(
              exos: exos,
              onExoPractice: onExoPractice,
              onExoFavorite: onExoFavorite,
            ),
          ),
        SliverToBoxAdapter(
          child: ActionsFooter(
            onQuizAll: onQuizAll,
            onQuizIncomplete: onQuizIncomplete,
            onQuizFavorites: onQuizFavorites,
            onMixedQuiz: onMixedQuiz,
            onExport: onExport,
          ),
        ),
      ],
    );
  }
}