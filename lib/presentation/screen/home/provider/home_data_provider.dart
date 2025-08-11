import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mindowl/data/fake_data.dart';
import 'package:mindowl/repository/service/auth_repository.dart';
import 'home_data.dart';

part 'home_data_provider.g.dart';

@riverpod
class HomeDataProvider extends _$HomeDataProvider {
  @override
  HomeData build() {
    final authRepo = AuthRepository();
    final uid = authRepo.uid;

    // TODO: Replace with real data from repositories
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
}
