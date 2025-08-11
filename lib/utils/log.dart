import 'package:flutter/foundation.dart';
import 'package:loggy/loggy.dart';

mixin MyLog implements LoggyType {
  @override
  Loggy<MyLog> get loggy => Loggy<MyLog>('[$runtimeType]');
}

class Log {
  static void init() {
    Loggy.initLoggy(logPrinter: const MyPrettyPrinter());
  }
}

class MyPrettyPrinter extends LoggyPrinter {
  const MyPrettyPrinter({this.showColors}) : super();

  final bool? showColors;

  bool get _colorize => showColors ?? false;

  static final _levelColors = {
    LogLevel.debug: AnsiColor(
      foregroundColor: AnsiColor.grey(0.5),
      italic: true,
    ),
    LogLevel.info: AnsiColor(foregroundColor: 35),
    LogLevel.warning: AnsiColor(foregroundColor: 214),
    LogLevel.error: AnsiColor(foregroundColor: 196),
  };

  static final _levelPrefixes = {
    LogLevel.debug: '🧐',
    LogLevel.info: '😙',
    LogLevel.warning: '😏',
    LogLevel.error: '🤬',
  };

  static const _defaultPrefix = '🤔';

  @override
  void onLog(LogRecord record) {
    final callerFrame = record.callerFrame == null
        ? ''
        : '(${record.callerFrame?.location})';

    final color = _colorize
        ? levelColor(record.level) ?? AnsiColor()
        : AnsiColor();
    final prefix = levelPrefix(record.level) ?? _defaultPrefix;

    debugPrint(
      color(
        '$prefix ${record.loggerName.contains("Loggy") ? "" : "${record.loggerName} "}$callerFrame${record.message}',
      ),
    );

    if (record.stackTrace != null) {
      // ignore: avoid_print
      print(record.stackTrace);
    }
    if (record.level == LogLevel.error) {
      // Sentry.captureException(
      //   record.message,
      //   stackTrace: record.stackTrace,
      // );
      if (kIsWeb) return;
      if (record.message.contains('[cloud_firestore/permission-denied]')) {
        // this is when we log out because the stream is already connected
        // TODOimprove that but need big change !
        return;
      }
      if (record.message.contains('[firebase_storage/unauthorized]')) {
        // this is when we log out because the stream is already connected
        // TODOimprove that but need big change !
        return;
      }

      // FirebaseCrashlytics.instance.recordError(
      //   record.message,
      //   record.stackTrace,
      //   fatal: true,
      // );
    }
  }

  String? levelPrefix(LogLevel level) {
    return _levelPrefixes[level];
  }

  AnsiColor? levelColor(LogLevel level) {
    return _levelColors[level];
  }
}
