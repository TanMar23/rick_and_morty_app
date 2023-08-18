// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CharacterListState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isBottomLoading => throw _privateConstructorUsedError;
  List<CharacterModel> get charactersList => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  bool get hasMoreData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CharacterListStateCopyWith<CharacterListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterListStateCopyWith<$Res> {
  factory $CharacterListStateCopyWith(
          CharacterListState value, $Res Function(CharacterListState) then) =
      _$CharacterListStateCopyWithImpl<$Res, CharacterListState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isBottomLoading,
      List<CharacterModel> charactersList,
      int? page,
      bool hasMoreData});
}

/// @nodoc
class _$CharacterListStateCopyWithImpl<$Res, $Val extends CharacterListState>
    implements $CharacterListStateCopyWith<$Res> {
  _$CharacterListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isBottomLoading = null,
    Object? charactersList = null,
    Object? page = freezed,
    Object? hasMoreData = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isBottomLoading: null == isBottomLoading
          ? _value.isBottomLoading
          : isBottomLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      charactersList: null == charactersList
          ? _value.charactersList
          : charactersList // ignore: cast_nullable_to_non_nullable
              as List<CharacterModel>,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      hasMoreData: null == hasMoreData
          ? _value.hasMoreData
          : hasMoreData // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CharacterListStateCopyWith<$Res>
    implements $CharacterListStateCopyWith<$Res> {
  factory _$$_CharacterListStateCopyWith(_$_CharacterListState value,
          $Res Function(_$_CharacterListState) then) =
      __$$_CharacterListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isBottomLoading,
      List<CharacterModel> charactersList,
      int? page,
      bool hasMoreData});
}

/// @nodoc
class __$$_CharacterListStateCopyWithImpl<$Res>
    extends _$CharacterListStateCopyWithImpl<$Res, _$_CharacterListState>
    implements _$$_CharacterListStateCopyWith<$Res> {
  __$$_CharacterListStateCopyWithImpl(
      _$_CharacterListState _value, $Res Function(_$_CharacterListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isBottomLoading = null,
    Object? charactersList = null,
    Object? page = freezed,
    Object? hasMoreData = null,
  }) {
    return _then(_$_CharacterListState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isBottomLoading: null == isBottomLoading
          ? _value.isBottomLoading
          : isBottomLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      charactersList: null == charactersList
          ? _value._charactersList
          : charactersList // ignore: cast_nullable_to_non_nullable
              as List<CharacterModel>,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      hasMoreData: null == hasMoreData
          ? _value.hasMoreData
          : hasMoreData // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CharacterListState implements _CharacterListState {
  _$_CharacterListState(
      {this.isLoading = false,
      this.isBottomLoading = false,
      final List<CharacterModel> charactersList = const <CharacterModel>[],
      this.page = 1,
      this.hasMoreData = true})
      : _charactersList = charactersList;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isBottomLoading;
  final List<CharacterModel> _charactersList;
  @override
  @JsonKey()
  List<CharacterModel> get charactersList {
    if (_charactersList is EqualUnmodifiableListView) return _charactersList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_charactersList);
  }

  @override
  @JsonKey()
  final int? page;
  @override
  @JsonKey()
  final bool hasMoreData;

  @override
  String toString() {
    return 'CharacterListState(isLoading: $isLoading, isBottomLoading: $isBottomLoading, charactersList: $charactersList, page: $page, hasMoreData: $hasMoreData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharacterListState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isBottomLoading, isBottomLoading) ||
                other.isBottomLoading == isBottomLoading) &&
            const DeepCollectionEquality()
                .equals(other._charactersList, _charactersList) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.hasMoreData, hasMoreData) ||
                other.hasMoreData == hasMoreData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isBottomLoading,
      const DeepCollectionEquality().hash(_charactersList), page, hasMoreData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CharacterListStateCopyWith<_$_CharacterListState> get copyWith =>
      __$$_CharacterListStateCopyWithImpl<_$_CharacterListState>(
          this, _$identity);
}

abstract class _CharacterListState implements CharacterListState {
  factory _CharacterListState(
      {final bool isLoading,
      final bool isBottomLoading,
      final List<CharacterModel> charactersList,
      final int? page,
      final bool hasMoreData}) = _$_CharacterListState;

  @override
  bool get isLoading;
  @override
  bool get isBottomLoading;
  @override
  List<CharacterModel> get charactersList;
  @override
  int? get page;
  @override
  bool get hasMoreData;
  @override
  @JsonKey(ignore: true)
  _$$_CharacterListStateCopyWith<_$_CharacterListState> get copyWith =>
      throw _privateConstructorUsedError;
}
