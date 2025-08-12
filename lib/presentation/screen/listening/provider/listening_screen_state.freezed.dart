// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listening_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListeningScreenState {

 bool get isListening; ContextType get detectedContext; int get sessionTimer; int get nextQuestionCountdown; bool get isQuestionReady; bool get isSessionEnded; List<String> get textChunks; String get latestTextChunk; Session? get currentSession; List<SessionExo> get sessionExos; bool get isLoading; String? get error;
/// Create a copy of ListeningScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListeningScreenStateCopyWith<ListeningScreenState> get copyWith => _$ListeningScreenStateCopyWithImpl<ListeningScreenState>(this as ListeningScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListeningScreenState&&(identical(other.isListening, isListening) || other.isListening == isListening)&&(identical(other.detectedContext, detectedContext) || other.detectedContext == detectedContext)&&(identical(other.sessionTimer, sessionTimer) || other.sessionTimer == sessionTimer)&&(identical(other.nextQuestionCountdown, nextQuestionCountdown) || other.nextQuestionCountdown == nextQuestionCountdown)&&(identical(other.isQuestionReady, isQuestionReady) || other.isQuestionReady == isQuestionReady)&&(identical(other.isSessionEnded, isSessionEnded) || other.isSessionEnded == isSessionEnded)&&const DeepCollectionEquality().equals(other.textChunks, textChunks)&&(identical(other.latestTextChunk, latestTextChunk) || other.latestTextChunk == latestTextChunk)&&(identical(other.currentSession, currentSession) || other.currentSession == currentSession)&&const DeepCollectionEquality().equals(other.sessionExos, sessionExos)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isListening,detectedContext,sessionTimer,nextQuestionCountdown,isQuestionReady,isSessionEnded,const DeepCollectionEquality().hash(textChunks),latestTextChunk,currentSession,const DeepCollectionEquality().hash(sessionExos),isLoading,error);

