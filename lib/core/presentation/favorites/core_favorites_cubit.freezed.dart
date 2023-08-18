// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'core_favorites_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CoreFavoritesState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<String> get favoriteIds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CoreFavoritesStateCopyWith<CoreFavoritesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoreFavoritesStateCopyWith<$Res> {
  factory $CoreFavoritesStateCopyWith(
          CoreFavoritesState value, $Res Function(CoreFavoritesState) then) =
      _$CoreFavoritesStateCopyWithImpl<$Res, CoreFavoritesState>;
  @useResult
  $Res call({bool isLoading, List<String> favoriteIds});
}

/// @nodoc
class _$CoreFavoritesStateCopyWithImpl<$Res, $Val extends CoreFavoritesState>
    implements $CoreFavoritesStateCopyWith<$Res> {
  _$CoreFavoritesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? favoriteIds = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      favoriteIds: null == favoriteIds
          ? _value.favoriteIds
          : favoriteIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CoreFavoritesStateCopyWith<$Res>
    implements $CoreFavoritesStateCopyWith<$Res> {
  factory _$$_CoreFavoritesStateCopyWith(_$_CoreFavoritesState value,
          $Res Function(_$_CoreFavoritesState) then) =
      __$$_CoreFavoritesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<String> favoriteIds});
}

/// @nodoc
class __$$_CoreFavoritesStateCopyWithImpl<$Res>
    extends _$CoreFavoritesStateCopyWithImpl<$Res, _$_CoreFavoritesState>
    implements _$$_CoreFavoritesStateCopyWith<$Res> {
  __$$_CoreFavoritesStateCopyWithImpl(
      _$_CoreFavoritesState _value, $Res Function(_$_CoreFavoritesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? favoriteIds = null,
  }) {
    return _then(_$_CoreFavoritesState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      favoriteIds: null == favoriteIds
          ? _value._favoriteIds
          : favoriteIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_CoreFavoritesState implements _CoreFavoritesState {
  _$_CoreFavoritesState(
      {this.isLoading = false,
      final List<String> favoriteIds = const <String>[]})
      : _favoriteIds = favoriteIds;

  @override
  @JsonKey()
  final bool isLoading;
  final List<String> _favoriteIds;
  @override
  @JsonKey()
  List<String> get favoriteIds {
    if (_favoriteIds is EqualUnmodifiableListView) return _favoriteIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteIds);
  }

  @override
  String toString() {
    return 'CoreFavoritesState(isLoading: $isLoading, favoriteIds: $favoriteIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CoreFavoritesState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._favoriteIds, _favoriteIds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_favoriteIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CoreFavoritesStateCopyWith<_$_CoreFavoritesState> get copyWith =>
      __$$_CoreFavoritesStateCopyWithImpl<_$_CoreFavoritesState>(
          this, _$identity);
}

abstract class _CoreFavoritesState implements CoreFavoritesState {
  factory _CoreFavoritesState(
      {final bool isLoading,
      final List<String> favoriteIds}) = _$_CoreFavoritesState;

  @override
  bool get isLoading;
  @override
  List<String> get favoriteIds;
  @override
  @JsonKey(ignore: true)
  _$$_CoreFavoritesStateCopyWith<_$_CoreFavoritesState> get copyWith =>
      throw _privateConstructorUsedError;
}
