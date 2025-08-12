// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quizflow_screen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(QuizFlowScreenNotifier)
const quizFlowScreenNotifierProvider = QuizFlowScreenNotifierProvider._();

final class QuizFlowScreenNotifierProvider
    extends $NotifierProvider<QuizFlowScreenNotifier, QuizFlowScreenState> {
  const QuizFlowScreenNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quizFlowScreenNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quizFlowScreenNotifierHash();

  @$internal
  @override
  QuizFlowScreenNotifier create() => QuizFlowScreenNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuizFlowScreenState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuizFlowScreenState>(value),
    );
  }
}

String _$quizFlowScreenNotifierHash() =>
    r'b9a8db76c292ea0fc83154fb493aa3e502e29d64';

abstract class _$QuizFlowScreenNotifier extends $Notifier<QuizFlowScreenState> {
  QuizFlowScreenState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<QuizFlowScreenState, QuizFlowScreenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<QuizFlowScreenState, QuizFlowScreenState>,
              QuizFlowScreenState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
