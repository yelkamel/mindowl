// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

 String get uid; String get email; String? get displayName; String? get photoUrl;@TimestampDateTimeConverter() DateTime get createdAt;@TimestampDateTimeConverter() DateTime get updatedAt; bool get micropermission; UserSettings get settings; UserStats get stats;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.micropermission, micropermission) || other.micropermission == micropermission)&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.stats, stats) || other.stats == stats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,email,displayName,photoUrl,createdAt,updatedAt,micropermission,settings,stats);

@override
String toString() {
  return 'User(uid: $uid, email: $email, displayName: $displayName, photoUrl: $photoUrl, createdAt: $createdAt, updatedAt: $updatedAt, micropermission: $micropermission, settings: $settings, stats: $stats)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String uid, String email, String? displayName, String? photoUrl,@TimestampDateTimeConverter() DateTime createdAt,@TimestampDateTimeConverter() DateTime updatedAt, bool micropermission, UserSettings settings, UserStats stats
});


$UserSettingsCopyWith<$Res> get settings;$UserStatsCopyWith<$Res> get stats;

}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? email = null,Object? displayName = freezed,Object? photoUrl = freezed,Object? createdAt = null,Object? updatedAt = null,Object? micropermission = null,Object? settings = null,Object? stats = null,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,micropermission: null == micropermission ? _self.micropermission : micropermission // ignore: cast_nullable_to_non_nullable
as bool,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as UserSettings,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as UserStats,
  ));
}
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSettingsCopyWith<$Res> get settings {
  
  return $UserSettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserStatsCopyWith<$Res> get stats {
  
  return $UserStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String email,  String? displayName,  String? photoUrl, @TimestampDateTimeConverter()  DateTime createdAt, @TimestampDateTimeConverter()  DateTime updatedAt,  bool micropermission,  UserSettings settings,  UserStats stats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.uid,_that.email,_that.displayName,_that.photoUrl,_that.createdAt,_that.updatedAt,_that.micropermission,_that.settings,_that.stats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String email,  String? displayName,  String? photoUrl, @TimestampDateTimeConverter()  DateTime createdAt, @TimestampDateTimeConverter()  DateTime updatedAt,  bool micropermission,  UserSettings settings,  UserStats stats)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.uid,_that.email,_that.displayName,_that.photoUrl,_that.createdAt,_that.updatedAt,_that.micropermission,_that.settings,_that.stats);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String email,  String? displayName,  String? photoUrl, @TimestampDateTimeConverter()  DateTime createdAt, @TimestampDateTimeConverter()  DateTime updatedAt,  bool micropermission,  UserSettings settings,  UserStats stats)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.uid,_that.email,_that.displayName,_that.photoUrl,_that.createdAt,_that.updatedAt,_that.micropermission,_that.settings,_that.stats);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({required this.uid, required this.email, this.displayName, this.photoUrl, @TimestampDateTimeConverter() required this.createdAt, @TimestampDateTimeConverter() required this.updatedAt, this.micropermission = false, this.settings = const UserSettings(), this.stats = const UserStats()});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  String uid;
@override final  String email;
@override final  String? displayName;
@override final  String? photoUrl;
@override@TimestampDateTimeConverter() final  DateTime createdAt;
@override@TimestampDateTimeConverter() final  DateTime updatedAt;
@override@JsonKey() final  bool micropermission;
@override@JsonKey() final  UserSettings settings;
@override@JsonKey() final  UserStats stats;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.micropermission, micropermission) || other.micropermission == micropermission)&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.stats, stats) || other.stats == stats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,email,displayName,photoUrl,createdAt,updatedAt,micropermission,settings,stats);

@override
String toString() {
  return 'User(uid: $uid, email: $email, displayName: $displayName, photoUrl: $photoUrl, createdAt: $createdAt, updatedAt: $updatedAt, micropermission: $micropermission, settings: $settings, stats: $stats)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String uid, String email, String? displayName, String? photoUrl,@TimestampDateTimeConverter() DateTime createdAt,@TimestampDateTimeConverter() DateTime updatedAt, bool micropermission, UserSettings settings, UserStats stats
});


