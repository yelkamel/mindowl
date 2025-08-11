// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Exo {

 String get id; String get noteId; String? get sessionId; ExoType get type; ExoContent get content; int get difficulty; List<String> get tags;@TimestampDateTimeConverter() DateTime get createdAt;// Legacy fields for backward compatibility
 String? get question; List<String> get options; dynamic get correctAnswer; int? get xpReward; String? get explanation;@NullableTimestampDateTimeConverter() DateTime? get lastAttempted; int get correctAttempts; int get totalAttempts; bool get isAnswered; dynamic get userAnswer; bool get isCorrect; bool get isFavorite;
/// Create a copy of Exo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExoCopyWith<Exo> get copyWith => _$ExoCopyWithImpl<Exo>(this as Exo, _$identity);

  /// Serializes this Exo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Exo&&(identical(other.id, id) || other.id == id)&&(identical(other.noteId, noteId) || other.noteId == noteId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.type, type) || other.type == type)&&(identical(other.content, content) || other.content == content)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other.options, options)&&const DeepCollectionEquality().equals(other.correctAnswer, correctAnswer)&&(identical(other.xpReward, xpReward) || other.xpReward == xpReward)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.lastAttempted, lastAttempted) || other.lastAttempted == lastAttempted)&&(identical(other.correctAttempts, correctAttempts) || other.correctAttempts == correctAttempts)&&(identical(other.totalAttempts, totalAttempts) || other.totalAttempts == totalAttempts)&&(identical(other.isAnswered, isAnswered) || other.isAnswered == isAnswered)&&const DeepCollectionEquality().equals(other.userAnswer, userAnswer)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,noteId,sessionId,type,content,difficulty,const DeepCollectionEquality().hash(tags),createdAt,question,const DeepCollectionEquality().hash(options),const DeepCollectionEquality().hash(correctAnswer),xpReward,explanation,lastAttempted,correctAttempts,totalAttempts,isAnswered,const DeepCollectionEquality().hash(userAnswer),isCorrect,isFavorite]);

@override
String toString() {
  return 'Exo(id: $id, noteId: $noteId, sessionId: $sessionId, type: $type, content: $content, difficulty: $difficulty, tags: $tags, createdAt: $createdAt, question: $question, options: $options, correctAnswer: $correctAnswer, xpReward: $xpReward, explanation: $explanation, lastAttempted: $lastAttempted, correctAttempts: $correctAttempts, totalAttempts: $totalAttempts, isAnswered: $isAnswered, userAnswer: $userAnswer, isCorrect: $isCorrect, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class $ExoCopyWith<$Res>  {
  factory $ExoCopyWith(Exo value, $Res Function(Exo) _then) = _$ExoCopyWithImpl;
@useResult
$Res call({
 String id, String noteId, String? sessionId, ExoType type, ExoContent content, int difficulty, List<String> tags,@TimestampDateTimeConverter() DateTime createdAt, String? question, List<String> options, dynamic correctAnswer, int? xpReward, String? explanation,@NullableTimestampDateTimeConverter() DateTime? lastAttempted, int correctAttempts, int totalAttempts, bool isAnswered, dynamic userAnswer, bool isCorrect, bool isFavorite
});


$ExoContentCopyWith<$Res> get content;

}
/// @nodoc
class _$ExoCopyWithImpl<$Res>
    implements $ExoCopyWith<$Res> {
  _$ExoCopyWithImpl(this._self, this._then);

  final Exo _self;
  final $Res Function(Exo) _then;

/// Create a copy of Exo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? noteId = null,Object? sessionId = freezed,Object? type = null,Object? content = null,Object? difficulty = null,Object? tags = null,Object? createdAt = null,Object? question = freezed,Object? options = null,Object? correctAnswer = freezed,Object? xpReward = freezed,Object? explanation = freezed,Object? lastAttempted = freezed,Object? correctAttempts = null,Object? totalAttempts = null,Object? isAnswered = null,Object? userAnswer = freezed,Object? isCorrect = null,Object? isFavorite = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,noteId: null == noteId ? _self.noteId : noteId // ignore: cast_nullable_to_non_nullable
as String,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ExoType,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as ExoContent,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as int,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,question: freezed == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String?,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<String>,correctAnswer: freezed == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as dynamic,xpReward: freezed == xpReward ? _self.xpReward : xpReward // ignore: cast_nullable_to_non_nullable
as int?,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,lastAttempted: freezed == lastAttempted ? _self.lastAttempted : lastAttempted // ignore: cast_nullable_to_non_nullable
as DateTime?,correctAttempts: null == correctAttempts ? _self.correctAttempts : correctAttempts // ignore: cast_nullable_to_non_nullable
as int,totalAttempts: null == totalAttempts ? _self.totalAttempts : totalAttempts // ignore: cast_nullable_to_non_nullable
as int,isAnswered: null == isAnswered ? _self.isAnswered : isAnswered // ignore: cast_nullable_to_non_nullable
as bool,userAnswer: freezed == userAnswer ? _self.userAnswer : userAnswer // ignore: cast_nullable_to_non_nullable
as dynamic,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of Exo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExoContentCopyWith<$Res> get content {
  
  return $ExoContentCopyWith<$Res>(_self.content, (value) {
    return _then(_self.copyWith(content: value));
  });
}
}


