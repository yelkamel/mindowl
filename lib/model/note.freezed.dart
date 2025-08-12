// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Note {

 String get id; String get title; String get summary;@TimestampDateTimeConverter() DateTime get createdAt;@TimestampDateTimeConverter() DateTime get updatedAt;@NullableTimestampDateTimeConverter() DateTime? get lastReviewed; List<String> get topics; String get primaryTheme; bool get isFavorite; String get markdownContent; List<String> get relatedNoteIds; List<String> get sessionIds; List<String> get exoIds;
/// Create a copy of Note
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoteCopyWith<Note> get copyWith => _$NoteCopyWithImpl<Note>(this as Note, _$identity);

  /// Serializes this Note to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Note&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastReviewed, lastReviewed) || other.lastReviewed == lastReviewed)&&const DeepCollectionEquality().equals(other.topics, topics)&&(identical(other.primaryTheme, primaryTheme) || other.primaryTheme == primaryTheme)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.markdownContent, markdownContent) || other.markdownContent == markdownContent)&&const DeepCollectionEquality().equals(other.relatedNoteIds, relatedNoteIds)&&const DeepCollectionEquality().equals(other.sessionIds, sessionIds)&&const DeepCollectionEquality().equals(other.exoIds, exoIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,summary,createdAt,updatedAt,lastReviewed,const DeepCollectionEquality().hash(topics),primaryTheme,isFavorite,markdownContent,const DeepCollectionEquality().hash(relatedNoteIds),const DeepCollectionEquality().hash(sessionIds),const DeepCollectionEquality().hash(exoIds));

@override
String toString() {
  return 'Note(id: $id, title: $title, summary: $summary, createdAt: $createdAt, updatedAt: $updatedAt, lastReviewed: $lastReviewed, topics: $topics, primaryTheme: $primaryTheme, isFavorite: $isFavorite, markdownContent: $markdownContent, relatedNoteIds: $relatedNoteIds, sessionIds: $sessionIds, exoIds: $exoIds)';
}


}

