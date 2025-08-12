// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exo_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExoScreenState {

 SessionExo? get currentSessionExo; Exo? get currentExo; List<Attempt> get attempts; dynamic get selectedAnswer; bool get isAnswered; bool get isCorrect; bool get isLoading; String? get error; int get timeStarted;
/// Create a copy of ExoScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExoScreenStateCopyWith<ExoScreenState> get copyWith => _$ExoScreenStateCopyWithImpl<ExoScreenState>(this as ExoScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExoScreenState&&(identical(other.currentSessionExo, currentSessionExo) || other.currentSessionExo == currentSessionExo)&&(identical(other.currentExo, currentExo) || other.currentExo == currentExo)&&const DeepCollectionEquality().equals(other.attempts, attempts)&&const DeepCollectionEquality().equals(other.selectedAnswer, selectedAnswer)&&(identical(other.isAnswered, isAnswered) || other.isAnswered == isAnswered)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.timeStarted, timeStarted) || other.timeStarted == timeStarted));
}


@override
int get hashCode => Object.hash(runtimeType,currentSessionExo,currentExo,const DeepCollectionEquality().hash(attempts),const DeepCollectionEquality().hash(selectedAnswer),isAnswered,isCorrect,isLoading,error,timeStarted);

@override
String toString() {
  return 'ExoScreenState(currentSessionExo: $currentSessionExo, currentExo: $currentExo, attempts: $attempts, selectedAnswer: $selectedAnswer, isAnswered: $isAnswered, isCorrect: $isCorrect, isLoading: $isLoading, error: $error, timeStarted: $timeStarted)';
}


}

/// @nodoc
abstract mixin class $ExoScreenStateCopyWith<$Res>  {
  factory $ExoScreenStateCopyWith(ExoScreenState value, $Res Function(ExoScreenState) _then) = _$ExoScreenStateCopyWithImpl;
@useResult
$Res call({
 SessionExo? currentSessionExo, Exo? currentExo, List<Attempt> attempts, dynamic selectedAnswer, bool isAnswered, bool isCorrect, bool isLoading, String? error, int timeStarted
});


$SessionExoCopyWith<$Res>? get currentSessionExo;$ExoCopyWith<$Res>? get currentExo;

}
/// @nodoc
class _$ExoScreenStateCopyWithImpl<$Res>
    implements $ExoScreenStateCopyWith<$Res> {
  _$ExoScreenStateCopyWithImpl(this._self, this._then);

  final ExoScreenState _self;
  final $Res Function(ExoScreenState) _then;

/// Create a copy of ExoScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentSessionExo = freezed,Object? currentExo = freezed,Object? attempts = null,Object? selectedAnswer = freezed,Object? isAnswered = null,Object? isCorrect = null,Object? isLoading = null,Object? error = freezed,Object? timeStarted = null,}) {
  return _then(_self.copyWith(
currentSessionExo: freezed == currentSessionExo ? _self.currentSessionExo : currentSessionExo // ignore: cast_nullable_to_non_nullable
as SessionExo?,currentExo: freezed == currentExo ? _self.currentExo : currentExo // ignore: cast_nullable_to_non_nullable
as Exo?,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as List<Attempt>,selectedAnswer: freezed == selectedAnswer ? _self.selectedAnswer : selectedAnswer // ignore: cast_nullable_to_non_nullable
as dynamic,isAnswered: null == isAnswered ? _self.isAnswered : isAnswered // ignore: cast_nullable_to_non_nullable
as bool,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,timeStarted: null == timeStarted ? _self.timeStarted : timeStarted // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ExoScreenState
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
}/// Create a copy of ExoScreenState
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


/// Adds pattern-matching-related methods to [ExoScreenState].
extension ExoScreenStatePatterns on ExoScreenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExoScreenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExoScreenState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExoScreenState value)  $default,){
final _that = this;
switch (_that) {
case _ExoScreenState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExoScreenState value)?  $default,){
final _that = this;
switch (_that) {
case _ExoScreenState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SessionExo? currentSessionExo,  Exo? currentExo,  List<Attempt> attempts,  dynamic selectedAnswer,  bool isAnswered,  bool isCorrect,  bool isLoading,  String? error,  int timeStarted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExoScreenState() when $default != null:
return $default(_that.currentSessionExo,_that.currentExo,_that.attempts,_that.selectedAnswer,_that.isAnswered,_that.isCorrect,_that.isLoading,_that.error,_that.timeStarted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SessionExo? currentSessionExo,  Exo? currentExo,  List<Attempt> attempts,  dynamic selectedAnswer,  bool isAnswered,  bool isCorrect,  bool isLoading,  String? error,  int timeStarted)  $default,) {final _that = this;
switch (_that) {
case _ExoScreenState():
return $default(_that.currentSessionExo,_that.currentExo,_that.attempts,_that.selectedAnswer,_that.isAnswered,_that.isCorrect,_that.isLoading,_that.error,_that.timeStarted);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SessionExo? currentSessionExo,  Exo? currentExo,  List<Attempt> attempts,  dynamic selectedAnswer,  bool isAnswered,  bool isCorrect,  bool isLoading,  String? error,  int timeStarted)?  $default,) {final _that = this;
switch (_that) {
case _ExoScreenState() when $default != null:
return $default(_that.currentSessionExo,_that.currentExo,_that.attempts,_that.selectedAnswer,_that.isAnswered,_that.isCorrect,_that.isLoading,_that.error,_that.timeStarted);case _:
  return null;

}
}

}

