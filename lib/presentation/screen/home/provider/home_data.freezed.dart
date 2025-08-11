// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeData {

 int get currentStreak; int get currentLevel; int get currentXP; int get maxXP; int get todaySessions; int get totalXP; double get accuracy; List<Note> get recentNotes; List<Session> get recentSessions;
/// Create a copy of HomeData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeDataCopyWith<HomeData> get copyWith => _$HomeDataCopyWithImpl<HomeData>(this as HomeData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeData&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.currentLevel, currentLevel) || other.currentLevel == currentLevel)&&(identical(other.currentXP, currentXP) || other.currentXP == currentXP)&&(identical(other.maxXP, maxXP) || other.maxXP == maxXP)&&(identical(other.todaySessions, todaySessions) || other.todaySessions == todaySessions)&&(identical(other.totalXP, totalXP) || other.totalXP == totalXP)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy)&&const DeepCollectionEquality().equals(other.recentNotes, recentNotes)&&const DeepCollectionEquality().equals(other.recentSessions, recentSessions));
}


@override
int get hashCode => Object.hash(runtimeType,currentStreak,currentLevel,currentXP,maxXP,todaySessions,totalXP,accuracy,const DeepCollectionEquality().hash(recentNotes),const DeepCollectionEquality().hash(recentSessions));

@override
String toString() {
  return 'HomeData(currentStreak: $currentStreak, currentLevel: $currentLevel, currentXP: $currentXP, maxXP: $maxXP, todaySessions: $todaySessions, totalXP: $totalXP, accuracy: $accuracy, recentNotes: $recentNotes, recentSessions: $recentSessions)';
}


}

/// @nodoc
abstract mixin class $HomeDataCopyWith<$Res>  {
  factory $HomeDataCopyWith(HomeData value, $Res Function(HomeData) _then) = _$HomeDataCopyWithImpl;
@useResult
$Res call({
 int currentStreak, int currentLevel, int currentXP, int maxXP, int todaySessions, int totalXP, double accuracy, List<Note> recentNotes, List<Session> recentSessions
});




}
/// @nodoc
class _$HomeDataCopyWithImpl<$Res>
    implements $HomeDataCopyWith<$Res> {
  _$HomeDataCopyWithImpl(this._self, this._then);

  final HomeData _self;
  final $Res Function(HomeData) _then;

/// Create a copy of HomeData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStreak = null,Object? currentLevel = null,Object? currentXP = null,Object? maxXP = null,Object? todaySessions = null,Object? totalXP = null,Object? accuracy = null,Object? recentNotes = null,Object? recentSessions = null,}) {
  return _then(_self.copyWith(
currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,currentLevel: null == currentLevel ? _self.currentLevel : currentLevel // ignore: cast_nullable_to_non_nullable
as int,currentXP: null == currentXP ? _self.currentXP : currentXP // ignore: cast_nullable_to_non_nullable
as int,maxXP: null == maxXP ? _self.maxXP : maxXP // ignore: cast_nullable_to_non_nullable
as int,todaySessions: null == todaySessions ? _self.todaySessions : todaySessions // ignore: cast_nullable_to_non_nullable
as int,totalXP: null == totalXP ? _self.totalXP : totalXP // ignore: cast_nullable_to_non_nullable
as int,accuracy: null == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double,recentNotes: null == recentNotes ? _self.recentNotes : recentNotes // ignore: cast_nullable_to_non_nullable
as List<Note>,recentSessions: null == recentSessions ? _self.recentSessions : recentSessions // ignore: cast_nullable_to_non_nullable
as List<Session>,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeData].
extension HomeDataPatterns on HomeData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeData value)  $default,){
final _that = this;
switch (_that) {
case _HomeData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeData value)?  $default,){
final _that = this;
switch (_that) {
case _HomeData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentStreak,  int currentLevel,  int currentXP,  int maxXP,  int todaySessions,  int totalXP,  double accuracy,  List<Note> recentNotes,  List<Session> recentSessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeData() when $default != null:
return $default(_that.currentStreak,_that.currentLevel,_that.currentXP,_that.maxXP,_that.todaySessions,_that.totalXP,_that.accuracy,_that.recentNotes,_that.recentSessions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentStreak,  int currentLevel,  int currentXP,  int maxXP,  int todaySessions,  int totalXP,  double accuracy,  List<Note> recentNotes,  List<Session> recentSessions)  $default,) {final _that = this;
switch (_that) {
case _HomeData():
return $default(_that.currentStreak,_that.currentLevel,_that.currentXP,_that.maxXP,_that.todaySessions,_that.totalXP,_that.accuracy,_that.recentNotes,_that.recentSessions);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentStreak,  int currentLevel,  int currentXP,  int maxXP,  int todaySessions,  int totalXP,  double accuracy,  List<Note> recentNotes,  List<Session> recentSessions)?  $default,) {final _that = this;
switch (_that) {
case _HomeData() when $default != null:
return $default(_that.currentStreak,_that.currentLevel,_that.currentXP,_that.maxXP,_that.todaySessions,_that.totalXP,_that.accuracy,_that.recentNotes,_that.recentSessions);case _:
  return null;

}
}

}

