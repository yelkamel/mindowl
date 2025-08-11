// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Session {

 String get id; String get noteId; String get title; SessionType get type; SessionStatus get status;@TimestampDateTimeConverter() DateTime get createdAt;@NullableTimestampDateTimeConverter() DateTime? get startedAt;@NullableTimestampDateTimeConverter() DateTime? get endedAt;@NullableTimestampDateTimeConverter() DateTime? get lastSeenExoCreatedAt; Map<String, dynamic> get metadata;// Legacy fields for backward compatibility
 String? get source;// podcast, video, audio
 String? get platform;// spotify, youtube, etc.
@TimestampDateTimeConverter() DateTime? get date; int? get duration;// seconds
 double? get liveScore; String? get context; List<String> get exoIds;// Quiz-specific attributes
@NullableTimestampDateTimeConverter() DateTime? get completedAt; int? get totalQuestions; int? get currentQuestionIndex; double? get finalScore; int? get correctAnswers;
/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionCopyWith<Session> get copyWith => _$SessionCopyWithImpl<Session>(this as Session, _$identity);

  /// Serializes this Session to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Session&&(identical(other.id, id) || other.id == id)&&(identical(other.noteId, noteId) || other.noteId == noteId)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.lastSeenExoCreatedAt, lastSeenExoCreatedAt) || other.lastSeenExoCreatedAt == lastSeenExoCreatedAt)&&const DeepCollectionEquality().equals(other.metadata, metadata)&&(identical(other.source, source) || other.source == source)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.date, date) || other.date == date)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.liveScore, liveScore) || other.liveScore == liveScore)&&(identical(other.context, context) || other.context == context)&&const DeepCollectionEquality().equals(other.exoIds, exoIds)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.totalQuestions, totalQuestions) || other.totalQuestions == totalQuestions)&&(identical(other.currentQuestionIndex, currentQuestionIndex) || other.currentQuestionIndex == currentQuestionIndex)&&(identical(other.finalScore, finalScore) || other.finalScore == finalScore)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,noteId,title,type,status,createdAt,startedAt,endedAt,lastSeenExoCreatedAt,const DeepCollectionEquality().hash(metadata),source,platform,date,duration,liveScore,context,const DeepCollectionEquality().hash(exoIds),completedAt,totalQuestions,currentQuestionIndex,finalScore,correctAnswers]);

@override
String toString() {
  return 'Session(id: $id, noteId: $noteId, title: $title, type: $type, status: $status, createdAt: $createdAt, startedAt: $startedAt, endedAt: $endedAt, lastSeenExoCreatedAt: $lastSeenExoCreatedAt, metadata: $metadata, source: $source, platform: $platform, date: $date, duration: $duration, liveScore: $liveScore, context: $context, exoIds: $exoIds, completedAt: $completedAt, totalQuestions: $totalQuestions, currentQuestionIndex: $currentQuestionIndex, finalScore: $finalScore, correctAnswers: $correctAnswers)';
}


}

/// @nodoc
abstract mixin class $SessionCopyWith<$Res>  {
  factory $SessionCopyWith(Session value, $Res Function(Session) _then) = _$SessionCopyWithImpl;
@useResult
$Res call({
 String id, String noteId, String title, SessionType type, SessionStatus status,@TimestampDateTimeConverter() DateTime createdAt,@NullableTimestampDateTimeConverter() DateTime? startedAt,@NullableTimestampDateTimeConverter() DateTime? endedAt,@NullableTimestampDateTimeConverter() DateTime? lastSeenExoCreatedAt, Map<String, dynamic> metadata, String? source, String? platform,@TimestampDateTimeConverter() DateTime? date, int? duration, double? liveScore, String? context, List<String> exoIds,@NullableTimestampDateTimeConverter() DateTime? completedAt, int? totalQuestions, int? currentQuestionIndex, double? finalScore, int? correctAnswers
});




}
/// @nodoc
class _$SessionCopyWithImpl<$Res>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._self, this._then);

  final Session _self;
  final $Res Function(Session) _then;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? noteId = null,Object? title = null,Object? type = null,Object? status = null,Object? createdAt = null,Object? startedAt = freezed,Object? endedAt = freezed,Object? lastSeenExoCreatedAt = freezed,Object? metadata = null,Object? source = freezed,Object? platform = freezed,Object? date = freezed,Object? duration = freezed,Object? liveScore = freezed,Object? context = freezed,Object? exoIds = null,Object? completedAt = freezed,Object? totalQuestions = freezed,Object? currentQuestionIndex = freezed,Object? finalScore = freezed,Object? correctAnswers = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,noteId: null == noteId ? _self.noteId : noteId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SessionType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SessionStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastSeenExoCreatedAt: freezed == lastSeenExoCreatedAt ? _self.lastSeenExoCreatedAt : lastSeenExoCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,liveScore: freezed == liveScore ? _self.liveScore : liveScore // ignore: cast_nullable_to_non_nullable
