import 'package:mindowl/model/note.dart';
import 'package:mindowl/model/session.dart';
import 'package:mindowl/model/exo.dart';

class FakeData {
  static List<Note> notes = [
    Note(
      id: 'note_1',
      title: 'AI Fundamentals - Podcast Episode 42',
      summary:
          'Comprehensive overview of AI fundamentals including neural networks, deep learning, and machine learning applications.',
      createdAt: DateTime.now().subtract(Duration(days: 2)),
      updatedAt: DateTime.now().subtract(Duration(days: 1)),
      lastReviewed: DateTime.now().subtract(Duration(days: 1)),
      topics: ['Machine Learning', 'Neural Networks', 'Deep Learning'],
      primaryTheme: 'Science',
      isFavorite: true,
      markdownContent: '''# AI Fundamentals Summary

## Key Learning Points
- **Neural networks** are computational models inspired by biological neural networks
- **Deep learning** uses multiple layers to progressively extract higher-level features
- **Supervised learning** requires labeled training data
- **Unsupervised learning** finds patterns in data without labels

## Important Concepts
> Machine learning is a subset of artificial intelligence that enables computers to learn and improve from experience

### Applications
- Image recognition and computer vision
- Natural language processing
- Recommendation systems
- Autonomous vehicles

## Key Takeaways
1. Start with simple models before moving to complex ones
2. Data quality is more important than quantity
3. Cross-validation prevents overfitting
''',
      sessionIds: ['session_1', 'session_2', 'quiz_1', 'quiz_2'],
      exoIds: ['exo_1', 'exo_2', 'exo_3', 'exo_4', 'exo_5'],
    ),

    Note(
      id: 'note_2',
      title: 'Psychology of Learning - Lecture 3',
      summary:
          'In-depth exploration of memory systems, learning principles, and cognitive load theory.',
      createdAt: DateTime.now().subtract(Duration(days: 3)),
      updatedAt: DateTime.now().subtract(Duration(days: 2)),
      lastReviewed: DateTime.now().subtract(Duration(days: 2)),
      topics: ['Cognitive Psychology', 'Memory', 'Learning Theories'],
      primaryTheme: 'Psychology',
      markdownContent: '''# Psychology of Learning

## Memory Systems
- **Working Memory**: Temporary storage and manipulation
- **Long-term Memory**: Permanent storage system
- **Episodic Memory**: Personal experiences and events

## Learning Principles
1. **Spaced Repetition**: Review material at increasing intervals
2. **Active Recall**: Test yourself instead of passive reading
3. **Elaborative Processing**: Connect new info to existing knowledge

## Cognitive Load Theory
> The brain has limited processing capacity for new information

### Types of Cognitive Load
- Intrinsic: Inherent difficulty of material
- Extraneous: Poor instructional design
- Germane: Processing that builds schemas
''',
      sessionIds: ['session_3', 'quiz_3'],
      exoIds: ['exo_6', 'exo_7', 'exo_8'],
    ),

    Note(
      id: 'note_3',
      title: 'Neuroscience Deep Dive - Training Session',
      summary:
          'Advanced neuroscience covering brain structure, synaptic transmission, and neuroplasticity mechanisms.',
      createdAt: DateTime.now().subtract(Duration(days: 4)),
      updatedAt: DateTime.now().subtract(Duration(days: 4)),
      topics: ['Neuroscience', 'Brain Function', 'Synapses'],
      primaryTheme: 'Science',
      markdownContent: '''# Neuroscience Deep Dive

## Brain Structure
- **Cerebral Cortex**: Higher-order thinking
- **Hippocampus**: Memory formation
- **Amygdala**: Emotional processing

## Synaptic Transmission
1. Action potential reaches axon terminal
2. Calcium channels open
3. Neurotransmitters released
4. Postsynaptic receptors activated

## Neuroplasticity
> The brain's ability to reorganize and adapt throughout life

### Types of Plasticity
- Structural: Physical changes in neural connections
- Functional: Changes in neural activity patterns
''',
      sessionIds: ['session_4'],
      exoIds: ['exo_9', 'exo_10', 'exo_11', 'exo_12'],
    ),
  ];

