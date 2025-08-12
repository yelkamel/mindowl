// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quizflow_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuizFlowScreenState {

 Session? get currentSession; List<SessionExo> get sessionExos; SessionExo? get currentSessionExo; Exo? get currentExo; List<Attempt> get attempts; dynamic get selectedAnswer; int get currentQuestionIndex; int get correctAnswers; bool get isAnswered; bool get isCorrect; bool get isLoading; bool get isQuizCompleted; String? get error; int get timeStarted;
/// Create a copy of QuizFlowScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizFlowScreenStateCopyWith<QuizFlowScreenState> get copyWith => _$QuizFlowScreenStateCopyWithImpl<QuizFlowScreenState>(this as QuizFlowScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizFlowScreenState&&(identical(other.currentSession, currentSession) || other.currentSession == currentSession)&&const DeepCollectionEquality().equals(other.sessionExos, sessionExos)&&(identical(other.currentSessionExo, currentSessionExo) || other.currentSessionExo == currentSessionExo)&&(identical(other.currentExo, currentExo) || other.currentExo == currentExo)&&const DeepCollectionEquality().equals(other.attempts, attempts)&&const DeepCollectionEquality().equals(other.selectedAnswer, selectedAnswer)&&(identical(other.currentQuestionIndex, currentQuestionIndex) || other.currentQuestionIndex == currentQuestionIndex)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.isAnswered, isAnswered) || other.isAnswered == isAnswered)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isQuizCompleted, isQuizCompleted) || other.isQuizCompleted == isQuizCompleted)&&(identical(other.error, error) || other.error == error)&&(identical(other.timeStarted, timeStarted) || other.timeStarted == timeStarted));
}


@override
int get hashCode => Object.hash(runtimeType,currentSession,const DeepCollectionEquality().hash(sessionExos),currentSessionExo,currentExo,const DeepCollectionEquality().hash(attempts),const DeepCollectionEquality().hash(selectedAnswer),currentQuestionIndex,correctAnswers,isAnswered,isCorrect,isLoading,isQuizCompleted,error,timeStarted);

@override
String toString() {
  return 'QuizFlowScreenState(currentSession: $currentSession, sessionExos: $sessionExos, currentSessionExo: $currentSessionExo, currentExo: $currentExo, attempts: $attempts, selectedAnswer: $selectedAnswer, currentQuestionIndex: $currentQuestionIndex, correctAnswers: $correctAnswers, isAnswered: $isAnswered, isCorrect: $isCorrect, isLoading: $isLoading, isQuizCompleted: $isQuizCompleted, error: $error, timeStarted: $timeStarted)';
}


}

