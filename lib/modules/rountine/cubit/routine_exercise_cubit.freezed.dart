// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'routine_exercise_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RoutineExerciseState {
  RoutineExerciseStatus get status => throw _privateConstructorUsedError;
  List<Category> get categories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoutineExerciseStateCopyWith<RoutineExerciseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutineExerciseStateCopyWith<$Res> {
  factory $RoutineExerciseStateCopyWith(RoutineExerciseState value,
          $Res Function(RoutineExerciseState) then) =
      _$RoutineExerciseStateCopyWithImpl<$Res, RoutineExerciseState>;
  @useResult
  $Res call({RoutineExerciseStatus status, List<Category> categories});
}

/// @nodoc
class _$RoutineExerciseStateCopyWithImpl<$Res,
        $Val extends RoutineExerciseState>
    implements $RoutineExerciseStateCopyWith<$Res> {
  _$RoutineExerciseStateCopyWithImpl(this._value, this._then);

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
              as RoutineExerciseStatus,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoutineExerciseStateImplCopyWith<$Res>
    implements $RoutineExerciseStateCopyWith<$Res> {
  factory _$$RoutineExerciseStateImplCopyWith(_$RoutineExerciseStateImpl value,
          $Res Function(_$RoutineExerciseStateImpl) then) =
      __$$RoutineExerciseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RoutineExerciseStatus status, List<Category> categories});
}

/// @nodoc
class __$$RoutineExerciseStateImplCopyWithImpl<$Res>
    extends _$RoutineExerciseStateCopyWithImpl<$Res, _$RoutineExerciseStateImpl>
    implements _$$RoutineExerciseStateImplCopyWith<$Res> {
  __$$RoutineExerciseStateImplCopyWithImpl(_$RoutineExerciseStateImpl _value,
      $Res Function(_$RoutineExerciseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? categories = null,
  }) {
    return _then(_$RoutineExerciseStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RoutineExerciseStatus,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc

class _$RoutineExerciseStateImpl implements _RoutineExerciseState {
  const _$RoutineExerciseStateImpl(
      {this.status = RoutineExerciseStatus.initial,
      final List<Category> categories = const <Category>[]})
      : _categories = categories;

  @override
  @JsonKey()
  final RoutineExerciseStatus status;
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
    return 'RoutineExerciseState(status: $status, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoutineExerciseStateImpl &&
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
  _$$RoutineExerciseStateImplCopyWith<_$RoutineExerciseStateImpl>
      get copyWith =>
          __$$RoutineExerciseStateImplCopyWithImpl<_$RoutineExerciseStateImpl>(
              this, _$identity);
}

abstract class _RoutineExerciseState implements RoutineExerciseState {
  const factory _RoutineExerciseState(
      {final RoutineExerciseStatus status,
      final List<Category> categories}) = _$RoutineExerciseStateImpl;

  @override
  RoutineExerciseStatus get status;
  @override
  List<Category> get categories;
  @override
  @JsonKey(ignore: true)
  _$$RoutineExerciseStateImplCopyWith<_$RoutineExerciseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