  static List<Session> sessions = [
    Session(
      id: 'session_1',
      noteId: 'note_1',
      title: 'AI Fundamentals Podcast - Part 1',
      type: SessionType.listening,
      status: SessionStatus.ended,
      createdAt: DateTime.now().subtract(Duration(days: 2)),
      startedAt: DateTime.now().subtract(Duration(days: 2)),
      endedAt: DateTime.now().subtract(Duration(days: 2, hours: -1)),
      // Legacy fields
      source: 'podcast',
      platform: 'Spotify',
      date: DateTime.now().subtract(Duration(days: 2)),
      duration: 1920, // 32 minutes
      liveScore: 0.8,
      context: 'Introduction to neural networks and basic ML concepts',
      exoIds: ['exo_1', 'exo_2', 'exo_3'],
    ),

    Session(
      id: 'session_2',
      noteId: 'note_1',
      title: 'AI Fundamentals Podcast - Part 2',
      type: SessionType.listening,
      status: SessionStatus.ended,
      createdAt: DateTime.now().subtract(Duration(days: 1)),
      startedAt: DateTime.now().subtract(Duration(days: 1)),
      endedAt: DateTime.now().subtract(Duration(days: 1, hours: -1)),
      // Legacy fields
      source: 'podcast',
      platform: 'Spotify',
      date: DateTime.now().subtract(Duration(days: 1)),
      duration: 1800, // 30 minutes
      liveScore: 0.85,
      context: 'Deep dive into supervised vs unsupervised learning',
      exoIds: ['exo_4', 'exo_5'],
    ),

    Session(
      id: 'session_3',
      noteId: 'note_2',
      title: 'Psychology Lecture Recording',
      type: SessionType.listening,
      status: SessionStatus.ended,
      createdAt: DateTime.now().subtract(Duration(days: 3)),
      startedAt: DateTime.now().subtract(Duration(days: 3)),
      endedAt: DateTime.now().subtract(Duration(days: 3, hours: -1)),
      // Legacy fields
      source: 'video',
      platform: 'YouTube',
      date: DateTime.now().subtract(Duration(days: 3)),
      duration: 2700, // 45 minutes
      liveScore: 0.92,
      context: 'University lecture on memory systems and learning',
      exoIds: ['exo_6', 'exo_7', 'exo_8'],
    ),

    Session(
      id: 'session_4',
      noteId: 'note_3',
      title: 'Neuroscience Training',
      type: SessionType.listening,
      status: SessionStatus.ended,
      createdAt: DateTime.now().subtract(Duration(days: 4)),
      startedAt: DateTime.now().subtract(Duration(days: 4)),
      endedAt: DateTime.now().subtract(Duration(days: 4, hours: -1)),
      // Legacy fields
      source: 'audio',
      platform: 'Internal',
      date: DateTime.now().subtract(Duration(days: 4)),
      duration: 3600, // 60 minutes
      liveScore: 0.78,
      context: 'Professional development session on brain function',
      exoIds: ['exo_9', 'exo_10', 'exo_11', 'exo_12'],
    ),
  ];

