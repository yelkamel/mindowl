# MindOwl Architecture Documentation

## Table of Contents
1. [Overview](#overview)
2. [Presentation Layer Architecture](#presentation-layer-architecture)
3. [Model Layer Architecture](#model-layer-architecture)
4. [Repository Layer Architecture](#repository-layer-architecture)
5. [Code Generation & Build System](#code-generation--build-system)
6. [Architectural Principles](#architectural-principles)
7. [File Organization Standards](#file-organization-standards)
8. [Best Practices](#best-practices)

## Overview

MindOwl follows a clean architecture approach with a focus on separation of concerns, maintainability, and testability. The architecture is structured into three primary layers:

- **Presentation Layer**: UI components following atomic design principles
- **Model Layer**: Immutable data models with business logic
- **Repository Layer**: Data access and external service integration

## Presentation Layer Architecture

### Atomic Design Structure

Our presentation layer follows atomic design principles to create a scalable and maintainable UI architecture:

```
lib/presentation/screen/[feature]/
├── [feature]_screen.dart          # Main screen (minimal wrapper)
├── organism/
│   └── [feature]_content.dart     # Main orchestration component
├── molecule/
│   ├── component_a.dart           # Reusable UI components
│   ├── component_b.dart
│   └── component_c.dart
└── provider/                      # Optional: screen-specific state
    ├── [feature]_data.dart
    ├── [feature]_provider.dart
    └── generated files...
```

### Component Hierarchy

#### 1. Screen Level (Entry Point)
```dart
// lib/presentation/screen/profile/profile_screen.dart
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ProfileContent(), // Delegates to organism
      ),
    );
  }
}
```

#### 2. Organism Level (Main Logic Container)
```dart
// lib/presentation/screen/profile/organism/profile_content.dart
class ProfileContent extends StatefulWidget {
  const ProfileContent({super.key});

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  // Local state management
  String _userName = 'Alex Chen';
  String _userBio = 'Passionate learner...';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(),
          ProfileHeader(
            userName: _userName,
            userBio: _userBio,
            onNameChanged: _handleNameChange,
            onBioChanged: _handleBioChange,
          ),
          StatsGrid(/* props */),
          AchievementSection(/* props */),
          NotesPreview(/* props */),
        ],
      ),
    );
  }
}
```

#### 3. Molecule Level (Reusable Components)
```dart
// lib/presentation/screen/profile/molecule/profile_header.dart
class ProfileHeader extends StatefulWidget {
  final String userName;
  final String userBio;
  final Function(String) onNameChanged;
  final Function(String) onBioChanged;

  const ProfileHeader({
    super.key,
    required this.userName,
    required this.userBio,
    required this.onNameChanged,
    required this.onBioChanged,
  });

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader>
    with TickerProviderStateMixin {
  // Local animation management
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return EntranceFader( // Local entrance animation
      child: Container(/* UI implementation */),
    );
  }
}
```

### Animation Management

**Key Principle**: Animations are managed locally within each component, not passed down as props.

```dart
// ✅ CORRECT: Local animation management
class TimerDisplay extends StatefulWidget {
  final int duration;
  
  @override
  State<TimerDisplay> createState() => _TimerDisplayState();
}

class _TimerDisplayState extends State<TimerDisplay>
    with TickerProviderStateMixin {
  late AnimationController _countdownController;
  
  @override
  void initState() {
    super.initState();
    _countdownController = AnimationController(
      duration: Duration(seconds: widget.duration),
      vsync: this,
    );
  }
}

// ❌ WRONG: Don't pass animations as props
class TimerDisplay extends StatelessWidget {
  final Animation<double> animation; // Don't do this
}
```

### State Management with Riverpod

#### Provider Structure
```dart
// lib/presentation/screen/home/provider/home_data.dart
@freezed
sealed class HomeData with _$HomeData {
  const factory HomeData({
    required int currentStreak,
    required int currentLevel,
    required int currentXP,
    required int maxXP,
    required List<Note> recentNotes,
  }) = _HomeData;

  const HomeData._();

  // Computed properties
  double get progressPercentage => currentXP / maxXP;
  int get progressPercent => ((currentXP / maxXP) * 100).toInt();
}
```

```dart
// lib/presentation/screen/home/provider/home_data_provider.dart
@riverpod
class HomeDataProvider extends _$HomeDataProvider {
  @override
  HomeData build() {
    // Initialize with data from repositories
    return HomeData(
      currentStreak: 7,
      currentLevel: 3,
      currentXP: 450,
      maxXP: 600,
      recentNotes: FakeData.notes.take(3).toList(),
    );
  }

  void refreshData() {
    ref.invalidateSelf();
  }
}
```

#### Consumer Usage
```dart
class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeData = ref.watch(homeDataProviderProvider);
    
    return HomeContent(data: homeData);
  }
}
```

## Model Layer Architecture

### Freezed Sealed Classes

All data models use Freezed for immutability, pattern matching, and code generation:

```dart
// lib/model/note.dart
@freezed
sealed class Note with _$Note {
  const factory Note({
    required String id,
    required String title,
    @TimestampDateTimeConverter() required DateTime createdAt,
    @NullableTimestampDateTimeConverter() DateTime? lastReviewed,
    required List<String> topics,
    required String primaryTheme,
    @Default(false) bool isFavorite,
    required String markdownContent,
    @Default(<String>[]) List<String> exoIds,
  }) = _Note;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  const Note._();

  // Business logic methods
  int get totalExos => exoIds.length;
  
  String get themeColor {
    switch (primaryTheme.toLowerCase()) {
      case 'finance': return '#4CAF50';
      case 'history': return '#9C27B0';
      case 'science': return '#FF9800';
      default: return '#607D8B';
    }
  }
  
  String get formattedCreatedDate {
    final difference = DateTime.now().difference(createdAt).inDays;
    if (difference == 0) return 'Today';
    if (difference == 1) return '1 day ago';
    return '$difference days ago';
  }
}
```

### Custom Converters

Firebase Firestore integration requires custom converters for timestamp handling:

```dart
// lib/model/converters.dart
class TimestampDateTimeConverter implements JsonConverter<DateTime, Object?> {
  const TimestampDateTimeConverter();

  @override
  DateTime fromJson(Object? json) {
    if (json is Timestamp) return json.toDate();
    if (json is String) return DateTime.parse(json);
    throw const FormatException('Invalid date format for DateTime');
  }

  @override
  Object toJson(DateTime date) => Timestamp.fromDate(date);
}
```

### Model Examples

#### User Model
```dart
@freezed
sealed class User with _$User {
  const factory User({
    required String uid,
    @TimestampDateTimeConverter() required DateTime createdDate,
    @Default(false) bool micropermission,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
```

#### Session Model
```dart
@freezed
sealed class Session with _$Session {
  const factory Session({
    required String id,
    required String noteId,
    required String source, // 'podcast', 'video', 'audio'
    @TimestampDateTimeConverter() required DateTime startTime,
    @TimestampDateTimeConverter() required DateTime endTime,
    required int duration, // in seconds
    @Default(<String>[]) List<String> exoIds,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);

  const Session._();

  String get formattedDuration {
    final minutes = duration ~/ 60;
    final seconds = duration % 60;
    return '${minutes}:${seconds.toString().padLeft(2, '0')}';
  }
}
```

#### Exo (Exercise/Question) Model
```dart
@freezed
sealed class Exo with _$Exo {
  const factory Exo({
    required String id,
    required String noteId,
    required String question,
    required ExoType type,
    required List<String> options,
    required dynamic correctAnswer,
    @Default(false) bool isAnswered,
    @Default(false) bool isCorrect,
    @Default(false) bool isMastered,
    String? userAnswer,
    String? explanation,
  }) = _Exo;

  factory Exo.fromJson(Map<String, dynamic> json) => _$ExoFromJson(json);
}

enum ExoType {
  @JsonValue('multiple_choice')
  multipleChoice,
  @JsonValue('true_false') 
  trueFalse,
  @JsonValue('single_answer')
  singleAnswer,
}
```

## Repository Layer Architecture

### Interface-Based Pattern

All repositories follow an interface-based approach for testability and flexibility:

```dart
// lib/repository/database/user_repository.dart
abstract class IUserRepository {
  Future<User> createUser(User user);
  Future<User?> getUser(String uid);
  Future<void> updateUser(User user);
  Future<void> deleteUser(String uid);
  Future<bool> userExists(String uid);
}

class UserRepository with MyLog implements IUserRepository {
  @override
  Future<User> createUser(User user) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid);
      await docRef.set(user.toJson());
      return user;
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

  @override
  Future<User?> getUser(String uid) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(uid);
      final doc = await docRef.get();
      
      if (!doc.exists) return null;
      
      return User.fromJson(doc.data()!);
    } catch (e) {
      throw Exception('Failed to get user: $e');
    }
  }
}
```

### Authentication Repository
```dart
// lib/repository/service/auth_repository.dart
abstract class IAuthRepository {
  Future<void> loginUserAnonymously();
  Future<void> signOut();
  String get uid;
  bool get isAuthenticated;
}

class AuthRepository implements IAuthRepository {
  @override
  Future<void> loginUserAnonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'operation-not-allowed':
          throw Exception('Anonymous authentication is not enabled');
        case 'network-request-failed':
          throw Exception('Network error. Please check your connection');
        default:
          throw Exception('Authentication failed: ${e.message}');
      }
    }
  }

  @override
  String get uid => FirebaseAuth.instance.currentUser?.uid ?? '';

  @override
  bool get isAuthenticated => FirebaseAuth.instance.currentUser != null;
}
```

### Error Handling Strategy

**Important**: We use exception-based error handling, not Either monads.

```dart
// ✅ CORRECT: Exception-based error handling
class UserRepository implements IUserRepository {
  @override
  Future<User> createUser(User user) async {
    try {
      // Firebase operations
      return user;
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }
}

// Use in use cases/providers:
try {
  final user = await userRepository.createUser(newUser);
  // Handle success
} catch (e) {
  // Handle error
  loggy.error('User creation failed: $e');
}

// ❌ WRONG: Don't use Either monads
Future<Either<Failure, User>> createUser(User user) async {
  // We don't use this pattern
}
```

## Code Generation & Build System

### Required Dependencies

```yaml
# pubspec.yaml
dependencies:
  # Architecture
  flutter_riverpod: ^2.6.1
  riverpod_annotation: ^2.6.1
  fpdart: ^1.1.1
  
  # Code generation
  freezed_annotation: ^3.0.4
  json_annotation: ^4.9.0

dev_dependencies:
  # Code generation
  build_runner: ^2.4.15
  riverpod_generator: ^2.6.5
  freezed: ^3.0.4
  json_serializable: ^6.7.1
```

### Code Generation Commands

```bash
# Generate all code (models, providers, etc.)
dart run build_runner build

# Watch for changes and regenerate automatically
dart run build_runner watch

# Clean generated files
dart run build_runner clean
```

### Generated File Patterns

Every Freezed model generates multiple files:
- `model.dart` - Main model definition
- `model.freezed.dart` - Freezed generated code
- `model.g.dart` - JSON serialization code

Every Riverpod provider generates:
- `provider.dart` - Provider definition  
- `provider.g.dart` - Generated provider code

## Architectural Principles

### 1. Separation of Concerns
- **Presentation**: Only UI and user interactions
- **Models**: Data structures and business logic
- **Repositories**: Data access and external services

### 2. Dependency Direction
```
Presentation → Models
Presentation → Repositories → Models
```

### 3. Local Animation Management
- Each component manages its own animations
- Don't pass AnimationController or Animation objects as props
- Use TickerProviderStateMixin locally

### 4. Immutable Data
- All models are immutable using Freezed
- State updates create new instances
- No mutable state in models

### 5. Interface Segregation
- Repositories implement abstract interfaces
- Easy to mock for testing
- Clear contracts between layers

## File Organization Standards

```
lib/
├── data/                          # Mock data and constants
├── model/                         # Data models
│   ├── user.dart
│   ├── note.dart
│   ├── session.dart
│   ├── exo.dart
│   ├── converters.dart
│   └── *.freezed.dart, *.g.dart   # Generated files
├── presentation/
│   ├── screen/
│   │   └── [feature]/
│   │       ├── [feature]_screen.dart
│   │       ├── organism/
│   │       │   └── [feature]_content.dart
│   │       ├── molecule/
│   │       │   ├── component_a.dart
│   │       │   └── component_b.dart
│   │       └── provider/           # Optional
│   │           ├── [feature]_data.dart
│   │           ├── [feature]_provider.dart
│   │           └── *.g.dart, *.freezed.dart
│   └── oldscreens/                # Legacy screens (to be refactored)
├── repository/
│   ├── database/
│   │   └── user_repository.dart
│   ├── service/
│   │   └── auth_repository.dart
│   └── injection.dart
├── usecases/                      # Business logic layer
├── utils/                         # Utilities and helpers
└── main.dart
```

## Best Practices

### BuildContext Handling
```dart
// ✅ CORRECT: Use Builder widget to access context properly
Widget _buildSingleAnswerOption() {
  return Builder(
    builder: (context) {
      return TextField(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      );
    },
  );
}

// ❌ WRONG: Never access context through method calls
Widget _buildSingleAnswerOption() {
  return TextField(
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(_buildSingleAnswerOption().context!).colorScheme.primary, // NEVER!
        ),
      ),
    ),
  );
}
```

### Naming Conventions
- **Screens**: `[Feature]Screen` (e.g., `ProfileScreen`)
- **Organisms**: `[Feature]Content` (e.g., `ProfileContent`)
- **Molecules**: Descriptive names (e.g., `ProfileHeader`, `StatsGrid`)
- **Models**: Singular nouns (e.g., `User`, `Note`, `Session`)
- **Repositories**: `[Model]Repository` (e.g., `UserRepository`)
- **Providers**: `[Feature]DataProvider` (e.g., `HomeDataProvider`)

### Component Props
- Pass data down, callbacks up
- Keep prop lists focused and minimal
- Use required for essential props
- Provide sensible defaults with `@Default()`

```dart
class ProfileHeader extends StatelessWidget {
  final String userName;           // Required data
  final String userBio;           // Required data  
  final Function(String) onNameChanged; // Callback up
  final Function(String) onBioChanged;  // Callback up
  
  const ProfileHeader({
    super.key,
    required this.userName,
    required this.userBio,
    required this.onNameChanged,
    required this.onBioChanged,
  });
}
```

### Testing Strategy
- Unit tests for models and their business logic
- Widget tests for molecules and organisms
- Integration tests for complete user flows
- Mock repositories using interfaces

### Performance Considerations
- Use `const` constructors where possible
- Implement proper `==` and `hashCode` (Freezed handles this)
- Avoid rebuilds with proper state management
- Use `ListView.builder` for large lists

---

This architecture documentation serves as the definitive guide for MindOwl's codebase structure. All new features should follow these patterns, and legacy code should be gradually refactored to match these standards.