// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mode_selection_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(ModeSelectionNotifier)
const modeSelectionNotifierProvider = ModeSelectionNotifierProvider._();

final class ModeSelectionNotifierProvider
    extends $NotifierProvider<ModeSelectionNotifier, ModeSelectionState> {
  const ModeSelectionNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'modeSelectionNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$modeSelectionNotifierHash();

  @$internal
  @override
  ModeSelectionNotifier create() => ModeSelectionNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ModeSelectionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ModeSelectionState>(value),
    );
  }
}

String _$modeSelectionNotifierHash() =>
    r'2100fb6f5ef9be588549f2b8e9b68b3b034633c7';

abstract class _$ModeSelectionNotifier extends $Notifier<ModeSelectionState> {
  ModeSelectionState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ModeSelectionState, ModeSelectionState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ModeSelectionState, ModeSelectionState>,
              ModeSelectionState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