  static List<Exo> exos = [
    // AI Fundamentals Exos
    Exo(
      id: 'exo_1',
      noteId: 'note_1',
      sessionId: 'session_1',
      type: ExoType.mcq,
      content: ExoContent(
        question: 'What is a neural network?',
        options: [
          'A computer program',
          'A biological brain',
          'A computational model inspired by biological neural networks',
          'A type of database',
        ],
        answer: 2,
        explanation:
            'Neural networks are computational models inspired by the structure and function of biological neural networks.',
      ),
      difficulty: 1,
      tags: ['ai', 'neural-networks', 'basic'],
      createdAt: DateTime.now().subtract(Duration(days: 2)),
      // Legacy fields
      question: 'What is a neural network?',
      options: [
        'A computer program',
        'A biological brain',
        'A computational model inspired by biological neural networks',
        'A type of database',
      ],
      correctAnswer: 2,
      xpReward: 10,
      explanation:
          'Neural networks are computational models inspired by the structure and function of biological neural networks.',
      lastAttempted: DateTime.now().subtract(Duration(days: 1)),
      correctAttempts: 3,
      totalAttempts: 4,
      isAnswered: true,
      userAnswer: 2,
      isCorrect: true,
      isFavorite: true,
    ),

    Exo(
      id: 'exo_2',
      noteId: 'note_1',
      sessionId: 'session_1',
      type: ExoType.truefalse,
      content: ExoContent(
        question: 'Deep learning uses multiple layers to extract features.',
        options: ['True', 'False'],
        answer: true,
        explanation:
            'Deep learning architectures use multiple layers to progressively extract higher-level features from raw input.',
      ),
      difficulty: 2,
      tags: ['deep-learning', 'layers'],
      createdAt: DateTime.now().subtract(Duration(days: 2)),
      // Legacy fields
      question: 'Deep learning uses multiple layers to extract features.',
      options: ['True', 'False'],
      correctAnswer: true,
      xpReward: 8,
      explanation:
          'Deep learning architectures use multiple layers to progressively extract higher-level features from raw input.',
      lastAttempted: DateTime.now().subtract(Duration(days: 1)),
      correctAttempts: 2,
      totalAttempts: 2,
      isAnswered: true,
      userAnswer: true,
      isCorrect: true,
    ),

    Exo(
      id: 'exo_3',
      noteId: 'note_1',
      sessionId: 'session_1',
      type: ExoType.short,
      content: ExoContent(
        question: 'What type of learning requires labeled training data?',
        answer: 'Supervised learning',
        explanation:
            'Supervised learning algorithms learn from input-output pairs, requiring labeled training data.',
      ),
      difficulty: 2,
      tags: ['supervised-learning', 'training-data'],
      createdAt: DateTime.now().subtract(Duration(days: 2)),
      // Legacy fields
      question: 'What type of learning requires labeled training data?',
      correctAnswer: 'Supervised learning',
      xpReward: 12,
      explanation:
          'Supervised learning algorithms learn from input-output pairs, requiring labeled training data.',
      correctAttempts: 1,
      totalAttempts: 3,
      isAnswered: true,
      userAnswer: 'Supervised learning',
      isCorrect: true,
    ),

    Exo(
      id: 'exo_4',
      noteId: 'note_1',
      sessionId: 'session_2',
      type: ExoType.mcq,
      content: ExoContent(
        question: 'Which is NOT a common application of machine learning?',
        options: [
          'Image recognition',
          'Natural language processing',
          'Manual data entry',
          'Recommendation systems',
        ],
        answer: 2,
        explanation:
            'Manual data entry is a human task, while the others are common ML applications.',
      ),
      difficulty: 1,
      tags: ['applications', 'ml-uses'],
      createdAt: DateTime.now().subtract(Duration(days: 1)),
      // Legacy fields
      question: 'Which is NOT a common application of machine learning?',
      options: [
        'Image recognition',
        'Natural language processing',
        'Manual data entry',
        'Recommendation systems',
      ],
      correctAnswer: 2,
      xpReward: 10,
      explanation:
          'Manual data entry is a human task, while the others are common ML applications.',
      correctAttempts: 0,
      totalAttempts: 2,
      isAnswered: true,
      userAnswer: 1,
      isCorrect: false,
    ),

    Exo(
      id: 'exo_5',
      noteId: 'note_1',
      sessionId: 'session_2',
      type: ExoType.truefalse,
      content: ExoContent(
        question: 'Cross-validation helps prevent overfitting.',
        options: ['True', 'False'],
        answer: true,
        explanation:
            'Cross-validation helps assess model performance and prevent overfitting by testing on unseen data.',
      ),
      difficulty: 3,
      options: ['True', 'False'],
      correctAnswer: true,
      xpReward: 8,
      explanation:
          'Cross-validation helps assess model performance and prevent overfitting by testing on unseen data.',
      createdAt: DateTime.now().subtract(Duration(days: 1)),
      correctAttempts: 1,
      totalAttempts: 1,
      isAnswered: true,
      userAnswer: true,
      isCorrect: true,
      isFavorite: true,
    ),

    // Psychology Exos
    Exo(
      id: 'exo_6',
      noteId: 'note_2',
      sessionId: 'session_3',
      question:
          'Which memory system handles temporary storage and manipulation?',
      type: ExoType.mcq,
      options: [
        'Long-term memory',
        'Working memory',
        'Episodic memory',
        'Semantic memory',
      ],
      content: ExoContent(
        question:
            'Which memory system handles temporary storage and manipulation?',
        options: [
          'Long-term memory',
          'Working memory',
          'Episodic memory',
          'Semantic memory',
        ],
        answer: 1,
        explanation:
            'Working memory is responsible for temporary storage and manipulation of information.',
      ),
      correctAnswer: 1,
      xpReward: 10,
      explanation:
          'Working memory is responsible for temporary storage and manipulation of information.',
      difficulty: 2,
      createdAt: DateTime.now().subtract(Duration(days: 3)),
      lastAttempted: DateTime.now().subtract(Duration(days: 2)),
      correctAttempts: 2,
      totalAttempts: 2,
      isAnswered: true,
      userAnswer: 1,
      isCorrect: true,
    ),

    Exo(
      id: 'exo_7',
      noteId: 'note_2',
      sessionId: 'session_3',
      question: 'What is spaced repetition?',
      type: ExoType.short,
      correctAnswer: 'Reviewing material at increasing intervals',
      xpReward: 12,
      explanation:
          'Spaced repetition involves reviewing material at progressively longer intervals to improve long-term retention.',
      difficulty: 2,
      createdAt: DateTime.now().subtract(Duration(days: 3)),
      correctAttempts: 1,
      totalAttempts: 1,
      isAnswered: true,
      userAnswer: 'Reviewing material at increasing intervals',
      isCorrect: true,
      content: ExoContent(
        question: 'What is spaced repetition?',
        answer: 'Reviewing material at increasing intervals',
        explanation:
            'Spaced repetition involves reviewing material at progressively longer intervals to improve long-term retention.',
      ),
    ),

    Exo(
      id: 'exo_8',
      noteId: 'note_2',
      sessionId: 'session_3',
      question:
          'The brain has unlimited processing capacity for new information.',
      type: ExoType.truefalse,
      options: ['True', 'False'],
      correctAnswer: false,
      xpReward: 8,
      explanation:
          'Cognitive Load Theory states that the brain has limited processing capacity for new information.',
      difficulty: 1,
      createdAt: DateTime.now().subtract(Duration(days: 3)),
      correctAttempts: 0,
      totalAttempts: 1,
      isAnswered: true,
      userAnswer: true,
      content: ExoContent(
        question:
            'The brain has limited processing capacity for new information.',
        options: ['True', 'False'],
        answer: false,
        explanation:
            'Cognitive Load Theory states that the brain has limited processing capacity for new information.',
      ),
      isCorrect: false,
    ),

    // Neuroscience Exos
    Exo(
      id: 'exo_9',
      noteId: 'note_3',
      sessionId: 'session_4',
      question:
          'Which brain structure is primarily responsible for memory formation?',
      type: ExoType.mcq,
      options: ['Cerebral cortex', 'Hippocampus', 'Amygdala', 'Cerebellum'],
      correctAnswer: 1,
      xpReward: 10,
      explanation:
          'The hippocampus plays a crucial role in the formation of new memories.',
      difficulty: 2,
      createdAt: DateTime.now().subtract(Duration(days: 4)),
      correctAttempts: 0,
      totalAttempts: 0,
      isAnswered: false,
      content: ExoContent(
        question:
            'Which brain structure is primarily responsible for memory formation?',
        options: ['Cerebral cortex', 'Hippocampus', 'Amygdala', 'Cerebellum'],
        answer: 1,
        explanation:
            'The hippocampus plays a crucial role in the formation of new memories.',
      ),
    ),

    Exo(
      id: 'exo_10',
      noteId: 'note_3',
      sessionId: 'session_4',
      question: 'What opens first during synaptic transmission?',
      type: ExoType.short,
      correctAnswer: 'Calcium channels',
      xpReward: 12,
      explanation:
          'When an action potential reaches the axon terminal, calcium channels open first.',
      difficulty: 3,
      createdAt: DateTime.now().subtract(Duration(days: 4)),
      correctAttempts: 0,
      totalAttempts: 0,
      isAnswered: false,
      content: ExoContent(
        question: 'What opens first during synaptic transmission?',
        answer: 'Calcium channels',
        explanation:
            'When an action potential reaches the axon terminal, calcium channels open first.',
      ),
    ),

    Exo(
      id: 'exo_11',
      noteId: 'note_3',
      sessionId: 'session_4',
      question: 'Neuroplasticity only occurs in young brains.',
      type: ExoType.truefalse,
      options: ['True', 'False'],
      correctAnswer: false,
      xpReward: 8,
      explanation:
          'Neuroplasticity is the brain\'s ability to reorganize throughout life, not just in youth.',
      difficulty: 2,
      createdAt: DateTime.now().subtract(Duration(days: 4)),
      correctAttempts: 0,
      totalAttempts: 0,
      isAnswered: false,
      content: ExoContent(
        question: 'Neuroplasticity only occurs in young brains.',
        options: ['True', 'False'],
        answer: false,
        explanation:
            'Neuroplasticity is the brain\'s ability to reorganize throughout life, not just in youth.',
      ),
    ),

    Exo(
      id: 'exo_12',
      noteId: 'note_3',
      sessionId: 'session_4',
      question:
          'Which type of plasticity involves physical changes in neural connections?',
      type: ExoType.mcq,
      options: [
        'Functional plasticity',
        'Structural plasticity',
        'Synaptic plasticity',
        'Cognitive plasticity',
      ],
      correctAnswer: 1,
      xpReward: 10,
      explanation:
          'Structural plasticity involves physical changes in neural connections and brain structure.',
      difficulty: 3,
      createdAt: DateTime.now().subtract(Duration(days: 4)),
      correctAttempts: 0,
      totalAttempts: 0,
      isAnswered: false,
      isFavorite: true,
      content: ExoContent(
        question:
            'Which type of plasticity involves physical changes in neural connections?',
        options: [
          'Functional plasticity',
          'Structural plasticity',
          'Synaptic plasticity',
          'Cognitive plasticity',
        ],
        answer: 1,
        explanation:
            'Structural plasticity involves physical changes in neural connections and brain structure.',
      ),
    ),
  ];