@override $UserSettingsCopyWith<$Res> get settings;@override $UserStatsCopyWith<$Res> get stats;

}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? email = null,Object? displayName = freezed,Object? photoUrl = freezed,Object? createdAt = null,Object? updatedAt = null,Object? micropermission = null,Object? settings = null,Object? stats = null,}) {
  return _then(_User(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,micropermission: null == micropermission ? _self.micropermission : micropermission // ignore: cast_nullable_to_non_nullable
as bool,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as UserSettings,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as UserStats,
  ));
}

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSettingsCopyWith<$Res> get settings {
  
  return $UserSettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserStatsCopyWith<$Res> get stats {
  
  return $UserStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// @nodoc
mixin _$UserSettings {

 String get language; bool get soundEnabled; bool get notificationsEnabled; bool get darkMode; int get sessionReminderMinutes; UserDifficulty get preferredDifficulty;
/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSettingsCopyWith<UserSettings> get copyWith => _$UserSettingsCopyWithImpl<UserSettings>(this as UserSettings, _$identity);

  /// Serializes this UserSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSettings&&(identical(other.language, language) || other.language == language)&&(identical(other.soundEnabled, soundEnabled) || other.soundEnabled == soundEnabled)&&(identical(other.notificationsEnabled, notificationsEnabled) || other.notificationsEnabled == notificationsEnabled)&&(identical(other.darkMode, darkMode) || other.darkMode == darkMode)&&(identical(other.sessionReminderMinutes, sessionReminderMinutes) || other.sessionReminderMinutes == sessionReminderMinutes)&&(identical(other.preferredDifficulty, preferredDifficulty) || other.preferredDifficulty == preferredDifficulty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,language,soundEnabled,notificationsEnabled,darkMode,sessionReminderMinutes,preferredDifficulty);

@override
String toString() {
  return 'UserSettings(language: $language, soundEnabled: $soundEnabled, notificationsEnabled: $notificationsEnabled, darkMode: $darkMode, sessionReminderMinutes: $sessionReminderMinutes, preferredDifficulty: $preferredDifficulty)';
}


}

/// @nodoc
abstract mixin class $UserSettingsCopyWith<$Res>  {
  factory $UserSettingsCopyWith(UserSettings value, $Res Function(UserSettings) _then) = _$UserSettingsCopyWithImpl;
@useResult
$Res call({
 String language, bool soundEnabled, bool notificationsEnabled, bool darkMode, int sessionReminderMinutes, UserDifficulty preferredDifficulty
});




}
/// @nodoc
class _$UserSettingsCopyWithImpl<$Res>
    implements $UserSettingsCopyWith<$Res> {
  _$UserSettingsCopyWithImpl(this._self, this._then);

  final UserSettings _self;
  final $Res Function(UserSettings) _then;

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? language = null,Object? soundEnabled = null,Object? notificationsEnabled = null,Object? darkMode = null,Object? sessionReminderMinutes = null,Object? preferredDifficulty = null,}) {
  return _then(_self.copyWith(
language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,soundEnabled: null == soundEnabled ? _self.soundEnabled : soundEnabled // ignore: cast_nullable_to_non_nullable
as bool,notificationsEnabled: null == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,darkMode: null == darkMode ? _self.darkMode : darkMode // ignore: cast_nullable_to_non_nullable
as bool,sessionReminderMinutes: null == sessionReminderMinutes ? _self.sessionReminderMinutes : sessionReminderMinutes // ignore: cast_nullable_to_non_nullable
as int,preferredDifficulty: null == preferredDifficulty ? _self.preferredDifficulty : preferredDifficulty // ignore: cast_nullable_to_non_nullable
as UserDifficulty,
  ));
}

}


