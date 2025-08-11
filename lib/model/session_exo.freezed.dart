// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_exo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionExo {

 String get id; String get sessionId; String get noteId; String get exoId;@TimestampDateTimeConverter() DateTime get spawnedAt; SessionExoStatus get status; ExoContent? get snapshotLite;// Optional offline snapshot
 Map<String, dynamic> get metadata;
/// Create a copy of SessionExo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionExoCopyWith<SessionExo> get copyWith => _$SessionExoCopyWithImpl<SessionExo>(this as SessionExo, _$identity);

  /// Serializes this SessionExo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionExo&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.noteId, noteId) || other.noteId == noteId)&&(identical(other.exoId, exoId) || other.exoId == exoId)&&(identical(other.spawnedAt, spawnedAt) || other.spawnedAt == spawnedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.snapshotLite, snapshotLite) || other.snapshotLite == snapshotLite)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sessionId,noteId,exoId,spawnedAt,status,snapshotLite,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'SessionExo(id: $id, sessionId: $sessionId, noteId: $noteId, exoId: $exoId, spawnedAt: $spawnedAt, status: $status, snapshotLite: $snapshotLite, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $SessionExoCopyWith<$Res>  {
  factory $SessionExoCopyWith(SessionExo value, $Res Function(SessionExo) _then) = _$SessionExoCopyWithImpl;
@useResult
$Res call({
 String id, String sessionId, String noteId, String exoId,@TimestampDateTimeConverter() DateTime spawnedAt, SessionExoStatus status, ExoContent? snapshotLite, Map<String, dynamic> metadata
});


$ExoContentCopyWith<$Res>? get snapshotLite;

}
/// @nodoc
class _$SessionExoCopyWithImpl<$Res>
    implements $SessionExoCopyWith<$Res> {
  _$SessionExoCopyWithImpl(this._self, this._then);

  final SessionExo _self;
  final $Res Function(SessionExo) _then;

/// Create a copy of SessionExo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sessionId = null,Object? noteId = null,Object? exoId = null,Object? spawnedAt = null,Object? status = null,Object? snapshotLite = freezed,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,noteId: null == noteId ? _self.noteId : noteId // ignore: cast_nullable_to_non_nullable
as String,exoId: null == exoId ? _self.exoId : exoId // ignore: cast_nullable_to_non_nullable
as String,spawnedAt: null == spawnedAt ? _self.spawnedAt : spawnedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SessionExoStatus,snapshotLite: freezed == snapshotLite ? _self.snapshotLite : snapshotLite // ignore: cast_nullable_to_non_nullable
as ExoContent?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}
/// Create a copy of SessionExo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExoContentCopyWith<$Res>? get snapshotLite {
    if (_self.snapshotLite == null) {
    return null;
  }

  return $ExoContentCopyWith<$Res>(_self.snapshotLite!, (value) {
    return _then(_self.copyWith(snapshotLite: value));
  });
}
}


