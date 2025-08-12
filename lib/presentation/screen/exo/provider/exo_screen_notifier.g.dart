// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exo_screen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(ExoScreenNotifier)
const exoScreenNotifierProvider = ExoScreenNotifierProvider._();

final class ExoScreenNotifierProvider
    extends $NotifierProvider<ExoScreenNotifier, ExoScreenState> {
  const ExoScreenNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'exoScreenNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$exoScreenNotifierHash();

  @$internal
  @override
  ExoScreenNotifier create() => ExoScreenNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ExoScreenState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ExoScreenState>(value),
    );
  }
}

String _$exoScreenNotifierHash() => r'bdb33f179d20761b55112d0af82e8b4251e92b58';

abstract class _$ExoScreenNotifier extends $Notifier<ExoScreenState> {
  ExoScreenState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ExoScreenState, ExoScreenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ExoScreenState, ExoScreenState>,
              ExoScreenState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