@override
String toString() {
  return 'ListeningScreenState(isListening: $isListening, detectedContext: $detectedContext, sessionTimer: $sessionTimer, nextQuestionCountdown: $nextQuestionCountdown, isQuestionReady: $isQuestionReady, isSessionEnded: $isSessionEnded, textChunks: $textChunks, latestTextChunk: $latestTextChunk, currentSession: $currentSession, sessionExos: $sessionExos, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $ListeningScreenStateCopyWith<$Res>  {
  factory $ListeningScreenStateCopyWith(ListeningScreenState value, $Res Function(ListeningScreenState) _then) = _$ListeningScreenStateCopyWithImpl;
@useResult
$Res call({
 bool isListening, ContextType detectedContext, int sessionTimer, int nextQuestionCountdown, bool isQuestionReady, bool isSessionEnded, List<String> textChunks, String latestTextChunk, Session? currentSession, List<SessionExo> sessionExos, bool isLoading, String? error
});


$SessionCopyWith<$Res>? get currentSession;

}
/// @nodoc
class _$ListeningScreenStateCopyWithImpl<$Res>
    implements $ListeningScreenStateCopyWith<$Res> {
  _$ListeningScreenStateCopyWithImpl(this._self, this._then);

  final ListeningScreenState _self;
  final $Res Function(ListeningScreenState) _then;

/// Create a copy of ListeningScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isListening = null,Object? detectedContext = null,Object? sessionTimer = null,Object? nextQuestionCountdown = null,Object? isQuestionReady = null,Object? isSessionEnded = null,Object? textChunks = null,Object? latestTextChunk = null,Object? currentSession = freezed,Object? sessionExos = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isListening: null == isListening ? _self.isListening : isListening // ignore: cast_nullable_to_non_nullable
as bool,detectedContext: null == detectedContext ? _self.detectedContext : detectedContext // ignore: cast_nullable_to_non_nullable
as ContextType,sessionTimer: null == sessionTimer ? _self.sessionTimer : sessionTimer // ignore: cast_nullable_to_non_nullable
as int,nextQuestionCountdown: null == nextQuestionCountdown ? _self.nextQuestionCountdown : nextQuestionCountdown // ignore: cast_nullable_to_non_nullable
as int,isQuestionReady: null == isQuestionReady ? _self.isQuestionReady : isQuestionReady // ignore: cast_nullable_to_non_nullable
as bool,isSessionEnded: null == isSessionEnded ? _self.isSessionEnded : isSessionEnded // ignore: cast_nullable_to_non_nullable
as bool,textChunks: null == textChunks ? _self.textChunks : textChunks // ignore: cast_nullable_to_non_nullable
as List<String>,latestTextChunk: null == latestTextChunk ? _self.latestTextChunk : latestTextChunk // ignore: cast_nullable_to_non_nullable
as String,currentSession: freezed == currentSession ? _self.currentSession : currentSession // ignore: cast_nullable_to_non_nullable
as Session?,sessionExos: null == sessionExos ? _self.sessionExos : sessionExos // ignore: cast_nullable_to_non_nullable
as List<SessionExo>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ListeningScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionCopyWith<$Res>? get currentSession {
    if (_self.currentSession == null) {
    return null;
  }

  return $SessionCopyWith<$Res>(_self.currentSession!, (value) {
    return _then(_self.copyWith(currentSession: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListeningScreenState].
extension ListeningScreenStatePatterns on ListeningScreenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListeningScreenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListeningScreenState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListeningScreenState value)  $default,){
final _that = this;
switch (_that) {
case _ListeningScreenState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListeningScreenState value)?  $default,){
final _that = this;
switch (_that) {
case _ListeningScreenState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isListening,  ContextType detectedContext,  int sessionTimer,  int nextQuestionCountdown,  bool isQuestionReady,  bool isSessionEnded,  List<String> textChunks,  String latestTextChunk,  Session? currentSession,  List<SessionExo> sessionExos,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListeningScreenState() when $default != null:
return $default(_that.isListening,_that.detectedContext,_that.sessionTimer,_that.nextQuestionCountdown,_that.isQuestionReady,_that.isSessionEnded,_that.textChunks,_that.latestTextChunk,_that.currentSession,_that.sessionExos,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isListening,  ContextType detectedContext,  int sessionTimer,  int nextQuestionCountdown,  bool isQuestionReady,  bool isSessionEnded,  List<String> textChunks,  String latestTextChunk,  Session? currentSession,  List<SessionExo> sessionExos,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ListeningScreenState():
return $default(_that.isListening,_that.detectedContext,_that.sessionTimer,_that.nextQuestionCountdown,_that.isQuestionReady,_that.isSessionEnded,_that.textChunks,_that.latestTextChunk,_that.currentSession,_that.sessionExos,_that.isLoading,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isListening,  ContextType detectedContext,  int sessionTimer,  int nextQuestionCountdown,  bool isQuestionReady,  bool isSessionEnded,  List<String> textChunks,  String latestTextChunk,  Session? currentSession,  List<SessionExo> sessionExos,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ListeningScreenState() when $default != null:
return $default(_that.isListening,_that.detectedContext,_that.sessionTimer,_that.nextQuestionCountdown,_that.isQuestionReady,_that.isSessionEnded,_that.textChunks,_that.latestTextChunk,_that.currentSession,_that.sessionExos,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ListeningScreenState extends ListeningScreenState {
  const _ListeningScreenState({this.isListening = true, this.detectedContext = ContextType.podcast, this.sessionTimer = 0, this.nextQuestionCountdown = 15, this.isQuestionReady = false, this.isSessionEnded = false, final  List<String> textChunks = const [], this.latestTextChunk = '', this.currentSession, final  List<SessionExo> sessionExos = const [], this.isLoading = false, this.error}): _textChunks = textChunks,_sessionExos = sessionExos,super._();
  

@override@JsonKey() final  bool isListening;
@override@JsonKey() final  ContextType detectedContext;
@override@JsonKey() final  int sessionTimer;
@override@JsonKey() final  int nextQuestionCountdown;
@override@JsonKey() final  bool isQuestionReady;
@override@JsonKey() final  bool isSessionEnded;
 final  List<String> _textChunks;
@override@JsonKey() List<String> get textChunks {
  if (_textChunks is EqualUnmodifiableListView) return _textChunks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_textChunks);
}

@override@JsonKey() final  String latestTextChunk;
@override final  Session? currentSession;
 final  List<SessionExo> _sessionExos;
@override@JsonKey() List<SessionExo> get sessionExos {
  if (_sessionExos is EqualUnmodifiableListView) return _sessionExos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessionExos);
}

@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of ListeningScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListeningScreenStateCopyWith<_ListeningScreenState> get copyWith => __$ListeningScreenStateCopyWithImpl<_ListeningScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListeningScreenState&&(identical(other.isListening, isListening) || other.isListening == isListening)&&(identical(other.detectedContext, detectedContext) || other.detectedContext == detectedContext)&&(identical(other.sessionTimer, sessionTimer) || other.sessionTimer == sessionTimer)&&(identical(other.nextQuestionCountdown, nextQuestionCountdown) || other.nextQuestionCountdown == nextQuestionCountdown)&&(identical(other.isQuestionReady, isQuestionReady) || other.isQuestionReady == isQuestionReady)&&(identical(other.isSessionEnded, isSessionEnded) || other.isSessionEnded == isSessionEnded)&&const DeepCollectionEquality().equals(other._textChunks, _textChunks)&&(identical(other.latestTextChunk, latestTextChunk) || other.latestTextChunk == latestTextChunk)&&(identical(other.currentSession, currentSession) || other.currentSession == currentSession)&&const DeepCollectionEquality().equals(other._sessionExos, _sessionExos)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isListening,detectedContext,sessionTimer,nextQuestionCountdown,isQuestionReady,isSessionEnded,const DeepCollectionEquality().hash(_textChunks),latestTextChunk,currentSession,const DeepCollectionEquality().hash(_sessionExos),isLoading,error);

@override
String toString() {
  return 'ListeningScreenState(isListening: $isListening, detectedContext: $detectedContext, sessionTimer: $sessionTimer, nextQuestionCountdown: $nextQuestionCountdown, isQuestionReady: $isQuestionReady, isSessionEnded: $isSessionEnded, textChunks: $textChunks, latestTextChunk: $latestTextChunk, currentSession: $currentSession, sessionExos: $sessionExos, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ListeningScreenStateCopyWith<$Res> implements $ListeningScreenStateCopyWith<$Res> {
  factory _$ListeningScreenStateCopyWith(_ListeningScreenState value, $Res Function(_ListeningScreenState) _then) = __$ListeningScreenStateCopyWithImpl;
@override @useResult
$Res call({
 bool isListening, ContextType detectedContext, int sessionTimer, int nextQuestionCountdown, bool isQuestionReady, bool isSessionEnded, List<String> textChunks, String latestTextChunk, Session? currentSession, List<SessionExo> sessionExos, bool isLoading, String? error
});


@override $SessionCopyWith<$Res>? get currentSession;

}
/// @nodoc
class __$ListeningScreenStateCopyWithImpl<$Res>
    implements _$ListeningScreenStateCopyWith<$Res> {
  __$ListeningScreenStateCopyWithImpl(this._self, this._then);

  final _ListeningScreenState _self;
  final $Res Function(_ListeningScreenState) _then;

/// Create a copy of ListeningScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isListening = null,Object? detectedContext = null,Object? sessionTimer = null,Object? nextQuestionCountdown = null,Object? isQuestionReady = null,Object? isSessionEnded = null,Object? textChunks = null,Object? latestTextChunk = null,Object? currentSession = freezed,Object? sessionExos = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_ListeningScreenState(
isListening: null == isListening ? _self.isListening : isListening // ignore: cast_nullable_to_non_nullable
as bool,detectedContext: null == detectedContext ? _self.detectedContext : detectedContext // ignore: cast_nullable_to_non_nullable
as ContextType,sessionTimer: null == sessionTimer ? _self.sessionTimer : sessionTimer // ignore: cast_nullable_to_non_nullable
as int,nextQuestionCountdown: null == nextQuestionCountdown ? _self.nextQuestionCountdown : nextQuestionCountdown // ignore: cast_nullable_to_non_nullable
as int,isQuestionReady: null == isQuestionReady ? _self.isQuestionReady : isQuestionReady // ignore: cast_nullable_to_non_nullable
as bool,isSessionEnded: null == isSessionEnded ? _self.isSessionEnded : isSessionEnded // ignore: cast_nullable_to_non_nullable
as bool,textChunks: null == textChunks ? _self._textChunks : textChunks // ignore: cast_nullable_to_non_nullable
as List<String>,latestTextChunk: null == latestTextChunk ? _self.latestTextChunk : latestTextChunk // ignore: cast_nullable_to_non_nullable
as String,currentSession: freezed == currentSession ? _self.currentSession : currentSession // ignore: cast_nullable_to_non_nullable
as Session?,sessionExos: null == sessionExos ? _self._sessionExos : sessionExos // ignore: cast_nullable_to_non_nullable
as List<SessionExo>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ListeningScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionCopyWith<$Res>? get currentSession {
    if (_self.currentSession == null) {
    return null;
  }

  return $SessionCopyWith<$Res>(_self.currentSession!, (value) {
    return _then(_self.copyWith(currentSession: value));
  });
}
}

// dart format on
