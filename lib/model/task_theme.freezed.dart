// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskTheme {

 String get id; String get name; String get color; String get emoji; bool get isSelected;
/// Create a copy of TaskTheme
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskThemeCopyWith<TaskTheme> get copyWith => _$TaskThemeCopyWithImpl<TaskTheme>(this as TaskTheme, _$identity);

  /// Serializes this TaskTheme to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskTheme&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,color,emoji,isSelected);

@override
String toString() {
  return 'TaskTheme(id: $id, name: $name, color: $color, emoji: $emoji, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class $TaskThemeCopyWith<$Res>  {
  factory $TaskThemeCopyWith(TaskTheme value, $Res Function(TaskTheme) _then) = _$TaskThemeCopyWithImpl;
@useResult
$Res call({
 String id, String name, String color, String emoji, bool isSelected
});




}
/// @nodoc
class _$TaskThemeCopyWithImpl<$Res>
    implements $TaskThemeCopyWith<$Res> {
  _$TaskThemeCopyWithImpl(this._self, this._then);

  final TaskTheme _self;
  final $Res Function(TaskTheme) _then;

/// Create a copy of TaskTheme
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? color = null,Object? emoji = null,Object? isSelected = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskTheme].
extension TaskThemePatterns on TaskTheme {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskTheme value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskTheme() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskTheme value)  $default,){
final _that = this;
switch (_that) {
case _TaskTheme():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskTheme value)?  $default,){
final _that = this;
switch (_that) {
case _TaskTheme() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String color,  String emoji,  bool isSelected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskTheme() when $default != null:
return $default(_that.id,_that.name,_that.color,_that.emoji,_that.isSelected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String color,  String emoji,  bool isSelected)  $default,) {final _that = this;
switch (_that) {
case _TaskTheme():
return $default(_that.id,_that.name,_that.color,_that.emoji,_that.isSelected);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String color,  String emoji,  bool isSelected)?  $default,) {final _that = this;
switch (_that) {
case _TaskTheme() when $default != null:
return $default(_that.id,_that.name,_that.color,_that.emoji,_that.isSelected);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskTheme implements TaskTheme {
  const _TaskTheme({required this.id, required this.name, required this.color, required this.emoji, this.isSelected = false});
  factory _TaskTheme.fromJson(Map<String, dynamic> json) => _$TaskThemeFromJson(json);

@override final  String id;
@override final  String name;
@override final  String color;
@override final  String emoji;
@override@JsonKey() final  bool isSelected;

/// Create a copy of TaskTheme
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskThemeCopyWith<_TaskTheme> get copyWith => __$TaskThemeCopyWithImpl<_TaskTheme>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskThemeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskTheme&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,color,emoji,isSelected);

@override
String toString() {
  return 'TaskTheme(id: $id, name: $name, color: $color, emoji: $emoji, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class _$TaskThemeCopyWith<$Res> implements $TaskThemeCopyWith<$Res> {
  factory _$TaskThemeCopyWith(_TaskTheme value, $Res Function(_TaskTheme) _then) = __$TaskThemeCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String color, String emoji, bool isSelected
});




}
/// @nodoc
class __$TaskThemeCopyWithImpl<$Res>
    implements _$TaskThemeCopyWith<$Res> {
  __$TaskThemeCopyWithImpl(this._self, this._then);

  final _TaskTheme _self;
  final $Res Function(_TaskTheme) _then;

/// Create a copy of TaskTheme
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? color = null,Object? emoji = null,Object? isSelected = null,}) {
  return _then(_TaskTheme(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
