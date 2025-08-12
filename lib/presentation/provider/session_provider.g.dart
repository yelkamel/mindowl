// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(sessionById)
const sessionByIdProvider = SessionByIdFamily._();

final class SessionByIdProvider
    extends $FunctionalProvider<Session?, Session?, Session?>
    with $Provider<Session?> {
  const SessionByIdProvider._({
    required SessionByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'sessionByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sessionByIdHash();

  @override
  String toString() {
    return r'sessionByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Session?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Session? create(Ref ref) {
    final argument = this.argument as String;
    return sessionById(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Session? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Session?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SessionByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sessionByIdHash() => r'95aaae6e52158b04aa1a4723d6f36af69d905141';

final class SessionByIdFamily extends $Family
    with $FunctionalFamilyOverride<Session?, String> {
  const SessionByIdFamily._()
    : super(
        retry: null,
        name: r'sessionByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SessionByIdProvider call(String sessionId) =>
      SessionByIdProvider._(argument: sessionId, from: this);

  @override
  String toString() => r'sessionByIdProvider';
}

@ProviderFor(sessionStream)
const sessionStreamProvider = SessionStreamFamily._();

final class SessionStreamProvider
    extends
        $FunctionalProvider<AsyncValue<Session?>, Session?, Stream<Session?>>
    with $FutureModifier<Session?>, $StreamProvider<Session?> {
  const SessionStreamProvider._({
    required SessionStreamFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'sessionStreamProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sessionStreamHash();

  @override
  String toString() {
    return r'sessionStreamProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<Session?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Session?> create(Ref ref) {
    final argument = this.argument as String;
    return sessionStream(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SessionStreamProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sessionStreamHash() => r'8c5a1ca20af8822aa894eb1e13b6a02a96d95b68';

final class SessionStreamFamily extends $Family
    with $FunctionalFamilyOverride<Stream<Session?>, String> {
  const SessionStreamFamily._()
    : super(
        retry: null,
        name: r'sessionStreamProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SessionStreamProvider call(String sessionId) =>
      SessionStreamProvider._(argument: sessionId, from: this);

  @override
  String toString() => r'sessionStreamProvider';
}

@ProviderFor(sessionExosById)
const sessionExosByIdProvider = SessionExosByIdFamily._();

final class SessionExosByIdProvider
    extends
        $FunctionalProvider<
          List<SessionExo>,
          List<SessionExo>,
          List<SessionExo>
        >
    with $Provider<List<SessionExo>> {
  const SessionExosByIdProvider._({
    required SessionExosByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'sessionExosByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sessionExosByIdHash();

  @override
  String toString() {
    return r'sessionExosByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<SessionExo>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<SessionExo> create(Ref ref) {
    final argument = this.argument as String;
    return sessionExosById(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SessionExo> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SessionExo>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SessionExosByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sessionExosByIdHash() => r'e1165e46eb7dd02243943fd910ba3649b27a8105';

final class SessionExosByIdFamily extends $Family
    with $FunctionalFamilyOverride<List<SessionExo>, String> {
  const SessionExosByIdFamily._()
    : super(
        retry: null,
        name: r'sessionExosByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SessionExosByIdProvider call(String sessionId) =>
      SessionExosByIdProvider._(argument: sessionId, from: this);

  @override
  String toString() => r'sessionExosByIdProvider';
}

@ProviderFor(sessionExosStream)
const sessionExosStreamProvider = SessionExosStreamFamily._();

final class SessionExosStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SessionExo>>,
          List<SessionExo>,
          Stream<List<SessionExo>>
        >
    with $FutureModifier<List<SessionExo>>, $StreamProvider<List<SessionExo>> {
  const SessionExosStreamProvider._({
    required SessionExosStreamFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'sessionExosStreamProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sessionExosStreamHash();

  @override
  String toString() {
    return r'sessionExosStreamProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<SessionExo>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<SessionExo>> create(Ref ref) {
    final argument = this.argument as String;
    return sessionExosStream(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SessionExosStreamProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sessionExosStreamHash() => r'df87706b6e09c15b2ce18302670601d7ba358ac3';

final class SessionExosStreamFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<SessionExo>>, String> {
  const SessionExosStreamFamily._()
    : super(
        retry: null,
        name: r'sessionExosStreamProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SessionExosStreamProvider call(String sessionId) =>
      SessionExosStreamProvider._(argument: sessionId, from: this);

  @override
  String toString() => r'sessionExosStreamProvider';
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
