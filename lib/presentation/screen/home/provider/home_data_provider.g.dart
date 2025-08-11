// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(HomeDataProvider)
const homeDataProviderProvider = HomeDataProviderProvider._();

final class HomeDataProviderProvider
    extends $NotifierProvider<HomeDataProvider, HomeData> {
  const HomeDataProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeDataProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeDataProviderHash();

  @$internal
  @override
  HomeDataProvider create() => HomeDataProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeData>(value),
    );
  }
}

String _$homeDataProviderHash() => r'0d0dd311b8feb6eb072bbf15360c78c72d3a34c4';

abstract class _$HomeDataProvider extends $Notifier<HomeData> {
  HomeData build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<HomeData, HomeData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<HomeData, HomeData>,
              HomeData,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