  static List<Session> quizSessions = [
    Session(
      id: 'quiz_1',
      noteId: 'note_1',
      title: 'AI Fundamentals - Complete Quiz',
      type: SessionType.quiz,
      status: SessionStatus.ended,
      createdAt: DateTime.now().subtract(Duration(days: 1)),
      startedAt: DateTime.now().subtract(Duration(days: 1)),
      endedAt: DateTime.now().subtract(Duration(days: 1, hours: -1)),
      completedAt: DateTime.now().subtract(Duration(days: 1, hours: -1)),
      totalQuestions: 5,
      currentQuestionIndex: 5,
      finalScore: 0.8,
      correctAnswers: 4,
      // Legacy fields
      source: 'app',
      platform: 'MindOwl',
      date: DateTime.now().subtract(Duration(days: 1)),
      duration: 300, // 5 minutes total
      liveScore: 0.8,
      context: 'Quiz covering all AI fundamentals topics',
      exoIds: ['exo_1', 'exo_2', 'exo_3', 'exo_4', 'exo_5'],
    ),

    Session(
      id: 'quiz_2',
      noteId: 'note_1',
      title: 'AI Fundamentals - Practice Incomplete',
      type: SessionType.quiz,
      status: SessionStatus.idle,
      createdAt: DateTime.now().subtract(Duration(hours: 2)),
      totalQuestions: 1,
      // Legacy fields
      source: 'app',
      platform: 'MindOwl',
      date: DateTime.now().subtract(Duration(hours: 2)),
      duration: 0,
      liveScore: 0.0,
      context: 'Practice quiz for incomplete questions',
      exoIds: ['exo_4'],
    ),

    Session(
      id: 'quiz_3',
      noteId: 'note_2',
      title: 'Psychology Quiz - All Topics',
      type: SessionType.quiz,
      status: SessionStatus.ended,
      createdAt: DateTime.now().subtract(Duration(days: 2)),
      startedAt: DateTime.now().subtract(Duration(days: 2)),
      endedAt: DateTime.now().subtract(Duration(days: 2, hours: -1)),
      completedAt: DateTime.now().subtract(Duration(days: 2, hours: -1)),
      totalQuestions: 3,
      currentQuestionIndex: 3,
      finalScore: 0.67,
      correctAnswers: 2,
      // Legacy fields
      source: 'app',
      platform: 'MindOwl',
      date: DateTime.now().subtract(Duration(days: 2)),
      duration: 195, // 3 minutes 15 seconds
      liveScore: 0.67,
      context: 'Comprehensive psychology quiz',
      exoIds: ['exo_6', 'exo_7', 'exo_8'],
    ),
  ];

  // Helper methods to get related data
  static List<Session> getSessionsForNote(String noteId) {
    return sessions.where((session) => session.noteId == noteId).toList();
  }

  static List<Exo> getExosForNote(String noteId) {
    return exos.where((exo) => exo.noteId == noteId).toList();
  }

  static List<Session> getQuizzesForNote(String noteId) {
    return quizSessions.where((quiz) => quiz.noteId == noteId).toList();
  }

  static List<Session> getAllSessions() {
    return [...sessions, ...quizSessions];
  }

  static Session? getQuizById(String quizId) {
    try {
      return quizSessions.firstWhere((quiz) => quiz.id == quizId);
    } catch (e) {
      return null;
    }
  }

  static Note? getNoteById(String noteId) {
    try {
      return notes.firstWhere((note) => note.id == noteId);
    } catch (e) {
      return null;
    }
  }

  static Session? getSessionById(String sessionId) {
    try {
      return sessions.firstWhere((session) => session.id == sessionId);
    } catch (e) {
      return null;
    }
  }

  static Exo? getExoById(String exoId) {
    try {
      return exos.firstWhere((exo) => exo.id == exoId);
    } catch (e) {
      return null;
    }
  }
}
