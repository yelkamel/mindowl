// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notedetail_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NoteDetailScreenState {

 Note? get currentNote; List<Exo> get noteExos; List<Session> get noteSessions; bool get isLoading; String? get error; bool get showAllExos; bool get showAllSessions;
/// Create a copy of NoteDetailScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoteDetailScreenStateCopyWith<NoteDetailScreenState> get copyWith => _$NoteDetailScreenStateCopyWithImpl<NoteDetailScreenState>(this as NoteDetailScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteDetailScreenState&&(identical(other.currentNote, currentNote) || other.currentNote == currentNote)&&const DeepCollectionEquality().equals(other.noteExos, noteExos)&&const DeepCollectionEquality().equals(other.noteSessions, noteSessions)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.showAllExos, showAllExos) || other.showAllExos == showAllExos)&&(identical(other.showAllSessions, showAllSessions) || other.showAllSessions == showAllSessions));
}


@override
int get hashCode => Object.hash(runtimeType,currentNote,const DeepCollectionEquality().hash(noteExos),const DeepCollectionEquality().hash(noteSessions),isLoading,error,showAllExos,showAllSessions);

@override
String toString() {
  return 'NoteDetailScreenState(currentNote: $currentNote, noteExos: $noteExos, noteSessions: $noteSessions, isLoading: $isLoading, error: $error, showAllExos: $showAllExos, showAllSessions: $showAllSessions)';
}


}

/// @nodoc
abstract mixin class $NoteDetailScreenStateCopyWith<$Res>  {
  factory $NoteDetailScreenStateCopyWith(NoteDetailScreenState value, $Res Function(NoteDetailScreenState) _then) = _$NoteDetailScreenStateCopyWithImpl;
@useResult
$Res call({
 Note? currentNote, List<Exo> noteExos, List<Session> noteSessions, bool isLoading, String? error, bool showAllExos, bool showAllSessions
});


$NoteCopyWith<$Res>? get currentNote;

}
/// @nodoc
class _$NoteDetailScreenStateCopyWithImpl<$Res>
    implements $NoteDetailScreenStateCopyWith<$Res> {
  _$NoteDetailScreenStateCopyWithImpl(this._self, this._then);

  final NoteDetailScreenState _self;
  final $Res Function(NoteDetailScreenState) _then;

/// Create a copy of NoteDetailScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentNote = freezed,Object? noteExos = null,Object? noteSessions = null,Object? isLoading = null,Object? error = freezed,Object? showAllExos = null,Object? showAllSessions = null,}) {
  return _then(_self.copyWith(
currentNote: freezed == currentNote ? _self.currentNote : currentNote // ignore: cast_nullable_to_non_nullable
as Note?,noteExos: null == noteExos ? _self.noteExos : noteExos // ignore: cast_nullable_to_non_nullable
as List<Exo>,noteSessions: null == noteSessions ? _self.noteSessions : noteSessions // ignore: cast_nullable_to_non_nullable
as List<Session>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,showAllExos: null == showAllExos ? _self.showAllExos : showAllExos // ignore: cast_nullable_to_non_nullable
as bool,showAllSessions: null == showAllSessions ? _self.showAllSessions : showAllSessions // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of NoteDetailScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NoteCopyWith<$Res>? get currentNote {
    if (_self.currentNote == null) {
    return null;
  }

  return $NoteCopyWith<$Res>(_self.currentNote!, (value) {
    return _then(_self.copyWith(currentNote: value));
  });
}
}


/// Adds pattern-matching-related methods to [NoteDetailScreenState].
extension NoteDetailScreenStatePatterns on NoteDetailScreenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NoteDetailScreenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoteDetailScreenState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NoteDetailScreenState value)  $default,){
final _that = this;
switch (_that) {
case _NoteDetailScreenState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NoteDetailScreenState value)?  $default,){
final _that = this;
switch (_that) {
case _NoteDetailScreenState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Note? currentNote,  List<Exo> noteExos,  List<Session> noteSessions,  bool isLoading,  String? error,  bool showAllExos,  bool showAllSessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoteDetailScreenState() when $default != null:
return $default(_that.currentNote,_that.noteExos,_that.noteSessions,_that.isLoading,_that.error,_that.showAllExos,_that.showAllSessions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Note? currentNote,  List<Exo> noteExos,  List<Session> noteSessions,  bool isLoading,  String? error,  bool showAllExos,  bool showAllSessions)  $default,) {final _that = this;
switch (_that) {
case _NoteDetailScreenState():
return $default(_that.currentNote,_that.noteExos,_that.noteSessions,_that.isLoading,_that.error,_that.showAllExos,_that.showAllSessions);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Note? currentNote,  List<Exo> noteExos,  List<Session> noteSessions,  bool isLoading,  String? error,  bool showAllExos,  bool showAllSessions)?  $default,) {final _that = this;
switch (_that) {
case _NoteDetailScreenState() when $default != null:
return $default(_that.currentNote,_that.noteExos,_that.noteSessions,_that.isLoading,_that.error,_that.showAllExos,_that.showAllSessions);case _:
  return null;

}
}

}

