// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'knowledge_vault_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$KnowledgeVaultScreenState {

 List<Note> get allNotes; List<Note> get filteredNotes; String get searchQuery; String? get selectedTheme; bool get isLoading; String? get error; bool get showFavoritesOnly;
/// Create a copy of KnowledgeVaultScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KnowledgeVaultScreenStateCopyWith<KnowledgeVaultScreenState> get copyWith => _$KnowledgeVaultScreenStateCopyWithImpl<KnowledgeVaultScreenState>(this as KnowledgeVaultScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KnowledgeVaultScreenState&&const DeepCollectionEquality().equals(other.allNotes, allNotes)&&const DeepCollectionEquality().equals(other.filteredNotes, filteredNotes)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.selectedTheme, selectedTheme) || other.selectedTheme == selectedTheme)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.showFavoritesOnly, showFavoritesOnly) || other.showFavoritesOnly == showFavoritesOnly));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(allNotes),const DeepCollectionEquality().hash(filteredNotes),searchQuery,selectedTheme,isLoading,error,showFavoritesOnly);

@override
String toString() {
  return 'KnowledgeVaultScreenState(allNotes: $allNotes, filteredNotes: $filteredNotes, searchQuery: $searchQuery, selectedTheme: $selectedTheme, isLoading: $isLoading, error: $error, showFavoritesOnly: $showFavoritesOnly)';
}


}

/// @nodoc
abstract mixin class $KnowledgeVaultScreenStateCopyWith<$Res>  {
  factory $KnowledgeVaultScreenStateCopyWith(KnowledgeVaultScreenState value, $Res Function(KnowledgeVaultScreenState) _then) = _$KnowledgeVaultScreenStateCopyWithImpl;
@useResult
$Res call({
 List<Note> allNotes, List<Note> filteredNotes, String searchQuery, String? selectedTheme, bool isLoading, String? error, bool showFavoritesOnly
});




}
/// @nodoc
class _$KnowledgeVaultScreenStateCopyWithImpl<$Res>
    implements $KnowledgeVaultScreenStateCopyWith<$Res> {
  _$KnowledgeVaultScreenStateCopyWithImpl(this._self, this._then);

  final KnowledgeVaultScreenState _self;
  final $Res Function(KnowledgeVaultScreenState) _then;

/// Create a copy of KnowledgeVaultScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? allNotes = null,Object? filteredNotes = null,Object? searchQuery = null,Object? selectedTheme = freezed,Object? isLoading = null,Object? error = freezed,Object? showFavoritesOnly = null,}) {
  return _then(_self.copyWith(
allNotes: null == allNotes ? _self.allNotes : allNotes // ignore: cast_nullable_to_non_nullable
as List<Note>,filteredNotes: null == filteredNotes ? _self.filteredNotes : filteredNotes // ignore: cast_nullable_to_non_nullable
as List<Note>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,selectedTheme: freezed == selectedTheme ? _self.selectedTheme : selectedTheme // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,showFavoritesOnly: null == showFavoritesOnly ? _self.showFavoritesOnly : showFavoritesOnly // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [KnowledgeVaultScreenState].
extension KnowledgeVaultScreenStatePatterns on KnowledgeVaultScreenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KnowledgeVaultScreenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KnowledgeVaultScreenState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KnowledgeVaultScreenState value)  $default,){
final _that = this;
switch (_that) {
case _KnowledgeVaultScreenState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KnowledgeVaultScreenState value)?  $default,){
final _that = this;
switch (_that) {
case _KnowledgeVaultScreenState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Note> allNotes,  List<Note> filteredNotes,  String searchQuery,  String? selectedTheme,  bool isLoading,  String? error,  bool showFavoritesOnly)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KnowledgeVaultScreenState() when $default != null:
return $default(_that.allNotes,_that.filteredNotes,_that.searchQuery,_that.selectedTheme,_that.isLoading,_that.error,_that.showFavoritesOnly);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Note> allNotes,  List<Note> filteredNotes,  String searchQuery,  String? selectedTheme,  bool isLoading,  String? error,  bool showFavoritesOnly)  $default,) {final _that = this;
switch (_that) {
case _KnowledgeVaultScreenState():
return $default(_that.allNotes,_that.filteredNotes,_that.searchQuery,_that.selectedTheme,_that.isLoading,_that.error,_that.showFavoritesOnly);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Note> allNotes,  List<Note> filteredNotes,  String searchQuery,  String? selectedTheme,  bool isLoading,  String? error,  bool showFavoritesOnly)?  $default,) {final _that = this;
switch (_that) {
case _KnowledgeVaultScreenState() when $default != null:
return $default(_that.allNotes,_that.filteredNotes,_that.searchQuery,_that.selectedTheme,_that.isLoading,_that.error,_that.showFavoritesOnly);case _:
  return null;

}
}

}