/// @nodoc
abstract mixin class $QuizFlowScreenStateCopyWith<$Res>  {
  factory $QuizFlowScreenStateCopyWith(QuizFlowScreenState value, $Res Function(QuizFlowScreenState) _then) = _$QuizFlowScreenStateCopyWithImpl;
@useResult
$Res call({
 Session? currentSession, List<SessionExo> sessionExos, SessionExo? currentSessionExo, Exo? currentExo, List<Attempt> attempts, dynamic selectedAnswer, int currentQuestionIndex, int correctAnswers, bool isAnswered, bool isCorrect, bool isLoading, bool isQuizCompleted, String? error, int timeStarted
});


$SessionCopyWith<$Res>? get currentSession;$SessionExoCopyWith<$Res>? get currentSessionExo;$ExoCopyWith<$Res>? get currentExo;

}
/// @nodoc
class _$QuizFlowScreenStateCopyWithImpl<$Res>
    implements $QuizFlowScreenStateCopyWith<$Res> {
  _$QuizFlowScreenStateCopyWithImpl(this._self, this._then);

  final QuizFlowScreenState _self;
  final $Res Function(QuizFlowScreenState) _then;

/// Create a copy of QuizFlowScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentSession = freezed,Object? sessionExos = null,Object? currentSessionExo = freezed,Object? currentExo = freezed,Object? attempts = null,Object? selectedAnswer = freezed,Object? currentQuestionIndex = null,Object? correctAnswers = null,Object? isAnswered = null,Object? isCorrect = null,Object? isLoading = null,Object? isQuizCompleted = null,Object? error = freezed,Object? timeStarted = null,}) {
  return _then(_self.copyWith(
currentSession: freezed == currentSession ? _self.currentSession : currentSession // ignore: cast_nullable_to_non_nullable
as Session?,sessionExos: null == sessionExos ? _self.sessionExos : sessionExos // ignore: cast_nullable_to_non_nullable
as List<SessionExo>,currentSessionExo: freezed == currentSessionExo ? _self.currentSessionExo : currentSessionExo // ignore: cast_nullable_to_non_nullable
as SessionExo?,currentExo: freezed == currentExo ? _self.currentExo : currentExo // ignore: cast_nullable_to_non_nullable
as Exo?,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as List<Attempt>,selectedAnswer: freezed == selectedAnswer ? _self.selectedAnswer : selectedAnswer // ignore: cast_nullable_to_non_nullable
as dynamic,currentQuestionIndex: null == currentQuestionIndex ? _self.currentQuestionIndex : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
as int,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,isAnswered: null == isAnswered ? _self.isAnswered : isAnswered // ignore: cast_nullable_to_non_nullable
as bool,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isQuizCompleted: null == isQuizCompleted ? _self.isQuizCompleted : isQuizCompleted // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,timeStarted: null == timeStarted ? _self.timeStarted : timeStarted // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of QuizFlowScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionCopyWith<$Res>? get currentSession {
    if (_self.currentSession == null) {
    return null;
  }

  return $SessionCopyWith<$Res>(_self.currentSession!, (value) {
    return _then(_self.copyWith(currentSession: value));
  });
}/// Create a copy of QuizFlowScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionExoCopyWith<$Res>? get currentSessionExo {
    if (_self.currentSessionExo == null) {
    return null;
  }

  return $SessionExoCopyWith<$Res>(_self.currentSessionExo!, (value) {
    return _then(_self.copyWith(currentSessionExo: value));
  });
}/// Create a copy of QuizFlowScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExoCopyWith<$Res>? get currentExo {
    if (_self.currentExo == null) {
    return null;
  }

  return $ExoCopyWith<$Res>(_self.currentExo!, (value) {
    return _then(_self.copyWith(currentExo: value));
  });
}
}


/// Adds pattern-matching-related methods to [QuizFlowScreenState].
extension QuizFlowScreenStatePatterns on QuizFlowScreenState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizFlowScreenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizFlowScreenState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizFlowScreenState value)  $default,){
final _that = this;
switch (_that) {
case _QuizFlowScreenState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizFlowScreenState value)?  $default,){
final _that = this;
switch (_that) {
case _QuizFlowScreenState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Session? currentSession,  List<SessionExo> sessionExos,  SessionExo? currentSessionExo,  Exo? currentExo,  List<Attempt> attempts,  dynamic selectedAnswer,  int currentQuestionIndex,  int correctAnswers,  bool isAnswered,  bool isCorrect,  bool isLoading,  bool isQuizCompleted,  String? error,  int timeStarted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizFlowScreenState() when $default != null:
return $default(_that.currentSession,_that.sessionExos,_that.currentSessionExo,_that.currentExo,_that.attempts,_that.selectedAnswer,_that.currentQuestionIndex,_that.correctAnswers,_that.isAnswered,_that.isCorrect,_that.isLoading,_that.isQuizCompleted,_that.error,_that.timeStarted);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Session? currentSession,  List<SessionExo> sessionExos,  SessionExo? currentSessionExo,  Exo? currentExo,  List<Attempt> attempts,  dynamic selectedAnswer,  int currentQuestionIndex,  int correctAnswers,  bool isAnswered,  bool isCorrect,  bool isLoading,  bool isQuizCompleted,  String? error,  int timeStarted)  $default,) {final _that = this;
switch (_that) {
case _QuizFlowScreenState():
return $default(_that.currentSession,_that.sessionExos,_that.currentSessionExo,_that.currentExo,_that.attempts,_that.selectedAnswer,_that.currentQuestionIndex,_that.correctAnswers,_that.isAnswered,_that.isCorrect,_that.isLoading,_that.isQuizCompleted,_that.error,_that.timeStarted);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Session? currentSession,  List<SessionExo> sessionExos,  SessionExo? currentSessionExo,  Exo? currentExo,  List<Attempt> attempts,  dynamic selectedAnswer,  int currentQuestionIndex,  int correctAnswers,  bool isAnswered,  bool isCorrect,  bool isLoading,  bool isQuizCompleted,  String? error,  int timeStarted)?  $default,) {final _that = this;
switch (_that) {
case _QuizFlowScreenState() when $default != null:
return $default(_that.currentSession,_that.sessionExos,_that.currentSessionExo,_that.currentExo,_that.attempts,_that.selectedAnswer,_that.currentQuestionIndex,_that.correctAnswers,_that.isAnswered,_that.isCorrect,_that.isLoading,_that.isQuizCompleted,_that.error,_that.timeStarted);case _:
  return null;

}
}

}