/// Adds pattern-matching-related methods to [SessionExo].
extension SessionExoPatterns on SessionExo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionExo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionExo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionExo value)  $default,){
final _that = this;
switch (_that) {
case _SessionExo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionExo value)?  $default,){
final _that = this;
switch (_that) {
case _SessionExo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String sessionId,  String noteId,  String exoId, @TimestampDateTimeConverter()  DateTime spawnedAt,  SessionExoStatus status,  ExoContent? snapshotLite,  Map<String, dynamic> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionExo() when $default != null:
return $default(_that.id,_that.sessionId,_that.noteId,_that.exoId,_that.spawnedAt,_that.status,_that.snapshotLite,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String sessionId,  String noteId,  String exoId, @TimestampDateTimeConverter()  DateTime spawnedAt,  SessionExoStatus status,  ExoContent? snapshotLite,  Map<String, dynamic> metadata)  $default,) {final _that = this;
switch (_that) {
case _SessionExo():
return $default(_that.id,_that.sessionId,_that.noteId,_that.exoId,_that.spawnedAt,_that.status,_that.snapshotLite,_that.metadata);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String sessionId,  String noteId,  String exoId, @TimestampDateTimeConverter()  DateTime spawnedAt,  SessionExoStatus status,  ExoContent? snapshotLite,  Map<String, dynamic> metadata)?  $default,) {final _that = this;
switch (_that) {
case _SessionExo() when $default != null:
return $default(_that.id,_that.sessionId,_that.noteId,_that.exoId,_that.spawnedAt,_that.status,_that.snapshotLite,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionExo extends SessionExo {
  const _SessionExo({required this.id, required this.sessionId, required this.noteId, required this.exoId, @TimestampDateTimeConverter() required this.spawnedAt, this.status = SessionExoStatus.pending, this.snapshotLite, final  Map<String, dynamic> metadata = const <String, dynamic>{}}): _metadata = metadata,super._();
  factory _SessionExo.fromJson(Map<String, dynamic> json) => _$SessionExoFromJson(json);

@override final  String id;
@override final  String sessionId;
@override final  String noteId;
@override final  String exoId;
@override@TimestampDateTimeConverter() final  DateTime spawnedAt;
@override@JsonKey() final  SessionExoStatus status;
@override final  ExoContent? snapshotLite;
// Optional offline snapshot
 final  Map<String, dynamic> _metadata;
// Optional offline snapshot
@override@JsonKey() Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of SessionExo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionExoCopyWith<_SessionExo> get copyWith => __$SessionExoCopyWithImpl<_SessionExo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionExoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionExo&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.noteId, noteId) || other.noteId == noteId)&&(identical(other.exoId, exoId) || other.exoId == exoId)&&(identical(other.spawnedAt, spawnedAt) || other.spawnedAt == spawnedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.snapshotLite, snapshotLite) || other.snapshotLite == snapshotLite)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sessionId,noteId,exoId,spawnedAt,status,snapshotLite,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'SessionExo(id: $id, sessionId: $sessionId, noteId: $noteId, exoId: $exoId, spawnedAt: $spawnedAt, status: $status, snapshotLite: $snapshotLite, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$SessionExoCopyWith<$Res> implements $SessionExoCopyWith<$Res> {
  factory _$SessionExoCopyWith(_SessionExo value, $Res Function(_SessionExo) _then) = __$SessionExoCopyWithImpl;
@override @useResult
$Res call({
 String id, String sessionId, String noteId, String exoId,@TimestampDateTimeConverter() DateTime spawnedAt, SessionExoStatus status, ExoContent? snapshotLite, Map<String, dynamic> metadata
});


@override $ExoContentCopyWith<$Res>? get snapshotLite;

}
/// @nodoc
class __$SessionExoCopyWithImpl<$Res>
    implements _$SessionExoCopyWith<$Res> {
  __$SessionExoCopyWithImpl(this._self, this._then);

  final _SessionExo _self;
  final $Res Function(_SessionExo) _then;

/// Create a copy of SessionExo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sessionId = null,Object? noteId = null,Object? exoId = null,Object? spawnedAt = null,Object? status = null,Object? snapshotLite = freezed,Object? metadata = null,}) {
  return _then(_SessionExo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,noteId: null == noteId ? _self.noteId : noteId // ignore: cast_nullable_to_non_nullable
as String,exoId: null == exoId ? _self.exoId : exoId // ignore: cast_nullable_to_non_nullable
as String,spawnedAt: null == spawnedAt ? _self.spawnedAt : spawnedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SessionExoStatus,snapshotLite: freezed == snapshotLite ? _self.snapshotLite : snapshotLite // ignore: cast_nullable_to_non_nullable
as ExoContent?,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

/// Create a copy of SessionExo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExoContentCopyWith<$Res>? get snapshotLite {
    if (_self.snapshotLite == null) {
    return null;
  }

  return $ExoContentCopyWith<$Res>(_self.snapshotLite!, (value) {
    return _then(_self.copyWith(snapshotLite: value));
  });
}
}

// dart format on
