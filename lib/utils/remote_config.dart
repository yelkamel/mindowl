class RemoteConfig {
  static int getInt(String key) {
    // This would typically read from Firebase Remote Config
    // For now, return default values
    switch (key) {
      case 'nb_streak_max_life':
        return 3;
      default:
        return 0;
    }
  }
}