/// @nodoc


class _QuizFlowScreenState extends QuizFlowScreenState {
  const _QuizFlowScreenState({this.currentSession, final  List<SessionExo> sessionExos = const [], this.currentSessionExo, this.currentExo, final  List<Attempt> attempts = const [], this.selectedAnswer, this.currentQuestionIndex = 0, this.correctAnswers = 0, this.isAnswered = false, this.isCorrect = false, this.isLoading = false, this.isQuizCompleted = false, this.error, this.timeStarted = 0}): _sessionExos = sessionExos,_attempts = attempts,super._();
  

@override final  Session? currentSession;
 final  List<SessionExo> _sessionExos;
@override@JsonKey() List<SessionExo> get sessionExos {
  if (_sessionExos is EqualUnmodifiableListView) return _sessionExos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessionExos);
}

@override final  SessionExo? currentSessionExo;
@override final  Exo? currentExo;
 final  List<Attempt> _attempts;
@override@JsonKey() List<Attempt> get attempts {
  if (_attempts is EqualUnmodifiableListView) return _attempts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attempts);
}

@override final  dynamic selectedAnswer;
@override@JsonKey() final  int currentQuestionIndex;
@override@JsonKey() final  int correctAnswers;
@override@JsonKey() final  bool isAnswered;
@override@JsonKey() final  bool isCorrect;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isQuizCompleted;
@override final  String? error;
@override@JsonKey() final  int timeStarted;

/// Create a copy of QuizFlowScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizFlowScreenStateCopyWith<_QuizFlowScreenState> get copyWith => __$QuizFlowScreenStateCopyWithImpl<_QuizFlowScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizFlowScreenState&&(identical(other.currentSession, currentSession) || other.currentSession == currentSession)&&const DeepCollectionEquality().equals(other._sessionExos, _sessionExos)&&(identical(other.currentSessionExo, currentSessionExo) || other.currentSessionExo == currentSessionExo)&&(identical(other.currentExo, currentExo) || other.currentExo == currentExo)&&const DeepCollectionEquality().equals(other._attempts, _attempts)&&const DeepCollectionEquality().equals(other.selectedAnswer, selectedAnswer)&&(identical(other.currentQuestionIndex, currentQuestionIndex) || other.currentQuestionIndex == currentQuestionIndex)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.isAnswered, isAnswered) || other.isAnswered == isAnswered)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isQuizCompleted, isQuizCompleted) || other.isQuizCompleted == isQuizCompleted)&&(identical(other.error, error) || other.error == error)&&(identical(other.timeStarted, timeStarted) || other.timeStarted == timeStarted));
}


@override
int get hashCode => Object.hash(runtimeType,currentSession,const DeepCollectionEquality().hash(_sessionExos),currentSessionExo,currentExo,const DeepCollectionEquality().hash(_attempts),const DeepCollectionEquality().hash(selectedAnswer),currentQuestionIndex,correctAnswers,isAnswered,isCorrect,isLoading,isQuizCompleted,error,timeStarted);

@override
String toString() {
  return 'QuizFlowScreenState(currentSession: $currentSession, sessionExos: $sessionExos, currentSessionExo: $currentSessionExo, currentExo: $currentExo, attempts: $attempts, selectedAnswer: $selectedAnswer, currentQuestionIndex: $currentQuestionIndex, correctAnswers: $correctAnswers, isAnswered: $isAnswered, isCorrect: $isCorrect, isLoading: $isLoading, isQuizCompleted: $isQuizCompleted, error: $error, timeStarted: $timeStarted)';
}


}