/// @nodoc


class _ExoScreenState extends ExoScreenState {
  const _ExoScreenState({this.currentSessionExo, this.currentExo, final  List<Attempt> attempts = const [], this.selectedAnswer, this.isAnswered = false, this.isCorrect = false, this.isLoading = false, this.error, this.timeStarted = 0}): _attempts = attempts,super._();
  

@override final  SessionExo? currentSessionExo;
@override final  Exo? currentExo;
 final  List<Attempt> _attempts;
@override@JsonKey() List<Attempt> get attempts {
  if (_attempts is EqualUnmodifiableListView) return _attempts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attempts);
}

@override final  dynamic selectedAnswer;
@override@JsonKey() final  bool isAnswered;
@override@JsonKey() final  bool isCorrect;
@override@JsonKey() final  bool isLoading;
@override final  String? error;
@override@JsonKey() final  int timeStarted;

/// Create a copy of ExoScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExoScreenStateCopyWith<_ExoScreenState> get copyWith => __$ExoScreenStateCopyWithImpl<_ExoScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExoScreenState&&(identical(other.currentSessionExo, currentSessionExo) || other.currentSessionExo == currentSessionExo)&&(identical(other.currentExo, currentExo) || other.currentExo == currentExo)&&const DeepCollectionEquality().equals(other._attempts, _attempts)&&const DeepCollectionEquality().equals(other.selectedAnswer, selectedAnswer)&&(identical(other.isAnswered, isAnswered) || other.isAnswered == isAnswered)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.timeStarted, timeStarted) || other.timeStarted == timeStarted));
}


@override
int get hashCode => Object.hash(runtimeType,currentSessionExo,currentExo,const DeepCollectionEquality().hash(_attempts),const DeepCollectionEquality().hash(selectedAnswer),isAnswered,isCorrect,isLoading,error,timeStarted);

@override
String toString() {
  return 'ExoScreenState(currentSessionExo: $currentSessionExo, currentExo: $currentExo, attempts: $attempts, selectedAnswer: $selectedAnswer, isAnswered: $isAnswered, isCorrect: $isCorrect, isLoading: $isLoading, error: $error, timeStarted: $timeStarted)';
}


}

/// @nodoc
abstract mixin class _$ExoScreenStateCopyWith<$Res> implements $ExoScreenStateCopyWith<$Res> {
  factory _$ExoScreenStateCopyWith(_ExoScreenState value, $Res Function(_ExoScreenState) _then) = __$ExoScreenStateCopyWithImpl;
@override @useResult
$Res call({
 SessionExo? currentSessionExo, Exo? currentExo, List<Attempt> attempts, dynamic selectedAnswer, bool isAnswered, bool isCorrect, bool isLoading, String? error, int timeStarted
});


@override $SessionExoCopyWith<$Res>? get currentSessionExo;@override $ExoCopyWith<$Res>? get currentExo;

}
/// @nodoc
class __$ExoScreenStateCopyWithImpl<$Res>
    implements _$ExoScreenStateCopyWith<$Res> {
  __$ExoScreenStateCopyWithImpl(this._self, this._then);

  final _ExoScreenState _self;
  final $Res Function(_ExoScreenState) _then;

/// Create a copy of ExoScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentSessionExo = freezed,Object? currentExo = freezed,Object? attempts = null,Object? selectedAnswer = freezed,Object? isAnswered = null,Object? isCorrect = null,Object? isLoading = null,Object? error = freezed,Object? timeStarted = null,}) {
  return _then(_ExoScreenState(
currentSessionExo: freezed == currentSessionExo ? _self.currentSessionExo : currentSessionExo // ignore: cast_nullable_to_non_nullable
as SessionExo?,currentExo: freezed == currentExo ? _self.currentExo : currentExo // ignore: cast_nullable_to_non_nullable
as Exo?,attempts: null == attempts ? _self._attempts : attempts // ignore: cast_nullable_to_non_nullable
as List<Attempt>,selectedAnswer: freezed == selectedAnswer ? _self.selectedAnswer : selectedAnswer // ignore: cast_nullable_to_non_nullable
as dynamic,isAnswered: null == isAnswered ? _self.isAnswered : isAnswered // ignore: cast_nullable_to_non_nullable
as bool,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,timeStarted: null == timeStarted ? _self.timeStarted : timeStarted // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ExoScreenState
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
}/// Create a copy of ExoScreenState
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
