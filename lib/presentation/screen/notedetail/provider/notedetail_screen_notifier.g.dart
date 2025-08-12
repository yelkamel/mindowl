// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notedetail_screen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(NoteDetailScreenNotifier)
const noteDetailScreenNotifierProvider = NoteDetailScreenNotifierProvider._();

final class NoteDetailScreenNotifierProvider
    extends $NotifierProvider<NoteDetailScreenNotifier, NoteDetailScreenState> {
  const NoteDetailScreenNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'noteDetailScreenNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$noteDetailScreenNotifierHash();

  @$internal
  @override
  NoteDetailScreenNotifier create() => NoteDetailScreenNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NoteDetailScreenState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NoteDetailScreenState>(value),
    );
  }
}

String _$noteDetailScreenNotifierHash() =>
    r'4c1e218f89253ef7f765beeffadbe9cedf932cec';

abstract class _$NoteDetailScreenNotifier
    extends $Notifier<NoteDetailScreenState> {
  NoteDetailScreenState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<NoteDetailScreenState, NoteDetailScreenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NoteDetailScreenState, NoteDetailScreenState>,
              NoteDetailScreenState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
