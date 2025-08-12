// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(getAllUserNotes)
const getAllUserNotesProvider = GetAllUserNotesProvider._();

final class GetAllUserNotesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Note>>,
          List<Note>,
          FutureOr<List<Note>>
        >
    with $FutureModifier<List<Note>>, $FutureProvider<List<Note>> {
  const GetAllUserNotesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getAllUserNotesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getAllUserNotesHash();

  @$internal
  @override
  $FutureProviderElement<List<Note>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Note>> create(Ref ref) {
    return getAllUserNotes(ref);
  }
}

String _$getAllUserNotesHash() => r'984cc3a52c2c77894c0dc94905646840499c9080';

@ProviderFor(noteById)
const noteByIdProvider = NoteByIdFamily._();

final class NoteByIdProvider extends $FunctionalProvider<Note?, Note?, Note?>
    with $Provider<Note?> {
  const NoteByIdProvider._({
    required NoteByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'noteByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$noteByIdHash();

  @override
  String toString() {
    return r'noteByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Note?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Note? create(Ref ref) {
    final argument = this.argument as String;
    return noteById(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Note? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Note?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NoteByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$noteByIdHash() => r'ac315a3bdd70b54dd1e82cc8986f028e6ba9a726';

final class NoteByIdFamily extends $Family
    with $FunctionalFamilyOverride<Note?, String> {
  const NoteByIdFamily._()
    : super(
        retry: null,
        name: r'noteByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  NoteByIdProvider call(String id) =>
      NoteByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'noteByIdProvider';
}

@ProviderFor(noteStream)
const noteStreamProvider = NoteStreamFamily._();

final class NoteStreamProvider
    extends $FunctionalProvider<AsyncValue<Note?>, Note?, Stream<Note?>>
    with $FutureModifier<Note?>, $StreamProvider<Note?> {
  const NoteStreamProvider._({
    required NoteStreamFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'noteStreamProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$noteStreamHash();

  @override
  String toString() {
    return r'noteStreamProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<Note?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Note?> create(Ref ref) {
    final argument = this.argument as String;
    return noteStream(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is NoteStreamProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$noteStreamHash() => r'ae5648e81c92a32297bf0173e8d12f799be1dd7d';

final class NoteStreamFamily extends $Family
    with $FunctionalFamilyOverride<Stream<Note?>, String> {
  const NoteStreamFamily._()
    : super(
        retry: null,
        name: r'noteStreamProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  NoteStreamProvider call(String id) =>
      NoteStreamProvider._(argument: id, from: this);

  @override
  String toString() => r'noteStreamProvider';
}

@ProviderFor(noteExosById)
const noteExosByIdProvider = NoteExosByIdFamily._();

final class NoteExosByIdProvider
    extends $FunctionalProvider<List<Exo>, List<Exo>, List<Exo>>
    with $Provider<List<Exo>> {
  const NoteExosByIdProvider._({
    required NoteExosByIdFamily super.from,
    required (String, {int? limit}) super.argument,
  }) : super(
         retry: null,
         name: r'noteExosByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$noteExosByIdHash();

  @override
  String toString() {
    return r'noteExosByIdProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<Exo>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Exo> create(Ref ref) {
    final argument = this.argument as (String, {int? limit});
    return noteExosById(ref, argument.$1, limit: argument.limit);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Exo> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Exo>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NoteExosByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$noteExosByIdHash() => r'6a05381eb11ec6456f3f128227c1e7afa72767a8';

final class NoteExosByIdFamily extends $Family
    with $FunctionalFamilyOverride<List<Exo>, (String, {int? limit})> {
  const NoteExosByIdFamily._()
    : super(
        retry: null,
        name: r'noteExosByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  NoteExosByIdProvider call(String noteId, {int? limit}) =>
      NoteExosByIdProvider._(argument: (noteId, limit: limit), from: this);

  @override
  String toString() => r'noteExosByIdProvider';
}

@ProviderFor(noteExosStream)
const noteExosStreamProvider = NoteExosStreamFamily._();

final class NoteExosStreamProvider
    extends
        $FunctionalProvider<AsyncValue<List<Exo>>, List<Exo>, Stream<List<Exo>>>
    with $FutureModifier<List<Exo>>, $StreamProvider<List<Exo>> {
  const NoteExosStreamProvider._({
    required NoteExosStreamFamily super.from,
    required (String, {int? limit}) super.argument,
  }) : super(
         retry: null,
         name: r'noteExosStreamProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$noteExosStreamHash();

  @override
  String toString() {
    return r'noteExosStreamProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<List<Exo>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Exo>> create(Ref ref) {
    final argument = this.argument as (String, {int? limit});
    return noteExosStream(ref, argument.$1, limit: argument.limit);
  }

  @override
  bool operator ==(Object other) {
    return other is NoteExosStreamProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$noteExosStreamHash() => r'100d653d779bbc48e88c0d2f9748793c9416b018';

final class NoteExosStreamFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<Exo>>, (String, {int? limit})> {
  const NoteExosStreamFamily._()
    : super(
        retry: null,
        name: r'noteExosStreamProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  NoteExosStreamProvider call(String noteId, {int? limit}) =>
      NoteExosStreamProvider._(argument: (noteId, limit: limit), from: this);

  @override
  String toString() => r'noteExosStreamProvider';
}

@ProviderFor(exoAttemptsById)
const exoAttemptsByIdProvider = ExoAttemptsByIdFamily._();

final class ExoAttemptsByIdProvider
    extends $FunctionalProvider<List<Attempt>, List<Attempt>, List<Attempt>>
    with $Provider<List<Attempt>> {
  const ExoAttemptsByIdProvider._({
    required ExoAttemptsByIdFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'exoAttemptsByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$exoAttemptsByIdHash();

  @override
  String toString() {
    return r'exoAttemptsByIdProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<Attempt>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Attempt> create(Ref ref) {
    final argument = this.argument as (String, String);
    return exoAttemptsById(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Attempt> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Attempt>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ExoAttemptsByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$exoAttemptsByIdHash() => r'708e5d6b4a9f0232d0d4916bdf774a9815c975e5';

final class ExoAttemptsByIdFamily extends $Family
    with $FunctionalFamilyOverride<List<Attempt>, (String, String)> {
  const ExoAttemptsByIdFamily._()
    : super(
        retry: null,
        name: r'exoAttemptsByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ExoAttemptsByIdProvider call(String noteId, String exoId) =>
      ExoAttemptsByIdProvider._(argument: (noteId, exoId), from: this);

  @override
  String toString() => r'exoAttemptsByIdProvider';
}

@ProviderFor(exoAttemptsStream)
const exoAttemptsStreamProvider = ExoAttemptsStreamFamily._();

final class ExoAttemptsStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Attempt>>,
          List<Attempt>,
          Stream<List<Attempt>>
        >
    with $FutureModifier<List<Attempt>>, $StreamProvider<List<Attempt>> {
  const ExoAttemptsStreamProvider._({
    required ExoAttemptsStreamFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'exoAttemptsStreamProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$exoAttemptsStreamHash();

  @override
  String toString() {
    return r'exoAttemptsStreamProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<List<Attempt>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Attempt>> create(Ref ref) {
    final argument = this.argument as (String, String);
    return exoAttemptsStream(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is ExoAttemptsStreamProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$exoAttemptsStreamHash() => r'957838e05eb205ea3528015d068e2d3d4a3b17f8';

final class ExoAttemptsStreamFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<Attempt>>, (String, String)> {
  const ExoAttemptsStreamFamily._()
    : super(
        retry: null,
        name: r'exoAttemptsStreamProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ExoAttemptsStreamProvider call(String noteId, String exoId) =>
      ExoAttemptsStreamProvider._(argument: (noteId, exoId), from: this);

  @override
  String toString() => r'exoAttemptsStreamProvider';
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
