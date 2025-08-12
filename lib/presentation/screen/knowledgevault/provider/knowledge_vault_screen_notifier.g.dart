// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'knowledge_vault_screen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(KnowledgeVaultScreenNotifier)
const knowledgeVaultScreenNotifierProvider =
    KnowledgeVaultScreenNotifierProvider._();

final class KnowledgeVaultScreenNotifierProvider
    extends
        $NotifierProvider<
          KnowledgeVaultScreenNotifier,
          KnowledgeVaultScreenState
        > {
  const KnowledgeVaultScreenNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'knowledgeVaultScreenNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$knowledgeVaultScreenNotifierHash();

  @$internal
  @override
  KnowledgeVaultScreenNotifier create() => KnowledgeVaultScreenNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(KnowledgeVaultScreenState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<KnowledgeVaultScreenState>(value),
    );
  }
}

String _$knowledgeVaultScreenNotifierHash() =>
    r'212a4de9050515f6b38f4bb3d065b48f3f5cfbca';

abstract class _$KnowledgeVaultScreenNotifier
    extends $Notifier<KnowledgeVaultScreenState> {
  KnowledgeVaultScreenState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<KnowledgeVaultScreenState, KnowledgeVaultScreenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<KnowledgeVaultScreenState, KnowledgeVaultScreenState>,
              KnowledgeVaultScreenState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
