// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mode_selection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ModeSelectionState {

 int? get selectedMode;// 0 for solo, 1 for group
 bool get isCreatingSession; String? get error;
/// Create a copy of ModeSelectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModeSelectionStateCopyWith<ModeSelectionState> get copyWith => _$ModeSelectionStateCopyWithImpl<ModeSelectionState>(this as ModeSelectionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModeSelectionState&&(identical(other.selectedMode, selectedMode) || other.selectedMode == selectedMode)&&(identical(other.isCreatingSession, isCreatingSession) || other.isCreatingSession == isCreatingSession)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,selectedMode,isCreatingSession,error);

@override
String toString() {
  return 'ModeSelectionState(selectedMode: $selectedMode, isCreatingSession: $isCreatingSession, error: $error)';
}


}

/// @nodoc
abstract mixin class $ModeSelectionStateCopyWith<$Res>  {
  factory $ModeSelectionStateCopyWith(ModeSelectionState value, $Res Function(ModeSelectionState) _then) = _$ModeSelectionStateCopyWithImpl;
@useResult
$Res call({
 int? selectedMode, bool isCreatingSession, String? error
});




}
/// @nodoc
class _$ModeSelectionStateCopyWithImpl<$Res>
    implements $ModeSelectionStateCopyWith<$Res> {
  _$ModeSelectionStateCopyWithImpl(this._self, this._then);

  final ModeSelectionState _self;
  final $Res Function(ModeSelectionState) _then;

/// Create a copy of ModeSelectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedMode = freezed,Object? isCreatingSession = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
selectedMode: freezed == selectedMode ? _self.selectedMode : selectedMode // ignore: cast_nullable_to_non_nullable
as int?,isCreatingSession: null == isCreatingSession ? _self.isCreatingSession : isCreatingSession // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ModeSelectionState].
extension ModeSelectionStatePatterns on ModeSelectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModeSelectionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModeSelectionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModeSelectionState value)  $default,){
final _that = this;
switch (_that) {
case _ModeSelectionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModeSelectionState value)?  $default,){
final _that = this;
switch (_that) {
case _ModeSelectionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? selectedMode,  bool isCreatingSession,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModeSelectionState() when $default != null:
return $default(_that.selectedMode,_that.isCreatingSession,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? selectedMode,  bool isCreatingSession,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ModeSelectionState():
return $default(_that.selectedMode,_that.isCreatingSession,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? selectedMode,  bool isCreatingSession,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ModeSelectionState() when $default != null:
return $default(_that.selectedMode,_that.isCreatingSession,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ModeSelectionState extends ModeSelectionState {
  const _ModeSelectionState({this.selectedMode = null, this.isCreatingSession = false, this.error}): super._();
  

@override@JsonKey() final  int? selectedMode;
// 0 for solo, 1 for group
@override@JsonKey() final  bool isCreatingSession;
@override final  String? error;

/// Create a copy of ModeSelectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModeSelectionStateCopyWith<_ModeSelectionState> get copyWith => __$ModeSelectionStateCopyWithImpl<_ModeSelectionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModeSelectionState&&(identical(other.selectedMode, selectedMode) || other.selectedMode == selectedMode)&&(identical(other.isCreatingSession, isCreatingSession) || other.isCreatingSession == isCreatingSession)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,selectedMode,isCreatingSession,error);

@override
String toString() {
  return 'ModeSelectionState(selectedMode: $selectedMode, isCreatingSession: $isCreatingSession, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ModeSelectionStateCopyWith<$Res> implements $ModeSelectionStateCopyWith<$Res> {
  factory _$ModeSelectionStateCopyWith(_ModeSelectionState value, $Res Function(_ModeSelectionState) _then) = __$ModeSelectionStateCopyWithImpl;
@override @useResult
$Res call({
 int? selectedMode, bool isCreatingSession, String? error
});




}
/// @nodoc
class __$ModeSelectionStateCopyWithImpl<$Res>
    implements _$ModeSelectionStateCopyWith<$Res> {
  __$ModeSelectionStateCopyWithImpl(this._self, this._then);

  final _ModeSelectionState _self;
  final $Res Function(_ModeSelectionState) _then;

/// Create a copy of ModeSelectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedMode = freezed,Object? isCreatingSession = null,Object? error = freezed,}) {
  return _then(_ModeSelectionState(
selectedMode: freezed == selectedMode ? _self.selectedMode : selectedMode // ignore: cast_nullable_to_non_nullable
as int?,isCreatingSession: null == isCreatingSession ? _self.isCreatingSession : isCreatingSession // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
