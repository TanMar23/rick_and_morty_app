// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoritesState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<CharacterModel> get favoritesList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoritesStateCopyWith<FavoritesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoritesStateCopyWith<$Res> {
  factory $FavoritesStateCopyWith(
          FavoritesState value, $Res Function(FavoritesState) then) =
      _$FavoritesStateCopyWithImpl<$Res, FavoritesState>;
  @useResult
  $Res call({bool isLoading, List<CharacterModel> favoritesList});
}

/// @nodoc
class _$FavoritesStateCopyWithImpl<$Res, $Val extends FavoritesState>
    implements $FavoritesStateCopyWith<$Res> {
  _$FavoritesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? favoritesList = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      favoritesList: null == favoritesList
          ? _value.favoritesList
          : favoritesList // ignore: cast_nullable_to_non_nullable
              as List<CharacterModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavoritesStateCopyWith<$Res>
    implements $FavoritesStateCopyWith<$Res> {
  factory _$$_FavoritesStateCopyWith(
          _$_FavoritesState value, $Res Function(_$_FavoritesState) then) =
      __$$_FavoritesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<CharacterModel> favoritesList});
}

/// @nodoc
class __$$_FavoritesStateCopyWithImpl<$Res>
    extends _$FavoritesStateCopyWithImpl<$Res, _$_FavoritesState>
    implements _$$_FavoritesStateCopyWith<$Res> {
  __$$_FavoritesStateCopyWithImpl(
      _$_FavoritesState _value, $Res Function(_$_FavoritesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? favoritesList = null,
  }) {
    return _then(_$_FavoritesState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      favoritesList: null == favoritesList
          ? _value._favoritesList
          : favoritesList // ignore: cast_nullable_to_non_nullable
              as List<CharacterModel>,
    ));
  }
}

/// @nodoc

class _$_FavoritesState implements _FavoritesState {
  _$_FavoritesState(
      {this.isLoading = false,
      final List<CharacterModel> favoritesList = const <CharacterModel>[]})
      : _favoritesList = favoritesList;

  @override
  @JsonKey()
  final bool isLoading;
  final List<CharacterModel> _favoritesList;
  @override
  @JsonKey()
  List<CharacterModel> get favoritesList {
    if (_favoritesList is EqualUnmodifiableListView) return _favoritesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoritesList);
  }

  @override
  String toString() {
    return 'FavoritesState(isLoading: $isLoading, favoritesList: $favoritesList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoritesState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._favoritesList, _favoritesList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_favoritesList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoritesStateCopyWith<_$_FavoritesState> get copyWith =>
      __$$_FavoritesStateCopyWithImpl<_$_FavoritesState>(this, _$identity);
}

abstract class _FavoritesState implements FavoritesState {
  factory _FavoritesState(
      {final bool isLoading,
      final List<CharacterModel> favoritesList}) = _$_FavoritesState;

  @override
  bool get isLoading;
  @override
  List<CharacterModel> get favoritesList;
  @override
  @JsonKey(ignore: true)
  _$$_FavoritesStateCopyWith<_$_FavoritesState> get copyWith =>
      throw _privateConstructorUsedError;
}
