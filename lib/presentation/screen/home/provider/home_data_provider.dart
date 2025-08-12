import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mindowl/data/fake_data.dart';
import 'package:mindowl/repository/injection.dart';
import 'package:mindowl/usecases/watch_note_usecase.dart';
import 'package:mindowl/model/note.dart';
import 'package:mindowl/model/session.dart';
import 'home_data.dart';

part 'home_data_provider.g.dart';

@riverpod
class HomeDataProvider extends _$HomeDataProvider {
  @override
  HomeData build() {
    final uid = authRepo.uid;
    
    if (uid.isEmpty) {
      return HomeData(
        currentStreak: 0,
        currentLevel: 1,
        currentXP: 0,
        maxXP: 100,
        todaySessions: 0,
        totalXP: 0,
        accuracy: 0.0,
        recentNotes: [],
        recentSessions: [],
      );
    }

    // TODO: Replace with real data from repositories when needed
    // For now using fake data but with proper structure
    return HomeData(
      currentStreak: 7,
      currentLevel: 3,
      currentXP: 450,
      maxXP: 600,
      todaySessions: 3,
      totalXP: 2850,
      accuracy: 0.82,
      recentNotes: FakeData.notes.take(3).toList(),
      recentSessions: FakeData.sessions.take(2).toList(),
    );
  }

  void refreshData() {
    ref.invalidateSelf();
  }

  Future<List<Note>> getAllNotes() async {
    final uid = authRepo.uid;
    if (uid.isEmpty) return [];
    
    try {
      return await noteRepo.getAllNotes(uid);
    } catch (e) {
      return [];
    }
  }
}
