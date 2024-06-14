// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercises_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExercisesState {
  ExerciesStatus get status => throw _privateConstructorUsedError;
  bool get isMarkedCategory => throw _privateConstructorUsedError;
  List<Exercise> get exercies => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExercisesStateCopyWith<ExercisesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExercisesStateCopyWith<$Res> {
  factory $ExercisesStateCopyWith(
          ExercisesState value, $Res Function(ExercisesState) then) =
      _$ExercisesStateCopyWithImpl<$Res, ExercisesState>;
  @useResult
  $Res call(
      {ExerciesStatus status, bool isMarkedCategory, List<Exercise> exercies});
}

/// @nodoc
class _$ExercisesStateCopyWithImpl<$Res, $Val extends ExercisesState>
    implements $ExercisesStateCopyWith<$Res> {
  _$ExercisesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isMarkedCategory = null,
    Object? exercies = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ExerciesStatus,
      isMarkedCategory: null == isMarkedCategory
          ? _value.isMarkedCategory
          : isMarkedCategory // ignore: cast_nullable_to_non_nullable
              as bool,
      exercies: null == exercies
          ? _value.exercies
          : exercies // ignore: cast_nullable_to_non_nullable
              as List<Exercise>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciesStateImplCopyWith<$Res>
    implements $ExercisesStateCopyWith<$Res> {
  factory _$$ExerciesStateImplCopyWith(
          _$ExerciesStateImpl value, $Res Function(_$ExerciesStateImpl) then) =
      __$$ExerciesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ExerciesStatus status, bool isMarkedCategory, List<Exercise> exercies});
}

/// @nodoc
class __$$ExerciesStateImplCopyWithImpl<$Res>
    extends _$ExercisesStateCopyWithImpl<$Res, _$ExerciesStateImpl>
    implements _$$ExerciesStateImplCopyWith<$Res> {
  __$$ExerciesStateImplCopyWithImpl(
      _$ExerciesStateImpl _value, $Res Function(_$ExerciesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isMarkedCategory = null,
    Object? exercies = null,
  }) {
    return _then(_$ExerciesStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ExerciesStatus,
      isMarkedCategory: null == isMarkedCategory
          ? _value.isMarkedCategory
          : isMarkedCategory // ignore: cast_nullable_to_non_nullable
              as bool,
      exercies: null == exercies
          ? _value._exercies
          : exercies // ignore: cast_nullable_to_non_nullable
              as List<Exercise>,
    ));
  }
}

/// @nodoc

class _$ExerciesStateImpl implements _ExerciesState {
  const _$ExerciesStateImpl(
      {this.status = ExerciesStatus.initial,
      this.isMarkedCategory = false,
      final List<Exercise> exercies = const <Exercise>[]})
      : _exercies = exercies;

  @override
  @JsonKey()
  final ExerciesStatus status;
  @override
  @JsonKey()
  final bool isMarkedCategory;
  final List<Exercise> _exercies;
  @override
  @JsonKey()
  List<Exercise> get exercies {
    if (_exercies is EqualUnmodifiableListView) return _exercies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercies);
  }

  @override
  String toString() {
    return 'ExercisesState(status: $status, isMarkedCategory: $isMarkedCategory, exercies: $exercies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciesStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isMarkedCategory, isMarkedCategory) ||
                other.isMarkedCategory == isMarkedCategory) &&
            const DeepCollectionEquality().equals(other._exercies, _exercies));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, isMarkedCategory,
      const DeepCollectionEquality().hash(_exercies));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciesStateImplCopyWith<_$ExerciesStateImpl> get copyWith =>
      __$$ExerciesStateImplCopyWithImpl<_$ExerciesStateImpl>(this, _$identity);
}

abstract class _ExerciesState implements ExercisesState {
  const factory _ExerciesState(
      {final ExerciesStatus status,
      final bool isMarkedCategory,
      final List<Exercise> exercies}) = _$ExerciesStateImpl;

  @override
  ExerciesStatus get status;
  @override
  bool get isMarkedCategory;
  @override
  List<Exercise> get exercies;
  @override
  @JsonKey(ignore: true)
  _$$ExerciesStateImplCopyWith<_$ExerciesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