/// Adds pattern-matching-related methods to [UserSettings].
extension UserSettingsPatterns on UserSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSettings value)  $default,){
final _that = this;
switch (_that) {
case _UserSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSettings value)?  $default,){
final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String language,  bool soundEnabled,  bool notificationsEnabled,  bool darkMode,  int sessionReminderMinutes,  UserDifficulty preferredDifficulty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that.language,_that.soundEnabled,_that.notificationsEnabled,_that.darkMode,_that.sessionReminderMinutes,_that.preferredDifficulty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String language,  bool soundEnabled,  bool notificationsEnabled,  bool darkMode,  int sessionReminderMinutes,  UserDifficulty preferredDifficulty)  $default,) {final _that = this;
switch (_that) {
case _UserSettings():
return $default(_that.language,_that.soundEnabled,_that.notificationsEnabled,_that.darkMode,_that.sessionReminderMinutes,_that.preferredDifficulty);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String language,  bool soundEnabled,  bool notificationsEnabled,  bool darkMode,  int sessionReminderMinutes,  UserDifficulty preferredDifficulty)?  $default,) {final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that.language,_that.soundEnabled,_that.notificationsEnabled,_that.darkMode,_that.sessionReminderMinutes,_that.preferredDifficulty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSettings implements UserSettings {
  const _UserSettings({this.language = 'en', this.soundEnabled = true, this.notificationsEnabled = true, this.darkMode = false, this.sessionReminderMinutes = 30, this.preferredDifficulty = UserDifficulty.medium});
  factory _UserSettings.fromJson(Map<String, dynamic> json) => _$UserSettingsFromJson(json);

@override@JsonKey() final  String language;
@override@JsonKey() final  bool soundEnabled;
@override@JsonKey() final  bool notificationsEnabled;
@override@JsonKey() final  bool darkMode;
@override@JsonKey() final  int sessionReminderMinutes;
@override@JsonKey() final  UserDifficulty preferredDifficulty;

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSettingsCopyWith<_UserSettings> get copyWith => __$UserSettingsCopyWithImpl<_UserSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSettings&&(identical(other.language, language) || other.language == language)&&(identical(other.soundEnabled, soundEnabled) || other.soundEnabled == soundEnabled)&&(identical(other.notificationsEnabled, notificationsEnabled) || other.notificationsEnabled == notificationsEnabled)&&(identical(other.darkMode, darkMode) || other.darkMode == darkMode)&&(identical(other.sessionReminderMinutes, sessionReminderMinutes) || other.sessionReminderMinutes == sessionReminderMinutes)&&(identical(other.preferredDifficulty, preferredDifficulty) || other.preferredDifficulty == preferredDifficulty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,language,soundEnabled,notificationsEnabled,darkMode,sessionReminderMinutes,preferredDifficulty);

@override
String toString() {
  return 'UserSettings(language: $language, soundEnabled: $soundEnabled, notificationsEnabled: $notificationsEnabled, darkMode: $darkMode, sessionReminderMinutes: $sessionReminderMinutes, preferredDifficulty: $preferredDifficulty)';
}


}

/// @nodoc
abstract mixin class _$UserSettingsCopyWith<$Res> implements $UserSettingsCopyWith<$Res> {
  factory _$UserSettingsCopyWith(_UserSettings value, $Res Function(_UserSettings) _then) = __$UserSettingsCopyWithImpl;
@override @useResult
$Res call({
 String language, bool soundEnabled, bool notificationsEnabled, bool darkMode, int sessionReminderMinutes, UserDifficulty preferredDifficulty
});




}
/// @nodoc
class __$UserSettingsCopyWithImpl<$Res>
    implements _$UserSettingsCopyWith<$Res> {
  __$UserSettingsCopyWithImpl(this._self, this._then);

  final _UserSettings _self;
  final $Res Function(_UserSettings) _then;

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? language = null,Object? soundEnabled = null,Object? notificationsEnabled = null,Object? darkMode = null,Object? sessionReminderMinutes = null,Object? preferredDifficulty = null,}) {
  return _then(_UserSettings(
language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,soundEnabled: null == soundEnabled ? _self.soundEnabled : soundEnabled // ignore: cast_nullable_to_non_nullable
as bool,notificationsEnabled: null == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,darkMode: null == darkMode ? _self.darkMode : darkMode // ignore: cast_nullable_to_non_nullable
as bool,sessionReminderMinutes: null == sessionReminderMinutes ? _self.sessionReminderMinutes : sessionReminderMinutes // ignore: cast_nullable_to_non_nullable
as int,preferredDifficulty: null == preferredDifficulty ? _self.preferredDifficulty : preferredDifficulty // ignore: cast_nullable_to_non_nullable
as UserDifficulty,
  ));
}


}