/// @nodoc
abstract mixin class _$QuizFlowScreenStateCopyWith<$Res> implements $QuizFlowScreenStateCopyWith<$Res> {
  factory _$QuizFlowScreenStateCopyWith(_QuizFlowScreenState value, $Res Function(_QuizFlowScreenState) _then) = __$QuizFlowScreenStateCopyWithImpl;
@override @useResult
$Res call({
 Session? currentSession, List<SessionExo> sessionExos, SessionExo? currentSessionExo, Exo? currentExo, List<Attempt> attempts, dynamic selectedAnswer, int currentQuestionIndex, int correctAnswers, bool isAnswered, bool isCorrect, bool isLoading, bool isQuizCompleted, String? error, int timeStarted
});


@override $SessionCopyWith<$Res>? get currentSession;@override $SessionExoCopyWith<$Res>? get currentSessionExo;@override $ExoCopyWith<$Res>? get currentExo;

}
/// @nodoc
class __$QuizFlowScreenStateCopyWithImpl<$Res>
    implements _$QuizFlowScreenStateCopyWith<$Res> {
  __$QuizFlowScreenStateCopyWithImpl(this._self, this._then);

  final _QuizFlowScreenState _self;
  final $Res Function(_QuizFlowScreenState) _then;

/// Create a copy of QuizFlowScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentSession = freezed,Object? sessionExos = null,Object? currentSessionExo = freezed,Object? currentExo = freezed,Object? attempts = null,Object? selectedAnswer = freezed,Object? currentQuestionIndex = null,Object? correctAnswers = null,Object? isAnswered = null,Object? isCorrect = null,Object? isLoading = null,Object? isQuizCompleted = null,Object? error = freezed,Object? timeStarted = null,}) {
  return _then(_QuizFlowScreenState(
currentSession: freezed == currentSession ? _self.currentSession : currentSession // ignore: cast_nullable_to_non_nullable
as Session?,sessionExos: null == sessionExos ? _self._sessionExos : sessionExos // ignore: cast_nullable_to_non_nullable
as List<SessionExo>,currentSessionExo: freezed == currentSessionExo ? _self.currentSessionExo : currentSessionExo // ignore: cast_nullable_to_non_nullable
as SessionExo?,currentExo: freezed == currentExo ? _self.currentExo : currentExo // ignore: cast_nullable_to_non_nullable
as Exo?,attempts: null == attempts ? _self._attempts : attempts // ignore: cast_nullable_to_non_nullable
as List<Attempt>,selectedAnswer: freezed == selectedAnswer ? _self.selectedAnswer : selectedAnswer // ignore: cast_nullable_to_non_nullable
as dynamic,currentQuestionIndex: null == currentQuestionIndex ? _self.currentQuestionIndex : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
as int,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,isAnswered: null == isAnswered ? _self.isAnswered : isAnswered // ignore: cast_nullable_to_non_nullable
as bool,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isQuizCompleted: null == isQuizCompleted ? _self.isQuizCompleted : isQuizCompleted // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,timeStarted: null == timeStarted ? _self.timeStarted : timeStarted // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of QuizFlowScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionCopyWith<$Res>? get currentSession {
    if (_self.currentSession == null) {
    return null;
  }

  return $SessionCopyWith<$Res>(_self.currentSession!, (value) {
    return _then(_self.copyWith(currentSession: value));
  });
}/// Create a copy of QuizFlowScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionExoCopyWith<$Res>? get currentSessionExo {
    if (_self.currentSessionExo == null) {
    return null;
  }

  return $SessionExoCopyWith<$Res>(_self.currentSessionExo!, (value) {
    return _then(_self.copyWith(currentSessionExo: value));
  });
}/// Create a copy of QuizFlowScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExoCopyWith<$Res>? get currentExo {
    if (_self.currentExo == null) {
    return null;
  }

  return $ExoCopyWith<$Res>(_self.currentExo!, (value) {
    return _then(_self.copyWith(currentExo: value));
  });
}
}

// dart format on