/// @nodoc
abstract mixin class $NoteCopyWith<$Res>  {
  factory $NoteCopyWith(Note value, $Res Function(Note) _then) = _$NoteCopyWithImpl;
@useResult
$Res call({
 String id, String title, String summary,@TimestampDateTimeConverter() DateTime createdAt,@TimestampDateTimeConverter() DateTime updatedAt,@NullableTimestampDateTimeConverter() DateTime? lastReviewed, List<String> topics, String primaryTheme, bool isFavorite, String markdownContent, List<String> relatedNoteIds, List<String> sessionIds, List<String> exoIds
});




}
/// @nodoc
class _$NoteCopyWithImpl<$Res>
    implements $NoteCopyWith<$Res> {
  _$NoteCopyWithImpl(this._self, this._then);

  final Note _self;
  final $Res Function(Note) _then;

/// Create a copy of Note
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? summary = null,Object? createdAt = null,Object? updatedAt = null,Object? lastReviewed = freezed,Object? topics = null,Object? primaryTheme = null,Object? isFavorite = null,Object? markdownContent = null,Object? relatedNoteIds = null,Object? sessionIds = null,Object? exoIds = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastReviewed: freezed == lastReviewed ? _self.lastReviewed : lastReviewed // ignore: cast_nullable_to_non_nullable
as DateTime?,topics: null == topics ? _self.topics : topics // ignore: cast_nullable_to_non_nullable
as List<String>,primaryTheme: null == primaryTheme ? _self.primaryTheme : primaryTheme // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,markdownContent: null == markdownContent ? _self.markdownContent : markdownContent // ignore: cast_nullable_to_non_nullable
as String,relatedNoteIds: null == relatedNoteIds ? _self.relatedNoteIds : relatedNoteIds // ignore: cast_nullable_to_non_nullable
as List<String>,sessionIds: null == sessionIds ? _self.sessionIds : sessionIds // ignore: cast_nullable_to_non_nullable
as List<String>,exoIds: null == exoIds ? _self.exoIds : exoIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Note].
extension NotePatterns on Note {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Note value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Note() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Note value)  $default,){
final _that = this;
switch (_that) {
case _Note():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Note value)?  $default,){
final _that = this;
switch (_that) {
case _Note() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String summary, @TimestampDateTimeConverter()  DateTime createdAt, @TimestampDateTimeConverter()  DateTime updatedAt, @NullableTimestampDateTimeConverter()  DateTime? lastReviewed,  List<String> topics,  String primaryTheme,  bool isFavorite,  String markdownContent,  List<String> relatedNoteIds,  List<String> sessionIds,  List<String> exoIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Note() when $default != null:
return $default(_that.id,_that.title,_that.summary,_that.createdAt,_that.updatedAt,_that.lastReviewed,_that.topics,_that.primaryTheme,_that.isFavorite,_that.markdownContent,_that.relatedNoteIds,_that.sessionIds,_that.exoIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String summary, @TimestampDateTimeConverter()  DateTime createdAt, @TimestampDateTimeConverter()  DateTime updatedAt, @NullableTimestampDateTimeConverter()  DateTime? lastReviewed,  List<String> topics,  String primaryTheme,  bool isFavorite,  String markdownContent,  List<String> relatedNoteIds,  List<String> sessionIds,  List<String> exoIds)  $default,) {final _that = this;
switch (_that) {
case _Note():
return $default(_that.id,_that.title,_that.summary,_that.createdAt,_that.updatedAt,_that.lastReviewed,_that.topics,_that.primaryTheme,_that.isFavorite,_that.markdownContent,_that.relatedNoteIds,_that.sessionIds,_that.exoIds);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String summary, @TimestampDateTimeConverter()  DateTime createdAt, @TimestampDateTimeConverter()  DateTime updatedAt, @NullableTimestampDateTimeConverter()  DateTime? lastReviewed,  List<String> topics,  String primaryTheme,  bool isFavorite,  String markdownContent,  List<String> relatedNoteIds,  List<String> sessionIds,  List<String> exoIds)?  $default,) {final _that = this;
switch (_that) {
case _Note() when $default != null:
return $default(_that.id,_that.title,_that.summary,_that.createdAt,_that.updatedAt,_that.lastReviewed,_that.topics,_that.primaryTheme,_that.isFavorite,_that.markdownContent,_that.relatedNoteIds,_that.sessionIds,_that.exoIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Note extends Note {
  const _Note({required this.id, this.title = '', this.summary = '', @TimestampDateTimeConverter() required this.createdAt, @TimestampDateTimeConverter() required this.updatedAt, @NullableTimestampDateTimeConverter() this.lastReviewed, required final  List<String> topics, required this.primaryTheme, this.isFavorite = false, required this.markdownContent, final  List<String> relatedNoteIds = const <String>[], final  List<String> sessionIds = const <String>[], final  List<String> exoIds = const <String>[]}): _topics = topics,_relatedNoteIds = relatedNoteIds,_sessionIds = sessionIds,_exoIds = exoIds,super._();
  factory _Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

@override final  String id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String summary;
@override@TimestampDateTimeConverter() final  DateTime createdAt;
@override@TimestampDateTimeConverter() final  DateTime updatedAt;
@override@NullableTimestampDateTimeConverter() final  DateTime? lastReviewed;
 final  List<String> _topics;
@override List<String> get topics {
  if (_topics is EqualUnmodifiableListView) return _topics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topics);
}

@override final  String primaryTheme;
@override@JsonKey() final  bool isFavorite;
@override final  String markdownContent;
 final  List<String> _relatedNoteIds;
@override@JsonKey() List<String> get relatedNoteIds {
  if (_relatedNoteIds is EqualUnmodifiableListView) return _relatedNoteIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_relatedNoteIds);
}

 final  List<String> _sessionIds;
@override@JsonKey() List<String> get sessionIds {
  if (_sessionIds is EqualUnmodifiableListView) return _sessionIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessionIds);
}

 final  List<String> _exoIds;
@override@JsonKey() List<String> get exoIds {
  if (_exoIds is EqualUnmodifiableListView) return _exoIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exoIds);
}


/// Create a copy of Note
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoteCopyWith<_Note> get copyWith => __$NoteCopyWithImpl<_Note>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NoteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Note&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastReviewed, lastReviewed) || other.lastReviewed == lastReviewed)&&const DeepCollectionEquality().equals(other._topics, _topics)&&(identical(other.primaryTheme, primaryTheme) || other.primaryTheme == primaryTheme)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.markdownContent, markdownContent) || other.markdownContent == markdownContent)&&const DeepCollectionEquality().equals(other._relatedNoteIds, _relatedNoteIds)&&const DeepCollectionEquality().equals(other._sessionIds, _sessionIds)&&const DeepCollectionEquality().equals(other._exoIds, _exoIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,summary,createdAt,updatedAt,lastReviewed,const DeepCollectionEquality().hash(_topics),primaryTheme,isFavorite,markdownContent,const DeepCollectionEquality().hash(_relatedNoteIds),const DeepCollectionEquality().hash(_sessionIds),const DeepCollectionEquality().hash(_exoIds));