/// Adds pattern-matching-related methods to [Exo].
extension ExoPatterns on Exo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Exo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Exo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Exo value)  $default,){
final _that = this;
switch (_that) {
case _Exo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Exo value)?  $default,){
final _that = this;
switch (_that) {
case _Exo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String noteId,  String? sessionId,  ExoType type,  ExoContent content,  int difficulty,  List<String> tags, @TimestampDateTimeConverter()  DateTime createdAt,  String? question,  List<String> options,  dynamic correctAnswer,  int? xpReward,  String? explanation, @NullableTimestampDateTimeConverter()  DateTime? lastAttempted,  int correctAttempts,  int totalAttempts,  bool isAnswered,  dynamic userAnswer,  bool isCorrect,  bool isFavorite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Exo() when $default != null:
return $default(_that.id,_that.noteId,_that.sessionId,_that.type,_that.content,_that.difficulty,_that.tags,_that.createdAt,_that.question,_that.options,_that.correctAnswer,_that.xpReward,_that.explanation,_that.lastAttempted,_that.correctAttempts,_that.totalAttempts,_that.isAnswered,_that.userAnswer,_that.isCorrect,_that.isFavorite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String noteId,  String? sessionId,  ExoType type,  ExoContent content,  int difficulty,  List<String> tags, @TimestampDateTimeConverter()  DateTime createdAt,  String? question,  List<String> options,  dynamic correctAnswer,  int? xpReward,  String? explanation, @NullableTimestampDateTimeConverter()  DateTime? lastAttempted,  int correctAttempts,  int totalAttempts,  bool isAnswered,  dynamic userAnswer,  bool isCorrect,  bool isFavorite)  $default,) {final _that = this;
switch (_that) {
case _Exo():
return $default(_that.id,_that.noteId,_that.sessionId,_that.type,_that.content,_that.difficulty,_that.tags,_that.createdAt,_that.question,_that.options,_that.correctAnswer,_that.xpReward,_that.explanation,_that.lastAttempted,_that.correctAttempts,_that.totalAttempts,_that.isAnswered,_that.userAnswer,_that.isCorrect,_that.isFavorite);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String noteId,  String? sessionId,  ExoType type,  ExoContent content,  int difficulty,  List<String> tags, @TimestampDateTimeConverter()  DateTime createdAt,  String? question,  List<String> options,  dynamic correctAnswer,  int? xpReward,  String? explanation, @NullableTimestampDateTimeConverter()  DateTime? lastAttempted,  int correctAttempts,  int totalAttempts,  bool isAnswered,  dynamic userAnswer,  bool isCorrect,  bool isFavorite)?  $default,) {final _that = this;
switch (_that) {
case _Exo() when $default != null:
return $default(_that.id,_that.noteId,_that.sessionId,_that.type,_that.content,_that.difficulty,_that.tags,_that.createdAt,_that.question,_that.options,_that.correctAnswer,_that.xpReward,_that.explanation,_that.lastAttempted,_that.correctAttempts,_that.totalAttempts,_that.isAnswered,_that.userAnswer,_that.isCorrect,_that.isFavorite);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Exo extends Exo {
  const _Exo({required this.id, required this.noteId, this.sessionId, required this.type, required this.content, this.difficulty = 1, final  List<String> tags = const <String>[], @TimestampDateTimeConverter() required this.createdAt, this.question, final  List<String> options = const <String>[], this.correctAnswer, this.xpReward, this.explanation, @NullableTimestampDateTimeConverter() this.lastAttempted, this.correctAttempts = 0, this.totalAttempts = 0, this.isAnswered = false, this.userAnswer, this.isCorrect = false, this.isFavorite = false}): _tags = tags,_options = options,super._();
  factory _Exo.fromJson(Map<String, dynamic> json) => _$ExoFromJson(json);

@override final  String id;
@override final  String noteId;
@override final  String? sessionId;
@override final  ExoType type;
@override final  ExoContent content;
@override@JsonKey() final  int difficulty;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@TimestampDateTimeConverter() final  DateTime createdAt;
// Legacy fields for backward compatibility
@override final  String? question;
 final  List<String> _options;
@override@JsonKey() List<String> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override final  dynamic correctAnswer;
@override final  int? xpReward;
@override final  String? explanation;
@override@NullableTimestampDateTimeConverter() final  DateTime? lastAttempted;
@override@JsonKey() final  int correctAttempts;
@override@JsonKey() final  int totalAttempts;
@override@JsonKey() final  bool isAnswered;
@override final  dynamic userAnswer;
@override@JsonKey() final  bool isCorrect;
@override@JsonKey() final  bool isFavorite;

/// Create a copy of Exo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExoCopyWith<_Exo> get copyWith => __$ExoCopyWithImpl<_Exo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Exo&&(identical(other.id, id) || other.id == id)&&(identical(other.noteId, noteId) || other.noteId == noteId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.type, type) || other.type == type)&&(identical(other.content, content) || other.content == content)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other._options, _options)&&const DeepCollectionEquality().equals(other.correctAnswer, correctAnswer)&&(identical(other.xpReward, xpReward) || other.xpReward == xpReward)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.lastAttempted, lastAttempted) || other.lastAttempted == lastAttempted)&&(identical(other.correctAttempts, correctAttempts) || other.correctAttempts == correctAttempts)&&(identical(other.totalAttempts, totalAttempts) || other.totalAttempts == totalAttempts)&&(identical(other.isAnswered, isAnswered) || other.isAnswered == isAnswered)&&const DeepCollectionEquality().equals(other.userAnswer, userAnswer)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,noteId,sessionId,type,content,difficulty,const DeepCollectionEquality().hash(_tags),createdAt,question,const DeepCollectionEquality().hash(_options),const DeepCollectionEquality().hash(correctAnswer),xpReward,explanation,lastAttempted,correctAttempts,totalAttempts,isAnswered,const DeepCollectionEquality().hash(userAnswer),isCorrect,isFavorite]);

@override
String toString() {
  return 'Exo(id: $id, noteId: $noteId, sessionId: $sessionId, type: $type, content: $content, difficulty: $difficulty, tags: $tags, createdAt: $createdAt, question: $question, options: $options, correctAnswer: $correctAnswer, xpReward: $xpReward, explanation: $explanation, lastAttempted: $lastAttempted, correctAttempts: $correctAttempts, totalAttempts: $totalAttempts, isAnswered: $isAnswered, userAnswer: $userAnswer, isCorrect: $isCorrect, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$ExoCopyWith<$Res> implements $ExoCopyWith<$Res> {
  factory _$ExoCopyWith(_Exo value, $Res Function(_Exo) _then) = __$ExoCopyWithImpl;
@override @useResult
$Res call({
 String id, String noteId, String? sessionId, ExoType type, ExoContent content, int difficulty, List<String> tags,@TimestampDateTimeConverter() DateTime createdAt, String? question, List<String> options, dynamic correctAnswer, int? xpReward, String? explanation,@NullableTimestampDateTimeConverter() DateTime? lastAttempted, int correctAttempts, int totalAttempts, bool isAnswered, dynamic userAnswer, bool isCorrect, bool isFavorite
});


@override $ExoContentCopyWith<$Res> get content;

}
/// @nodoc
class __$ExoCopyWithImpl<$Res>
    implements _$ExoCopyWith<$Res> {
  __$ExoCopyWithImpl(this._self, this._then);

  final _Exo _self;
  final $Res Function(_Exo) _then;

/// Create a copy of Exo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? noteId = null,Object? sessionId = freezed,Object? type = null,Object? content = null,Object? difficulty = null,Object? tags = null,Object? createdAt = null,Object? question = freezed,Object? options = null,Object? correctAnswer = freezed,Object? xpReward = freezed,Object? explanation = freezed,Object? lastAttempted = freezed,Object? correctAttempts = null,Object? totalAttempts = null,Object? isAnswered = null,Object? userAnswer = freezed,Object? isCorrect = null,Object? isFavorite = null,}) {
  return _then(_Exo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,noteId: null == noteId ? _self.noteId : noteId // ignore: cast_nullable_to_non_nullable
as String,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ExoType,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as ExoContent,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as int,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,question: freezed == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String?,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<String>,correctAnswer: freezed == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as dynamic,xpReward: freezed == xpReward ? _self.xpReward : xpReward // ignore: cast_nullable_to_non_nullable
as int?,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,lastAttempted: freezed == lastAttempted ? _self.lastAttempted : lastAttempted // ignore: cast_nullable_to_non_nullable
as DateTime?,correctAttempts: null == correctAttempts ? _self.correctAttempts : correctAttempts // ignore: cast_nullable_to_non_nullable
as int,totalAttempts: null == totalAttempts ? _self.totalAttempts : totalAttempts // ignore: cast_nullable_to_non_nullable
as int,isAnswered: null == isAnswered ? _self.isAnswered : isAnswered // ignore: cast_nullable_to_non_nullable
as bool,userAnswer: freezed == userAnswer ? _self.userAnswer : userAnswer // ignore: cast_nullable_to_non_nullable
as dynamic,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of Exo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExoContentCopyWith<$Res> get content {
  
  return $ExoContentCopyWith<$Res>(_self.content, (value) {
    return _then(_self.copyWith(content: value));
  });
}
}


/// @nodoc
mixin _$ExoContent {

 String get question; List<String>? get options; dynamic get answer; String? get explanation;
/// Create a copy of ExoContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExoContentCopyWith<ExoContent> get copyWith => _$ExoContentCopyWithImpl<ExoContent>(this as ExoContent, _$identity);

  /// Serializes this ExoContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExoContent&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other.options, options)&&const DeepCollectionEquality().equals(other.answer, answer)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,question,const DeepCollectionEquality().hash(options),const DeepCollectionEquality().hash(answer),explanation);

@override
String toString() {
  return 'ExoContent(question: $question, options: $options, answer: $answer, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class $ExoContentCopyWith<$Res>  {
  factory $ExoContentCopyWith(ExoContent value, $Res Function(ExoContent) _then) = _$ExoContentCopyWithImpl;
@useResult
$Res call({
 String question, List<String>? options, dynamic answer, String? explanation
});




}
/// @nodoc
class _$ExoContentCopyWithImpl<$Res>
    implements $ExoContentCopyWith<$Res> {
  _$ExoContentCopyWithImpl(this._self, this._then);

  final ExoContent _self;
  final $Res Function(ExoContent) _then;

/// Create a copy of ExoContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? question = null,Object? options = freezed,Object? answer = freezed,Object? explanation = freezed,}) {
  return _then(_self.copyWith(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<String>?,answer: freezed == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as dynamic,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExoContent].
extension ExoContentPatterns on ExoContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExoContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExoContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExoContent value)  $default,){
final _that = this;
switch (_that) {
case _ExoContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExoContent value)?  $default,){
final _that = this;
switch (_that) {
case _ExoContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String question,  List<String>? options,  dynamic answer,  String? explanation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExoContent() when $default != null:
return $default(_that.question,_that.options,_that.answer,_that.explanation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String question,  List<String>? options,  dynamic answer,  String? explanation)  $default,) {final _that = this;
switch (_that) {
case _ExoContent():
return $default(_that.question,_that.options,_that.answer,_that.explanation);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String question,  List<String>? options,  dynamic answer,  String? explanation)?  $default,) {final _that = this;
switch (_that) {
case _ExoContent() when $default != null:
return $default(_that.question,_that.options,_that.answer,_that.explanation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExoContent implements ExoContent {
  const _ExoContent({required this.question, final  List<String>? options, required this.answer, this.explanation}): _options = options;
  factory _ExoContent.fromJson(Map<String, dynamic> json) => _$ExoContentFromJson(json);

@override final  String question;
 final  List<String>? _options;
@override List<String>? get options {
  final value = _options;
  if (value == null) return null;
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  dynamic answer;
@override final  String? explanation;

/// Create a copy of ExoContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExoContentCopyWith<_ExoContent> get copyWith => __$ExoContentCopyWithImpl<_ExoContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExoContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExoContent&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other._options, _options)&&const DeepCollectionEquality().equals(other.answer, answer)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,question,const DeepCollectionEquality().hash(_options),const DeepCollectionEquality().hash(answer),explanation);

@override
String toString() {
  return 'ExoContent(question: $question, options: $options, answer: $answer, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class _$ExoContentCopyWith<$Res> implements $ExoContentCopyWith<$Res> {
  factory _$ExoContentCopyWith(_ExoContent value, $Res Function(_ExoContent) _then) = __$ExoContentCopyWithImpl;
@override @useResult
$Res call({
 String question, List<String>? options, dynamic answer, String? explanation
});




}
/// @nodoc
class __$ExoContentCopyWithImpl<$Res>
    implements _$ExoContentCopyWith<$Res> {
  __$ExoContentCopyWithImpl(this._self, this._then);

  final _ExoContent _self;
  final $Res Function(_ExoContent) _then;

/// Create a copy of ExoContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? question = null,Object? options = freezed,Object? answer = freezed,Object? explanation = freezed,}) {
  return _then(_ExoContent(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,options: freezed == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<String>?,answer: freezed == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as dynamic,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
