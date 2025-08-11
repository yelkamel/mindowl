enum ContextType {
  podcast,
  video,
  audiobook,
  music,
  conversation,
  lecture,
  meeting,
  silence,
  unknown;

  String get displayKey {
    switch (this) {
      case ContextType.podcast:
        return 'context.podcast';
      case ContextType.video:
        return 'context.video';
      case ContextType.audiobook:
        return 'context.audiobook';
      case ContextType.music:
        return 'context.music';
      case ContextType.conversation:
        return 'context.conversation';
      case ContextType.lecture:
        return 'context.lecture';
      case ContextType.meeting:
        return 'context.meeting';
      case ContextType.silence:
        return 'context.silence';
      case ContextType.unknown:
        return 'context.unknown';
    }
  }
}