/// @nodoc


class _KnowledgeVaultScreenState extends KnowledgeVaultScreenState {
  const _KnowledgeVaultScreenState({final  List<Note> allNotes = const [], final  List<Note> filteredNotes = const [], this.searchQuery = '', this.selectedTheme, this.isLoading = false, this.error, this.showFavoritesOnly = false}): _allNotes = allNotes,_filteredNotes = filteredNotes,super._();
  

 final  List<Note> _allNotes;
@override@JsonKey() List<Note> get allNotes {
  if (_allNotes is EqualUnmodifiableListView) return _allNotes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allNotes);
}

 final  List<Note> _filteredNotes;
@override@JsonKey() List<Note> get filteredNotes {
  if (_filteredNotes is EqualUnmodifiableListView) return _filteredNotes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredNotes);
}

@override@JsonKey() final  String searchQuery;
@override final  String? selectedTheme;
@override@JsonKey() final  bool isLoading;
@override final  String? error;
@override@JsonKey() final  bool showFavoritesOnly;

/// Create a copy of KnowledgeVaultScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KnowledgeVaultScreenStateCopyWith<_KnowledgeVaultScreenState> get copyWith => __$KnowledgeVaultScreenStateCopyWithImpl<_KnowledgeVaultScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KnowledgeVaultScreenState&&const DeepCollectionEquality().equals(other._allNotes, _allNotes)&&const DeepCollectionEquality().equals(other._filteredNotes, _filteredNotes)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.selectedTheme, selectedTheme) || other.selectedTheme == selectedTheme)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.showFavoritesOnly, showFavoritesOnly) || other.showFavoritesOnly == showFavoritesOnly));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_allNotes),const DeepCollectionEquality().hash(_filteredNotes),searchQuery,selectedTheme,isLoading,error,showFavoritesOnly);

@override
String toString() {
  return 'KnowledgeVaultScreenState(allNotes: $allNotes, filteredNotes: $filteredNotes, searchQuery: $searchQuery, selectedTheme: $selectedTheme, isLoading: $isLoading, error: $error, showFavoritesOnly: $showFavoritesOnly)';
}


}

/// @nodoc
abstract mixin class _$KnowledgeVaultScreenStateCopyWith<$Res> implements $KnowledgeVaultScreenStateCopyWith<$Res> {
  factory _$KnowledgeVaultScreenStateCopyWith(_KnowledgeVaultScreenState value, $Res Function(_KnowledgeVaultScreenState) _then) = __$KnowledgeVaultScreenStateCopyWithImpl;
@override @useResult
$Res call({
 List<Note> allNotes, List<Note> filteredNotes, String searchQuery, String? selectedTheme, bool isLoading, String? error, bool showFavoritesOnly
});




}
/// @nodoc
class __$KnowledgeVaultScreenStateCopyWithImpl<$Res>
    implements _$KnowledgeVaultScreenStateCopyWith<$Res> {
  __$KnowledgeVaultScreenStateCopyWithImpl(this._self, this._then);

  final _KnowledgeVaultScreenState _self;
  final $Res Function(_KnowledgeVaultScreenState) _then;

/// Create a copy of KnowledgeVaultScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? allNotes = null,Object? filteredNotes = null,Object? searchQuery = null,Object? selectedTheme = freezed,Object? isLoading = null,Object? error = freezed,Object? showFavoritesOnly = null,}) {
  return _then(_KnowledgeVaultScreenState(
allNotes: null == allNotes ? _self._allNotes : allNotes // ignore: cast_nullable_to_non_nullable
as List<Note>,filteredNotes: null == filteredNotes ? _self._filteredNotes : filteredNotes // ignore: cast_nullable_to_non_nullable
as List<Note>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,selectedTheme: freezed == selectedTheme ? _self.selectedTheme : selectedTheme // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,showFavoritesOnly: null == showFavoritesOnly ? _self.showFavoritesOnly : showFavoritesOnly // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