as double?,context: freezed == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as String?,exoIds: null == exoIds ? _self.exoIds : exoIds // ignore: cast_nullable_to_non_nullable
as List<String>,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,totalQuestions: freezed == totalQuestions ? _self.totalQuestions : totalQuestions // ignore: cast_nullable_to_non_nullable
as int?,currentQuestionIndex: freezed == currentQuestionIndex ? _self.currentQuestionIndex : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
as int?,finalScore: freezed == finalScore ? _self.finalScore : finalScore // ignore: cast_nullable_to_non_nullable
as double?,correctAnswers: freezed == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Session].
extension SessionPatterns on Session {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Session value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Session() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Session value)  $default,){
final _that = this;
switch (_that) {
case _Session():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Session value)?  $default,){
final _that = this;
switch (_that) {
case _Session() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String noteId,  String title,  SessionType type,  SessionStatus status, @TimestampDateTimeConverter()  DateTime createdAt, @NullableTimestampDateTimeConverter()  DateTime? startedAt, @NullableTimestampDateTimeConverter()  DateTime? endedAt, @NullableTimestampDateTimeConverter()  DateTime? lastSeenExoCreatedAt,  Map<String, dynamic> metadata,  String? source,  String? platform, @TimestampDateTimeConverter()  DateTime? date,  int? duration,  double? liveScore,  String? context,  List<String> exoIds, @NullableTimestampDateTimeConverter()  DateTime? completedAt,  int? totalQuestions,  int? currentQuestionIndex,  double? finalScore,  int? correctAnswers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Session() when $default != null:
return $default(_that.id,_that.noteId,_that.title,_that.type,_that.status,_that.createdAt,_that.startedAt,_that.endedAt,_that.lastSeenExoCreatedAt,_that.metadata,_that.source,_that.platform,_that.date,_that.duration,_that.liveScore,_that.context,_that.exoIds,_that.completedAt,_that.totalQuestions,_that.currentQuestionIndex,_that.finalScore,_that.correctAnswers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String noteId,  String title,  SessionType type,  SessionStatus status, @TimestampDateTimeConverter()  DateTime createdAt, @NullableTimestampDateTimeConverter()  DateTime? startedAt, @NullableTimestampDateTimeConverter()  DateTime? endedAt, @NullableTimestampDateTimeConverter()  DateTime? lastSeenExoCreatedAt,  Map<String, dynamic> metadata,  String? source,  String? platform, @TimestampDateTimeConverter()  DateTime? date,  int? duration,  double? liveScore,  String? context,  List<String> exoIds, @NullableTimestampDateTimeConverter()  DateTime? completedAt,  int? totalQuestions,  int? currentQuestionIndex,  double? finalScore,  int? correctAnswers)  $default,) {final _that = this;
switch (_that) {
case _Session():
return $default(_that.id,_that.noteId,_that.title,_that.type,_that.status,_that.createdAt,_that.startedAt,_that.endedAt,_that.lastSeenExoCreatedAt,_that.metadata,_that.source,_that.platform,_that.date,_that.duration,_that.liveScore,_that.context,_that.exoIds,_that.completedAt,_that.totalQuestions,_that.currentQuestionIndex,_that.finalScore,_that.correctAnswers);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String noteId,  String title,  SessionType type,  SessionStatus status, @TimestampDateTimeConverter()  DateTime createdAt, @NullableTimestampDateTimeConverter()  DateTime? startedAt, @NullableTimestampDateTimeConverter()  DateTime? endedAt, @NullableTimestampDateTimeConverter()  DateTime? lastSeenExoCreatedAt,  Map<String, dynamic> metadata,  String? source,  String? platform, @TimestampDateTimeConverter()  DateTime? date,  int? duration,  double? liveScore,  String? context,  List<String> exoIds, @NullableTimestampDateTimeConverter()  DateTime? completedAt,  int? totalQuestions,  int? currentQuestionIndex,  double? finalScore,  int? correctAnswers)?  $default,) {final _that = this;
switch (_that) {
case _Session() when $default != null:
return $default(_that.id,_that.noteId,_that.title,_that.type,_that.status,_that.createdAt,_that.startedAt,_that.endedAt,_that.lastSeenExoCreatedAt,_that.metadata,_that.source,_that.platform,_that.date,_that.duration,_that.liveScore,_that.context,_that.exoIds,_that.completedAt,_that.totalQuestions,_that.currentQuestionIndex,_that.finalScore,_that.correctAnswers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Session extends Session {
  const _Session({required this.id, required this.noteId, required this.title, required this.type, this.status = SessionStatus.idle, @TimestampDateTimeConverter() required this.createdAt, @NullableTimestampDateTimeConverter() this.startedAt, @NullableTimestampDateTimeConverter() this.endedAt, @NullableTimestampDateTimeConverter() this.lastSeenExoCreatedAt, final  Map<String, dynamic> metadata = const <String, dynamic>{}, this.source, this.platform, @TimestampDateTimeConverter() this.date, this.duration, this.liveScore, this.context, final  List<String> exoIds = const <String>[], @NullableTimestampDateTimeConverter() this.completedAt, this.totalQuestions, this.currentQuestionIndex, this.finalScore, this.correctAnswers}): _metadata = metadata,_exoIds = exoIds,super._();
  factory _Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);

@override final  String id;
@override final  String noteId;
@override final  String title;
@override final  SessionType type;
@override@JsonKey() final  SessionStatus status;
@override@TimestampDateTimeConverter() final  DateTime createdAt;
@override@NullableTimestampDateTimeConverter() final  DateTime? startedAt;
@override@NullableTimestampDateTimeConverter() final  DateTime? endedAt;
@override@NullableTimestampDateTimeConverter() final  DateTime? lastSeenExoCreatedAt;
 final  Map<String, dynamic> _metadata;
@override@JsonKey() Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}

// Legacy fields for backward compatibility
@override final  String? source;
// podcast, video, audio
@override final  String? platform;
// spotify, youtube, etc.
@override@TimestampDateTimeConverter() final  DateTime? date;
@override final  int? duration;
// seconds
@override final  double? liveScore;
@override final  String? context;
 final  List<String> _exoIds;
@override@JsonKey() List<String> get exoIds {
  if (_exoIds is EqualUnmodifiableListView) return _exoIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exoIds);
}

// Quiz-specific attributes
@override@NullableTimestampDateTimeConverter() final  DateTime? completedAt;
@override final  int? totalQuestions;
@override final  int? currentQuestionIndex;
@override final  double? finalScore;
@override final  int? correctAnswers;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionCopyWith<_Session> get copyWith => __$SessionCopyWithImpl<_Session>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Session&&(identical(other.id, id) || other.id == id)&&(identical(other.noteId, noteId) || other.noteId == noteId)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.lastSeenExoCreatedAt, lastSeenExoCreatedAt) || other.lastSeenExoCreatedAt == lastSeenExoCreatedAt)&&const DeepCollectionEquality().equals(other._metadata, _metadata)&&(identical(other.source, source) || other.source == source)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.date, date) || other.date == date)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.liveScore, liveScore) || other.liveScore == liveScore)&&(identical(other.context, context) || other.context == context)&&const DeepCollectionEquality().equals(other._exoIds, _exoIds)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.totalQuestions, totalQuestions) || other.totalQuestions == totalQuestions)&&(identical(other.currentQuestionIndex, currentQuestionIndex) || other.currentQuestionIndex == currentQuestionIndex)&&(identical(other.finalScore, finalScore) || other.finalScore == finalScore)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,noteId,title,type,status,createdAt,startedAt,endedAt,lastSeenExoCreatedAt,const DeepCollectionEquality().hash(_metadata),source,platform,date,duration,liveScore,context,const DeepCollectionEquality().hash(_exoIds),completedAt,totalQuestions,currentQuestionIndex,finalScore,correctAnswers]);

