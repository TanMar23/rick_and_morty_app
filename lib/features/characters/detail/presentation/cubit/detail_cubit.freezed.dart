// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<EpisodeModel> get episodesList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailStateCopyWith<DetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailStateCopyWith<$Res> {
  factory $DetailStateCopyWith(
          DetailState value, $Res Function(DetailState) then) =
      _$DetailStateCopyWithImpl<$Res, DetailState>;
  @useResult
  $Res call({bool isLoading, List<EpisodeModel> episodesList});
}

/// @nodoc
class _$DetailStateCopyWithImpl<$Res, $Val extends DetailState>
    implements $DetailStateCopyWith<$Res> {
  _$DetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? episodesList = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      episodesList: null == episodesList
          ? _value.episodesList
          : episodesList // ignore: cast_nullable_to_non_nullable
              as List<EpisodeModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DetailStateCopyWith<$Res>
    implements $DetailStateCopyWith<$Res> {
  factory _$$_DetailStateCopyWith(
          _$_DetailState value, $Res Function(_$_DetailState) then) =
      __$$_DetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<EpisodeModel> episodesList});
}

/// @nodoc
class __$$_DetailStateCopyWithImpl<$Res>
    extends _$DetailStateCopyWithImpl<$Res, _$_DetailState>
    implements _$$_DetailStateCopyWith<$Res> {
  __$$_DetailStateCopyWithImpl(
      _$_DetailState _value, $Res Function(_$_DetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? episodesList = null,
  }) {
    return _then(_$_DetailState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      episodesList: null == episodesList
          ? _value._episodesList
          : episodesList // ignore: cast_nullable_to_non_nullable
              as List<EpisodeModel>,
    ));
  }
}

/// @nodoc

class _$_DetailState implements _DetailState {
  _$_DetailState(
      {this.isLoading = false,
      final List<EpisodeModel> episodesList = const <EpisodeModel>[]})
      : _episodesList = episodesList;

  @override
  @JsonKey()
  final bool isLoading;
  final List<EpisodeModel> _episodesList;
  @override
  @JsonKey()
  List<EpisodeModel> get episodesList {
    if (_episodesList is EqualUnmodifiableListView) return _episodesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_episodesList);
  }

  @override
  String toString() {
    return 'DetailState(isLoading: $isLoading, episodesList: $episodesList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._episodesList, _episodesList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_episodesList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailStateCopyWith<_$_DetailState> get copyWith =>
      __$$_DetailStateCopyWithImpl<_$_DetailState>(this, _$identity);
}

abstract class _DetailState implements DetailState {
  factory _DetailState(
      {final bool isLoading,
      final List<EpisodeModel> episodesList}) = _$_DetailState;

  @override
  bool get isLoading;
  @override
  List<EpisodeModel> get episodesList;
  @override
  @JsonKey(ignore: true)
  _$$_DetailStateCopyWith<_$_DetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
