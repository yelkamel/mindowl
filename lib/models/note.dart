class Note {
  final String id;
  final String title;
  final DateTime createdAt;
  final DateTime? lastReviewed;
  final List<String> topics;
  final String primaryTheme;
  final bool isFavorite;
  final String markdownContent;
  final List<String> relatedNoteIds;
  
  // These will be populated by providers from subcollections
  final List<String> sessionIds; // References to sessions
  final List<String> exoIds;     // References to exos
  final List<String> quizIds;    // References to quizzes

  Note({
    required this.id,
    required this.title,
    required this.createdAt,
    this.lastReviewed,
    required this.topics,
    required this.primaryTheme,
    this.isFavorite = false,
    required this.markdownContent,
    this.relatedNoteIds = const [],
    this.sessionIds = const [],
    this.exoIds = const [],
    this.quizIds = const [],
  });

  // These computed properties would be calculated by providers
  // based on the actual exos and sessions data
  int get totalExos => exoIds.length;
  int get totalSessions => sessionIds.length;
  int get totalQuizzes => quizIds.length;
  
  String get themeColor {
    switch (primaryTheme.toLowerCase()) {
      case 'finance': return '#4CAF50';
      case 'history': return '#9C27B0';
      case 'geography': return '#2196F3';
      case 'science': return '#FF9800';
      case 'psychology': return '#E91E63';
      default: return '#607D8B';
    }
  }
  
  String get themeEmoji {
    switch (primaryTheme.toLowerCase()) {
      case 'finance': return '💰';
      case 'history': return '🏛️';
      case 'geography': return '🌍';
      case 'science': return '🔬';
      case 'psychology': return '🧠';
      default: return '📚';
    }
  }
  
  String get formattedCreatedDate {
    final now = DateTime.now();
    final difference = now.difference(createdAt).inDays;
    
    if (difference == 0) return 'Today';
    if (difference == 1) return '1 day ago';
    return '$difference days ago';
  }
}
