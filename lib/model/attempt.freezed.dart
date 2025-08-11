// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attempt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Attempt {

 String get id; String get sessionId; String get exoId; String get noteId;@TimestampDateTimeConverter() DateTime get answeredAt; bool get isCorrect; int get timeToAnswerMs; dynamic get userAnswer; Map<String, dynamic> get metadata;
/// Create a copy of Attempt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttemptCopyWith<Attempt> get copyWith => _$AttemptCopyWithImpl<Attempt>(this as Attempt, _$identity);

  /// Serializes this Attempt to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Attempt&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.exoId, exoId) || other.exoId == exoId)&&(identical(other.noteId, noteId) || other.noteId == noteId)&&(identical(other.answeredAt, answeredAt) || other.answeredAt == answeredAt)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.timeToAnswerMs, timeToAnswerMs) || other.timeToAnswerMs == timeToAnswerMs)&&const DeepCollectionEquality().equals(other.userAnswer, userAnswer)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sessionId,exoId,noteId,answeredAt,isCorrect,timeToAnswerMs,const DeepCollectionEquality().hash(userAnswer),const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'Attempt(id: $id, sessionId: $sessionId, exoId: $exoId, noteId: $noteId, answeredAt: $answeredAt, isCorrect: $isCorrect, timeToAnswerMs: $timeToAnswerMs, userAnswer: $userAnswer, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $AttemptCopyWith<$Res>  {
  factory $AttemptCopyWith(Attempt value, $Res Function(Attempt) _then) = _$AttemptCopyWithImpl;