/// @nodoc


class _HomeData extends HomeData {
  const _HomeData({required this.currentStreak, required this.currentLevel, required this.currentXP, required this.maxXP, required this.todaySessions, required this.totalXP, required this.accuracy, required final  List<Note> recentNotes, required final  List<Session> recentSessions}): _recentNotes = recentNotes,_recentSessions = recentSessions,super._();
  

@override final  int currentStreak;
@override final  int currentLevel;
@override final  int currentXP;
@override final  int maxXP;
@override final  int todaySessions;
@override final  int totalXP;
@override final  double accuracy;
 final  List<Note> _recentNotes;
@override List<Note> get recentNotes {
  if (_recentNotes is EqualUnmodifiableListView) return _recentNotes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentNotes);
}

 final  List<Session> _recentSessions;
@override List<Session> get recentSessions {
  if (_recentSessions is EqualUnmodifiableListView) return _recentSessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentSessions);
}


/// Create a copy of HomeData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeDataCopyWith<_HomeData> get copyWith => __$HomeDataCopyWithImpl<_HomeData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeData&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.currentLevel, currentLevel) || other.currentLevel == currentLevel)&&(identical(other.currentXP, currentXP) || other.currentXP == currentXP)&&(identical(other.maxXP, maxXP) || other.maxXP == maxXP)&&(identical(other.todaySessions, todaySessions) || other.todaySessions == todaySessions)&&(identical(other.totalXP, totalXP) || other.totalXP == totalXP)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy)&&const DeepCollectionEquality().equals(other._recentNotes, _recentNotes)&&const DeepCollectionEquality().equals(other._recentSessions, _recentSessions));
}


@override
int get hashCode => Object.hash(runtimeType,currentStreak,currentLevel,currentXP,maxXP,todaySessions,totalXP,accuracy,const DeepCollectionEquality().hash(_recentNotes),const DeepCollectionEquality().hash(_recentSessions));

@override
String toString() {
  return 'HomeData(currentStreak: $currentStreak, currentLevel: $currentLevel, currentXP: $currentXP, maxXP: $maxXP, todaySessions: $todaySessions, totalXP: $totalXP, accuracy: $accuracy, recentNotes: $recentNotes, recentSessions: $recentSessions)';
}


}

/// @nodoc
abstract mixin class _$HomeDataCopyWith<$Res> implements $HomeDataCopyWith<$Res> {
  factory _$HomeDataCopyWith(_HomeData value, $Res Function(_HomeData) _then) = __$HomeDataCopyWithImpl;
@override @useResult
$Res call({
 int currentStreak, int currentLevel, int currentXP, int maxXP, int todaySessions, int totalXP, double accuracy, List<Note> recentNotes, List<Session> recentSessions
});




}
/// @nodoc
class __$HomeDataCopyWithImpl<$Res>
    implements _$HomeDataCopyWith<$Res> {
  __$HomeDataCopyWithImpl(this._self, this._then);

  final _HomeData _self;
  final $Res Function(_HomeData) _then;

/// Create a copy of HomeData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStreak = null,Object? currentLevel = null,Object? currentXP = null,Object? maxXP = null,Object? todaySessions = null,Object? totalXP = null,Object? accuracy = null,Object? recentNotes = null,Object? recentSessions = null,}) {
  return _then(_HomeData(
currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,currentLevel: null == currentLevel ? _self.currentLevel : currentLevel // ignore: cast_nullable_to_non_nullable
as int,currentXP: null == currentXP ? _self.currentXP : currentXP // ignore: cast_nullable_to_non_nullable
as int,maxXP: null == maxXP ? _self.maxXP : maxXP // ignore: cast_nullable_to_non_nullable
as int,todaySessions: null == todaySessions ? _self.todaySessions : todaySessions // ignore: cast_nullable_to_non_nullable
as int,totalXP: null == totalXP ? _self.totalXP : totalXP // ignore: cast_nullable_to_non_nullable
as int,accuracy: null == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double,recentNotes: null == recentNotes ? _self._recentNotes : recentNotes // ignore: cast_nullable_to_non_nullable
as List<Note>,recentSessions: null == recentSessions ? _self._recentSessions : recentSessions // ignore: cast_nullable_to_non_nullable
as List<Session>,
  ));
}


}

// dart format on