/// @nodoc
mixin _$UserStats {

 int get totalXp; int get currentStreak; int get longestStreak; int get totalSessions; int get totalNotesCreated; int get totalExosAnswered; int get totalCorrectAnswers; double get averageAccuracy;@NullableTimestampDateTimeConverter() DateTime? get lastActivityAt;
/// Create a copy of UserStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserStatsCopyWith<UserStats> get copyWith => _$UserStatsCopyWithImpl<UserStats>(this as UserStats, _$identity);

  /// Serializes this UserStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserStats&&(identical(other.totalXp, totalXp) || other.totalXp == totalXp)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.longestStreak, longestStreak) || other.longestStreak == longestStreak)&&(identical(other.totalSessions, totalSessions) || other.totalSessions == totalSessions)&&(identical(other.totalNotesCreated, totalNotesCreated) || other.totalNotesCreated == totalNotesCreated)&&(identical(other.totalExosAnswered, totalExosAnswered) || other.totalExosAnswered == totalExosAnswered)&&(identical(other.totalCorrectAnswers, totalCorrectAnswers) || other.totalCorrectAnswers == totalCorrectAnswers)&&(identical(other.averageAccuracy, averageAccuracy) || other.averageAccuracy == averageAccuracy)&&(identical(other.lastActivityAt, lastActivityAt) || other.lastActivityAt == lastActivityAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalXp,currentStreak,longestStreak,totalSessions,totalNotesCreated,totalExosAnswered,totalCorrectAnswers,averageAccuracy,lastActivityAt);

@override
String toString() {
  return 'UserStats(totalXp: $totalXp, currentStreak: $currentStreak, longestStreak: $longestStreak, totalSessions: $totalSessions, totalNotesCreated: $totalNotesCreated, totalExosAnswered: $totalExosAnswered, totalCorrectAnswers: $totalCorrectAnswers, averageAccuracy: $averageAccuracy, lastActivityAt: $lastActivityAt)';
}


}