@override
String toString() {
  return 'Note(id: $id, title: $title, summary: $summary, createdAt: $createdAt, updatedAt: $updatedAt, lastReviewed: $lastReviewed, topics: $topics, primaryTheme: $primaryTheme, isFavorite: $isFavorite, markdownContent: $markdownContent, relatedNoteIds: $relatedNoteIds, sessionIds: $sessionIds, exoIds: $exoIds)';
}


}

/// @nodoc
abstract mixin class _$NoteCopyWith<$Res> implements $NoteCopyWith<$Res> {
  factory _$NoteCopyWith(_Note value, $Res Function(_Note) _then) = __$NoteCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String summary,@TimestampDateTimeConverter() DateTime createdAt,@TimestampDateTimeConverter() DateTime updatedAt,@NullableTimestampDateTimeConverter() DateTime? lastReviewed, List<String> topics, String primaryTheme, bool isFavorite, String markdownContent, List<String> relatedNoteIds, List<String> sessionIds, List<String> exoIds
});




}
/// @nodoc
class __$NoteCopyWithImpl<$Res>
    implements _$NoteCopyWith<$Res> {
  __$NoteCopyWithImpl(this._self, this._then);

  final _Note _self;
  final $Res Function(_Note) _then;

/// Create a copy of Note
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? summary = null,Object? createdAt = null,Object? updatedAt = null,Object? lastReviewed = freezed,Object? topics = null,Object? primaryTheme = null,Object? isFavorite = null,Object? markdownContent = null,Object? relatedNoteIds = null,Object? sessionIds = null,Object? exoIds = null,}) {
  return _then(_Note(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastReviewed: freezed == lastReviewed ? _self.lastReviewed : lastReviewed // ignore: cast_nullable_to_non_nullable
as DateTime?,topics: null == topics ? _self._topics : topics // ignore: cast_nullable_to_non_nullable
as List<String>,primaryTheme: null == primaryTheme ? _self.primaryTheme : primaryTheme // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,markdownContent: null == markdownContent ? _self.markdownContent : markdownContent // ignore: cast_nullable_to_non_nullable
as String,relatedNoteIds: null == relatedNoteIds ? _self._relatedNoteIds : relatedNoteIds // ignore: cast_nullable_to_non_nullable
as List<String>,sessionIds: null == sessionIds ? _self._sessionIds : sessionIds // ignore: cast_nullable_to_non_nullable
as List<String>,exoIds: null == exoIds ? _self._exoIds : exoIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