/// @nodoc


class _NoteDetailScreenState extends NoteDetailScreenState {
  const _NoteDetailScreenState({this.currentNote, final  List<Exo> noteExos = const [], final  List<Session> noteSessions = const [], this.isLoading = false, this.error, this.showAllExos = false, this.showAllSessions = false}): _noteExos = noteExos,_noteSessions = noteSessions,super._();
  

@override final  Note? currentNote;
 final  List<Exo> _noteExos;
@override@JsonKey() List<Exo> get noteExos {
  if (_noteExos is EqualUnmodifiableListView) return _noteExos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_noteExos);
}

 final  List<Session> _noteSessions;
@override@JsonKey() List<Session> get noteSessions {
  if (_noteSessions is EqualUnmodifiableListView) return _noteSessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_noteSessions);
}

@override@JsonKey() final  bool isLoading;
@override final  String? error;
@override@JsonKey() final  bool showAllExos;
@override@JsonKey() final  bool showAllSessions;

/// Create a copy of NoteDetailScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoteDetailScreenStateCopyWith<_NoteDetailScreenState> get copyWith => __$NoteDetailScreenStateCopyWithImpl<_NoteDetailScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoteDetailScreenState&&(identical(other.currentNote, currentNote) || other.currentNote == currentNote)&&const DeepCollectionEquality().equals(other._noteExos, _noteExos)&&const DeepCollectionEquality().equals(other._noteSessions, _noteSessions)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.showAllExos, showAllExos) || other.showAllExos == showAllExos)&&(identical(other.showAllSessions, showAllSessions) || other.showAllSessions == showAllSessions));
}


@override
int get hashCode => Object.hash(runtimeType,currentNote,const DeepCollectionEquality().hash(_noteExos),const DeepCollectionEquality().hash(_noteSessions),isLoading,error,showAllExos,showAllSessions);

@override
String toString() {
  return 'NoteDetailScreenState(currentNote: $currentNote, noteExos: $noteExos, noteSessions: $noteSessions, isLoading: $isLoading, error: $error, showAllExos: $showAllExos, showAllSessions: $showAllSessions)';
}


}

/// @nodoc
abstract mixin class _$NoteDetailScreenStateCopyWith<$Res> implements $NoteDetailScreenStateCopyWith<$Res> {
  factory _$NoteDetailScreenStateCopyWith(_NoteDetailScreenState value, $Res Function(_NoteDetailScreenState) _then) = __$NoteDetailScreenStateCopyWithImpl;
@override @useResult
$Res call({
 Note? currentNote, List<Exo> noteExos, List<Session> noteSessions, bool isLoading, String? error, bool showAllExos, bool showAllSessions
});


@override $NoteCopyWith<$Res>? get currentNote;

}
/// @nodoc
class __$NoteDetailScreenStateCopyWithImpl<$Res>
    implements _$NoteDetailScreenStateCopyWith<$Res> {
  __$NoteDetailScreenStateCopyWithImpl(this._self, this._then);

  final _NoteDetailScreenState _self;
  final $Res Function(_NoteDetailScreenState) _then;

/// Create a copy of NoteDetailScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentNote = freezed,Object? noteExos = null,Object? noteSessions = null,Object? isLoading = null,Object? error = freezed,Object? showAllExos = null,Object? showAllSessions = null,}) {
  return _then(_NoteDetailScreenState(
currentNote: freezed == currentNote ? _self.currentNote : currentNote // ignore: cast_nullable_to_non_nullable
as Note?,noteExos: null == noteExos ? _self._noteExos : noteExos // ignore: cast_nullable_to_non_nullable
as List<Exo>,noteSessions: null == noteSessions ? _self._noteSessions : noteSessions // ignore: cast_nullable_to_non_nullable
as List<Session>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,showAllExos: null == showAllExos ? _self.showAllExos : showAllExos // ignore: cast_nullable_to_non_nullable
as bool,showAllSessions: null == showAllSessions ? _self.showAllSessions : showAllSessions // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of NoteDetailScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NoteCopyWith<$Res>? get currentNote {
    if (_self.currentNote == null) {
    return null;
  }

  return $NoteCopyWith<$Res>(_self.currentNote!, (value) {
    return _then(_self.copyWith(currentNote: value));
  });
}
}

// dart format on
