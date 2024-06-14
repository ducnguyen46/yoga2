// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liked_exercise_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LikedExerciseState {
  LikedExerciseStatus get status => throw _privateConstructorUsedError;
  List<Category> get categories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LikedExerciseStateCopyWith<LikedExerciseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikedExerciseStateCopyWith<$Res> {
  factory $LikedExerciseStateCopyWith(
          LikedExerciseState value, $Res Function(LikedExerciseState) then) =
      _$LikedExerciseStateCopyWithImpl<$Res, LikedExerciseState>;
  @useResult
  $Res call({LikedExerciseStatus status, List<Category> categories});
}

/// @nodoc
class _$LikedExerciseStateCopyWithImpl<$Res, $Val extends LikedExerciseState>
    implements $LikedExerciseStateCopyWith<$Res> {
  _$LikedExerciseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LikedExerciseStatus,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LikedExerciseStateImplCopyWith<$Res>
    implements $LikedExerciseStateCopyWith<$Res> {
  factory _$$LikedExerciseStateImplCopyWith(_$LikedExerciseStateImpl value,
          $Res Function(_$LikedExerciseStateImpl) then) =
      __$$LikedExerciseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LikedExerciseStatus status, List<Category> categories});
}

/// @nodoc
class __$$LikedExerciseStateImplCopyWithImpl<$Res>
    extends _$LikedExerciseStateCopyWithImpl<$Res, _$LikedExerciseStateImpl>
    implements _$$LikedExerciseStateImplCopyWith<$Res> {
  __$$LikedExerciseStateImplCopyWithImpl(_$LikedExerciseStateImpl _value,
      $Res Function(_$LikedExerciseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? categories = null,
  }) {
    return _then(_$LikedExerciseStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LikedExerciseStatus,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc

class _$LikedExerciseStateImpl implements _LikedExerciseState {
  const _$LikedExerciseStateImpl(
      {this.status = LikedExerciseStatus.initial,
      final List<Category> categories = const <Category>[]})
      : _categories = categories;

  @override
  @JsonKey()
  final LikedExerciseStatus status;
  final List<Category> _categories;
  @override
  @JsonKey()
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'LikedExerciseState(status: $status, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikedExerciseStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LikedExerciseStateImplCopyWith<_$LikedExerciseStateImpl> get copyWith =>
      __$$LikedExerciseStateImplCopyWithImpl<_$LikedExerciseStateImpl>(
          this, _$identity);
}

abstract class _LikedExerciseState implements LikedExerciseState {
  const factory _LikedExerciseState(
      {final LikedExerciseStatus status,
      final List<Category> categories}) = _$LikedExerciseStateImpl;

  @override
  LikedExerciseStatus get status;
  @override
  List<Category> get categories;
  @override
  @JsonKey(ignore: true)
  _$$LikedExerciseStateImplCopyWith<_$LikedExerciseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