@override
String toString() {
  return 'Session(id: $id, noteId: $noteId, title: $title, type: $type, status: $status, createdAt: $createdAt, startedAt: $startedAt, endedAt: $endedAt, lastSeenExoCreatedAt: $lastSeenExoCreatedAt, metadata: $metadata, source: $source, platform: $platform, date: $date, duration: $duration, liveScore: $liveScore, context: $context, exoIds: $exoIds, completedAt: $completedAt, totalQuestions: $totalQuestions, currentQuestionIndex: $currentQuestionIndex, finalScore: $finalScore, correctAnswers: $correctAnswers)';
}


}

/// @nodoc
abstract mixin class _$SessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$SessionCopyWith(_Session value, $Res Function(_Session) _then) = __$SessionCopyWithImpl;
@override @useResult
$Res call({
 String id, String noteId, String title, SessionType type, SessionStatus status,@TimestampDateTimeConverter() DateTime createdAt,@NullableTimestampDateTimeConverter() DateTime? startedAt,@NullableTimestampDateTimeConverter() DateTime? endedAt,@NullableTimestampDateTimeConverter() DateTime? lastSeenExoCreatedAt, Map<String, dynamic> metadata, String? source, String? platform,@TimestampDateTimeConverter() DateTime? date, int? duration, double? liveScore, String? context, List<String> exoIds,@NullableTimestampDateTimeConverter() DateTime? completedAt, int? totalQuestions, int? currentQuestionIndex, double? finalScore, int? correctAnswers
});




}
/// @nodoc
class __$SessionCopyWithImpl<$Res>
    implements _$SessionCopyWith<$Res> {
  __$SessionCopyWithImpl(this._self, this._then);

  final _Session _self;
  final $Res Function(_Session) _then;

/// Create a copy of Session
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? noteId = null,Object? title = null,Object? type = null,Object? status = null,Object? createdAt = null,Object? startedAt = freezed,Object? endedAt = freezed,Object? lastSeenExoCreatedAt = freezed,Object? metadata = null,Object? source = freezed,Object? platform = freezed,Object? date = freezed,Object? duration = freezed,Object? liveScore = freezed,Object? context = freezed,Object? exoIds = null,Object? completedAt = freezed,Object? totalQuestions = freezed,Object? currentQuestionIndex = freezed,Object? finalScore = freezed,Object? correctAnswers = freezed,}) {
  return _then(_Session(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,noteId: null == noteId ? _self.noteId : noteId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SessionType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SessionStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastSeenExoCreatedAt: freezed == lastSeenExoCreatedAt ? _self.lastSeenExoCreatedAt : lastSeenExoCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,liveScore: freezed == liveScore ? _self.liveScore : liveScore // ignore: cast_nullable_to_non_nullable
as double?,context: freezed == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as String?,exoIds: null == exoIds ? _self._exoIds : exoIds // ignore: cast_nullable_to_non_nullable
as List<String>,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,totalQuestions: freezed == totalQuestions ? _self.totalQuestions : totalQuestions // ignore: cast_nullable_to_non_nullable
as int?,currentQuestionIndex: freezed == currentQuestionIndex ? _self.currentQuestionIndex : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
as int?,finalScore: freezed == finalScore ? _self.finalScore : finalScore // ignore: cast_nullable_to_non_nullable
as double?,correctAnswers: freezed == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