/// @nodoc
abstract mixin class $UserStatsCopyWith<$Res>  {
  factory $UserStatsCopyWith(UserStats value, $Res Function(UserStats) _then) = _$UserStatsCopyWithImpl;
@useResult
$Res call({
 int totalXp, int currentStreak, int longestStreak, int totalSessions, int totalNotesCreated, int totalExosAnswered, int totalCorrectAnswers, double averageAccuracy,@NullableTimestampDateTimeConverter() DateTime? lastActivityAt
});




}
/// @nodoc
class _$UserStatsCopyWithImpl<$Res>
    implements $UserStatsCopyWith<$Res> {
  _$UserStatsCopyWithImpl(this._self, this._then);

  final UserStats _self;
  final $Res Function(UserStats) _then;

/// Create a copy of UserStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalXp = null,Object? currentStreak = null,Object? longestStreak = null,Object? totalSessions = null,Object? totalNotesCreated = null,Object? totalExosAnswered = null,Object? totalCorrectAnswers = null,Object? averageAccuracy = null,Object? lastActivityAt = freezed,}) {
  return _then(_self.copyWith(
totalXp: null == totalXp ? _self.totalXp : totalXp // ignore: cast_nullable_to_non_nullable
as int,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,longestStreak: null == longestStreak ? _self.longestStreak : longestStreak // ignore: cast_nullable_to_non_nullable
as int,totalSessions: null == totalSessions ? _self.totalSessions : totalSessions // ignore: cast_nullable_to_non_nullable
as int,totalNotesCreated: null == totalNotesCreated ? _self.totalNotesCreated : totalNotesCreated // ignore: cast_nullable_to_non_nullable
as int,totalExosAnswered: null == totalExosAnswered ? _self.totalExosAnswered : totalExosAnswered // ignore: cast_nullable_to_non_nullable
as int,totalCorrectAnswers: null == totalCorrectAnswers ? _self.totalCorrectAnswers : totalCorrectAnswers // ignore: cast_nullable_to_non_nullable
as int,averageAccuracy: null == averageAccuracy ? _self.averageAccuracy : averageAccuracy // ignore: cast_nullable_to_non_nullable
as double,lastActivityAt: freezed == lastActivityAt ? _self.lastActivityAt : lastActivityAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserStats].
extension UserStatsPatterns on UserStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserStats value)  $default,){
final _that = this;
switch (_that) {
case _UserStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserStats value)?  $default,){
final _that = this;
switch (_that) {
case _UserStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalXp,  int currentStreak,  int longestStreak,  int totalSessions,  int totalNotesCreated,  int totalExosAnswered,  int totalCorrectAnswers,  double averageAccuracy, @NullableTimestampDateTimeConverter()  DateTime? lastActivityAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserStats() when $default != null:
return $default(_that.totalXp,_that.currentStreak,_that.longestStreak,_that.totalSessions,_that.totalNotesCreated,_that.totalExosAnswered,_that.totalCorrectAnswers,_that.averageAccuracy,_that.lastActivityAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalXp,  int currentStreak,  int longestStreak,  int totalSessions,  int totalNotesCreated,  int totalExosAnswered,  int totalCorrectAnswers,  double averageAccuracy, @NullableTimestampDateTimeConverter()  DateTime? lastActivityAt)  $default,) {final _that = this;
switch (_that) {
case _UserStats():
return $default(_that.totalXp,_that.currentStreak,_that.longestStreak,_that.totalSessions,_that.totalNotesCreated,_that.totalExosAnswered,_that.totalCorrectAnswers,_that.averageAccuracy,_that.lastActivityAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalXp,  int currentStreak,  int longestStreak,  int totalSessions,  int totalNotesCreated,  int totalExosAnswered,  int totalCorrectAnswers,  double averageAccuracy, @NullableTimestampDateTimeConverter()  DateTime? lastActivityAt)?  $default,) {final _that = this;
switch (_that) {
case _UserStats() when $default != null:
return $default(_that.totalXp,_that.currentStreak,_that.longestStreak,_that.totalSessions,_that.totalNotesCreated,_that.totalExosAnswered,_that.totalCorrectAnswers,_that.averageAccuracy,_that.lastActivityAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserStats extends UserStats {
  const _UserStats({this.totalXp = 0, this.currentStreak = 0, this.longestStreak = 0, this.totalSessions = 0, this.totalNotesCreated = 0, this.totalExosAnswered = 0, this.totalCorrectAnswers = 0, this.averageAccuracy = 0.0, @NullableTimestampDateTimeConverter() this.lastActivityAt}): super._();
  factory _UserStats.fromJson(Map<String, dynamic> json) => _$UserStatsFromJson(json);

@override@JsonKey() final  int totalXp;
@override@JsonKey() final  int currentStreak;
@override@JsonKey() final  int longestStreak;
@override@JsonKey() final  int totalSessions;
@override@JsonKey() final  int totalNotesCreated;
@override@JsonKey() final  int totalExosAnswered;
@override@JsonKey() final  int totalCorrectAnswers;
@override@JsonKey() final  double averageAccuracy;
@override@NullableTimestampDateTimeConverter() final  DateTime? lastActivityAt;

/// Create a copy of UserStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserStatsCopyWith<_UserStats> get copyWith => __$UserStatsCopyWithImpl<_UserStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserStats&&(identical(other.totalXp, totalXp) || other.totalXp == totalXp)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.longestStreak, longestStreak) || other.longestStreak == longestStreak)&&(identical(other.totalSessions, totalSessions) || other.totalSessions == totalSessions)&&(identical(other.totalNotesCreated, totalNotesCreated) || other.totalNotesCreated == totalNotesCreated)&&(identical(other.totalExosAnswered, totalExosAnswered) || other.totalExosAnswered == totalExosAnswered)&&(identical(other.totalCorrectAnswers, totalCorrectAnswers) || other.totalCorrectAnswers == totalCorrectAnswers)&&(identical(other.averageAccuracy, averageAccuracy) || other.averageAccuracy == averageAccuracy)&&(identical(other.lastActivityAt, lastActivityAt) || other.lastActivityAt == lastActivityAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalXp,currentStreak,longestStreak,totalSessions,totalNotesCreated,totalExosAnswered,totalCorrectAnswers,averageAccuracy,lastActivityAt);

@override
String toString() {
  return 'UserStats(totalXp: $totalXp, currentStreak: $currentStreak, longestStreak: $longestStreak, totalSessions: $totalSessions, totalNotesCreated: $totalNotesCreated, totalExosAnswered: $totalExosAnswered, totalCorrectAnswers: $totalCorrectAnswers, averageAccuracy: $averageAccuracy, lastActivityAt: $lastActivityAt)';
}


}

/// @nodoc
abstract mixin class _$UserStatsCopyWith<$Res> implements $UserStatsCopyWith<$Res> {
  factory _$UserStatsCopyWith(_UserStats value, $Res Function(_UserStats) _then) = __$UserStatsCopyWithImpl;
@override @useResult
$Res call({
 int totalXp, int currentStreak, int longestStreak, int totalSessions, int totalNotesCreated, int totalExosAnswered, int totalCorrectAnswers, double averageAccuracy,@NullableTimestampDateTimeConverter() DateTime? lastActivityAt
});




}
/// @nodoc
class __$UserStatsCopyWithImpl<$Res>
    implements _$UserStatsCopyWith<$Res> {
  __$UserStatsCopyWithImpl(this._self, this._then);

  final _UserStats _self;
  final $Res Function(_UserStats) _then;

/// Create a copy of UserStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalXp = null,Object? currentStreak = null,Object? longestStreak = null,Object? totalSessions = null,Object? totalNotesCreated = null,Object? totalExosAnswered = null,Object? totalCorrectAnswers = null,Object? averageAccuracy = null,Object? lastActivityAt = freezed,}) {
  return _then(_UserStats(
totalXp: null == totalXp ? _self.totalXp : totalXp // ignore: cast_nullable_to_non_nullable
as int,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,longestStreak: null == longestStreak ? _self.longestStreak : longestStreak // ignore: cast_nullable_to_non_nullable
as int,totalSessions: null == totalSessions ? _self.totalSessions : totalSessions // ignore: cast_nullable_to_non_nullable
as int,totalNotesCreated: null == totalNotesCreated ? _self.totalNotesCreated : totalNotesCreated // ignore: cast_nullable_to_non_nullable
as int,totalExosAnswered: null == totalExosAnswered ? _self.totalExosAnswered : totalExosAnswered // ignore: cast_nullable_to_non_nullable
as int,totalCorrectAnswers: null == totalCorrectAnswers ? _self.totalCorrectAnswers : totalCorrectAnswers // ignore: cast_nullable_to_non_nullable
as int,averageAccuracy: null == averageAccuracy ? _self.averageAccuracy : averageAccuracy // ignore: cast_nullable_to_non_nullable
as double,lastActivityAt: freezed == lastActivityAt ? _self.lastActivityAt : lastActivityAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
