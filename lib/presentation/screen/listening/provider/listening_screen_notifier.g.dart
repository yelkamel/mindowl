// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listening_screen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(ListeningScreenNotifier)
const listeningScreenNotifierProvider = ListeningScreenNotifierProvider._();

final class ListeningScreenNotifierProvider
    extends $NotifierProvider<ListeningScreenNotifier, ListeningScreenState> {
  const ListeningScreenNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listeningScreenNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listeningScreenNotifierHash();

  @$internal
  @override
  ListeningScreenNotifier create() => ListeningScreenNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ListeningScreenState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ListeningScreenState>(value),
    );
  }
}

String _$listeningScreenNotifierHash() =>
    r'18c1158ca4582a2d19279745fb6d743ef8b643a2';

abstract class _$ListeningScreenNotifier
    extends $Notifier<ListeningScreenState> {
  ListeningScreenState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ListeningScreenState, ListeningScreenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ListeningScreenState, ListeningScreenState>,
              ListeningScreenState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
