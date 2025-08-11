// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transcript.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Transcript {

 String get id; String get sessionId; double get startSec; double get endSec; String get text; bool get processed;@TimestampDateTimeConverter() DateTime get createdAt; Map<String, dynamic> get metadata;
/// Create a copy of Transcript
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranscriptCopyWith<Transcript> get copyWith => _$TranscriptCopyWithImpl<Transcript>(this as Transcript, _$identity);

  /// Serializes this Transcript to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Transcript&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.startSec, startSec) || other.startSec == startSec)&&(identical(other.endSec, endSec) || other.endSec == endSec)&&(identical(other.text, text) || other.text == text)&&(identical(other.processed, processed) || other.processed == processed)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sessionId,startSec,endSec,text,processed,createdAt,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'Transcript(id: $id, sessionId: $sessionId, startSec: $startSec, endSec: $endSec, text: $text, processed: $processed, createdAt: $createdAt, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $TranscriptCopyWith<$Res>  {
  factory $TranscriptCopyWith(Transcript value, $Res Function(Transcript) _then) = _$TranscriptCopyWithImpl;
@useResult
$Res call({
 String id, String sessionId, double startSec, double endSec, String text, bool processed,@TimestampDateTimeConverter() DateTime createdAt, Map<String, dynamic> metadata
});




}
/// @nodoc
class _$TranscriptCopyWithImpl<$Res>
    implements $TranscriptCopyWith<$Res> {
  _$TranscriptCopyWithImpl(this._self, this._then);

  final Transcript _self;
  final $Res Function(Transcript) _then;

/// Create a copy of Transcript
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sessionId = null,Object? startSec = null,Object? endSec = null,Object? text = null,Object? processed = null,Object? createdAt = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,startSec: null == startSec ? _self.startSec : startSec // ignore: cast_nullable_to_non_nullable
as double,endSec: null == endSec ? _self.endSec : endSec // ignore: cast_nullable_to_non_nullable
as double,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,processed: null == processed ? _self.processed : processed // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [Transcript].
extension TranscriptPatterns on Transcript {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Transcript value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Transcript() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Transcript value)  $default,){
final _that = this;
switch (_that) {
case _Transcript():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Transcript value)?  $default,){
final _that = this;
switch (_that) {
case _Transcript() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String sessionId,  double startSec,  double endSec,  String text,  bool processed, @TimestampDateTimeConverter()  DateTime createdAt,  Map<String, dynamic> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Transcript() when $default != null:
return $default(_that.id,_that.sessionId,_that.startSec,_that.endSec,_that.text,_that.processed,_that.createdAt,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String sessionId,  double startSec,  double endSec,  String text,  bool processed, @TimestampDateTimeConverter()  DateTime createdAt,  Map<String, dynamic> metadata)  $default,) {final _that = this;
switch (_that) {
case _Transcript():
return $default(_that.id,_that.sessionId,_that.startSec,_that.endSec,_that.text,_that.processed,_that.createdAt,_that.metadata);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String sessionId,  double startSec,  double endSec,  String text,  bool processed, @TimestampDateTimeConverter()  DateTime createdAt,  Map<String, dynamic> metadata)?  $default,) {final _that = this;
switch (_that) {
case _Transcript() when $default != null:
return $default(_that.id,_that.sessionId,_that.startSec,_that.endSec,_that.text,_that.processed,_that.createdAt,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Transcript extends Transcript {
  const _Transcript({required this.id, required this.sessionId, required this.startSec, required this.endSec, required this.text, this.processed = false, @TimestampDateTimeConverter() required this.createdAt, final  Map<String, dynamic> metadata = const <String, dynamic>{}}): _metadata = metadata,super._();
  factory _Transcript.fromJson(Map<String, dynamic> json) => _$TranscriptFromJson(json);

@override final  String id;
@override final  String sessionId;
@override final  double startSec;
@override final  double endSec;
@override final  String text;
@override@JsonKey() final  bool processed;
@override@TimestampDateTimeConverter() final  DateTime createdAt;
 final  Map<String, dynamic> _metadata;
@override@JsonKey() Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of Transcript
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TranscriptCopyWith<_Transcript> get copyWith => __$TranscriptCopyWithImpl<_Transcript>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TranscriptToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Transcript&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.startSec, startSec) || other.startSec == startSec)&&(identical(other.endSec, endSec) || other.endSec == endSec)&&(identical(other.text, text) || other.text == text)&&(identical(other.processed, processed) || other.processed == processed)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sessionId,startSec,endSec,text,processed,createdAt,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'Transcript(id: $id, sessionId: $sessionId, startSec: $startSec, endSec: $endSec, text: $text, processed: $processed, createdAt: $createdAt, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$TranscriptCopyWith<$Res> implements $TranscriptCopyWith<$Res> {
  factory _$TranscriptCopyWith(_Transcript value, $Res Function(_Transcript) _then) = __$TranscriptCopyWithImpl;
@override @useResult
$Res call({
 String id, String sessionId, double startSec, double endSec, String text, bool processed,@TimestampDateTimeConverter() DateTime createdAt, Map<String, dynamic> metadata
});




}
/// @nodoc
class __$TranscriptCopyWithImpl<$Res>
    implements _$TranscriptCopyWith<$Res> {
  __$TranscriptCopyWithImpl(this._self, this._then);

  final _Transcript _self;
  final $Res Function(_Transcript) _then;

/// Create a copy of Transcript
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sessionId = null,Object? startSec = null,Object? endSec = null,Object? text = null,Object? processed = null,Object? createdAt = null,Object? metadata = null,}) {
  return _then(_Transcript(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,startSec: null == startSec ? _self.startSec : startSec // ignore: cast_nullable_to_non_nullable
as double,endSec: null == endSec ? _self.endSec : endSec // ignore: cast_nullable_to_non_nullable
as double,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,processed: null == processed ? _self.processed : processed // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
