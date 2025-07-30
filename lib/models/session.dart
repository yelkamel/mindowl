
class Session {
  final String id;
  final String noteId; // Reference to parent note
  final String title;
  final String source; // podcast, video, audio
  final String platform; // spotify, youtube, etc.
  final DateTime date;
  final int duration; // in seconds
  final double liveScore; // Score during the session
  final String context; // Description of what was studied
  final List<String> exoIds; // References to exos created in this session
  final SessionStatus status;
  final Map<String, dynamic> metadata; // Additional session data

  Session({
    required this.id,
    required this.noteId,
    required this.title,
    required this.source,
    required this.platform,
    required this.date,
    required this.duration,
    required this.liveScore,
    required this.context,
    required this.exoIds,
    this.status = SessionStatus.completed,
    this.metadata = const {},
  });

  String get formattedDuration {
    final minutes = duration ~/ 60;
    return '${minutes}min';
  }

  String get formattedDate {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;
    
    if (difference == 0) return 'Today';
    if (difference == 1) return '1 day ago';
    return '$difference days ago';
  }
}

enum SessionStatus {
  active,
  completed,
  paused,
  cancelled
}