@useResult
$Res call({
 String id, String sessionId, String exoId, String noteId,@TimestampDateTimeConverter() DateTime answeredAt, bool isCorrect, int timeToAnswerMs, dynamic userAnswer, Map<String, dynamic> metadata
});




}
/// @nodoc
class _$AttemptCopyWithImpl<$Res>
    implements $AttemptCopyWith<$Res> {
  _$AttemptCopyWithImpl(this._self, this._then);

  final Attempt _self;
  final $Res Function(Attempt) _then;

/// Create a copy of Attempt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sessionId = null,Object? exoId = null,Object? noteId = null,Object? answeredAt = null,Object? isCorrect = null,Object? timeToAnswerMs = null,Object? userAnswer = freezed,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,exoId: null == exoId ? _self.exoId : exoId // ignore: cast_nullable_to_non_nullable
as String,noteId: null == noteId ? _self.noteId : noteId // ignore: cast_nullable_to_non_nullable
as String,answeredAt: null == answeredAt ? _self.answeredAt : answeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,timeToAnswerMs: null == timeToAnswerMs ? _self.timeToAnswerMs : timeToAnswerMs // ignore: cast_nullable_to_non_nullable
as int,userAnswer: freezed == userAnswer ? _self.userAnswer : userAnswer // ignore: cast_nullable_to_non_nullable
as dynamic,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [Attempt].
extension AttemptPatterns on Attempt {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Attempt value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Attempt() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Attempt value)  $default,){
final _that = this;
switch (_that) {
case _Attempt():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Attempt value)?  $default,){
final _that = this;
switch (_that) {
case _Attempt() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String sessionId,  String exoId,  String noteId, @TimestampDateTimeConverter()  DateTime answeredAt,  bool isCorrect,  int timeToAnswerMs,  dynamic userAnswer,  Map<String, dynamic> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Attempt() when $default != null:
return $default(_that.id,_that.sessionId,_that.exoId,_that.noteId,_that.answeredAt,_that.isCorrect,_that.timeToAnswerMs,_that.userAnswer,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String sessionId,  String exoId,  String noteId, @TimestampDateTimeConverter()  DateTime answeredAt,  bool isCorrect,  int timeToAnswerMs,  dynamic userAnswer,  Map<String, dynamic> metadata)  $default,) {final _that = this;
switch (_that) {
case _Attempt():
return $default(_that.id,_that.sessionId,_that.exoId,_that.noteId,_that.answeredAt,_that.isCorrect,_that.timeToAnswerMs,_that.userAnswer,_that.metadata);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String sessionId,  String exoId,  String noteId, @TimestampDateTimeConverter()  DateTime answeredAt,  bool isCorrect,  int timeToAnswerMs,  dynamic userAnswer,  Map<String, dynamic> metadata)?  $default,) {final _that = this;
switch (_that) {
case _Attempt() when $default != null:
return $default(_that.id,_that.sessionId,_that.exoId,_that.noteId,_that.answeredAt,_that.isCorrect,_that.timeToAnswerMs,_that.userAnswer,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Attempt extends Attempt {
  const _Attempt({required this.id, required this.sessionId, required this.exoId, required this.noteId, @TimestampDateTimeConverter() required this.answeredAt, required this.isCorrect, required this.timeToAnswerMs, required this.userAnswer, final  Map<String, dynamic> metadata = const <String, dynamic>{}}): _metadata = metadata,super._();
  factory _Attempt.fromJson(Map<String, dynamic> json) => _$AttemptFromJson(json);

@override final  String id;
@override final  String sessionId;
@override final  String exoId;
@override final  String noteId;
@override@TimestampDateTimeConverter() final  DateTime answeredAt;
@override final  bool isCorrect;
@override final  int timeToAnswerMs;
@override final  dynamic userAnswer;
 final  Map<String, dynamic> _metadata;
@override@JsonKey() Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of Attempt
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttemptCopyWith<_Attempt> get copyWith => __$AttemptCopyWithImpl<_Attempt>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttemptToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Attempt&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.exoId, exoId) || other.exoId == exoId)&&(identical(other.noteId, noteId) || other.noteId == noteId)&&(identical(other.answeredAt, answeredAt) || other.answeredAt == answeredAt)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.timeToAnswerMs, timeToAnswerMs) || other.timeToAnswerMs == timeToAnswerMs)&&const DeepCollectionEquality().equals(other.userAnswer, userAnswer)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sessionId,exoId,noteId,answeredAt,isCorrect,timeToAnswerMs,const DeepCollectionEquality().hash(userAnswer),const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'Attempt(id: $id, sessionId: $sessionId, exoId: $exoId, noteId: $noteId, answeredAt: $answeredAt, isCorrect: $isCorrect, timeToAnswerMs: $timeToAnswerMs, userAnswer: $userAnswer, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$AttemptCopyWith<$Res> implements $AttemptCopyWith<$Res> {
  factory _$AttemptCopyWith(_Attempt value, $Res Function(_Attempt) _then) = __$AttemptCopyWithImpl;
@override @useResult
$Res call({
 String id, String sessionId, String exoId, String noteId,@TimestampDateTimeConverter() DateTime answeredAt, bool isCorrect, int timeToAnswerMs, dynamic userAnswer, Map<String, dynamic> metadata
});




}
/// @nodoc
class __$AttemptCopyWithImpl<$Res>
    implements _$AttemptCopyWith<$Res> {
  __$AttemptCopyWithImpl(this._self, this._then);

  final _Attempt _self;
  final $Res Function(_Attempt) _then;

/// Create a copy of Attempt
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sessionId = null,Object? exoId = null,Object? noteId = null,Object? answeredAt = null,Object? isCorrect = null,Object? timeToAnswerMs = null,Object? userAnswer = freezed,Object? metadata = null,}) {
  return _then(_Attempt(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,exoId: null == exoId ? _self.exoId : exoId // ignore: cast_nullable_to_non_nullable
as String,noteId: null == noteId ? _self.noteId : noteId // ignore: cast_nullable_to_non_nullable
as String,answeredAt: null == answeredAt ? _self.answeredAt : answeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,timeToAnswerMs: null == timeToAnswerMs ? _self.timeToAnswerMs : timeToAnswerMs // ignore: cast_nullable_to_non_nullable
as int,userAnswer: freezed == userAnswer ? _self.userAnswer : userAnswer // ignore: cast_nullable_to_non_nullable
as dynamic,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
