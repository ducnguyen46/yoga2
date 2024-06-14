// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExerciseState {
  ExerciseStatus get status => throw _privateConstructorUsedError;
  int get tick => throw _privateConstructorUsedError;
  int get countCompletedExcercise => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExerciseStateCopyWith<ExerciseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseStateCopyWith<$Res> {
  factory $ExerciseStateCopyWith(
          ExerciseState value, $Res Function(ExerciseState) then) =
      _$ExerciseStateCopyWithImpl<$Res, ExerciseState>;
  @useResult
  $Res call({ExerciseStatus status, int tick, int countCompletedExcercise});
}

/// @nodoc
class _$ExerciseStateCopyWithImpl<$Res, $Val extends ExerciseState>
    implements $ExerciseStateCopyWith<$Res> {
  _$ExerciseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? tick = null,
    Object? countCompletedExcercise = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ExerciseStatus,
      tick: null == tick
          ? _value.tick
          : tick // ignore: cast_nullable_to_non_nullable
              as int,
      countCompletedExcercise: null == countCompletedExcercise
          ? _value.countCompletedExcercise
          : countCompletedExcercise // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseImplCopyWith<$Res>
    implements $ExerciseStateCopyWith<$Res> {
  factory _$$ExerciseImplCopyWith(
          _$ExerciseImpl value, $Res Function(_$ExerciseImpl) then) =
      __$$ExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ExerciseStatus status, int tick, int countCompletedExcercise});
}

/// @nodoc
class __$$ExerciseImplCopyWithImpl<$Res>
    extends _$ExerciseStateCopyWithImpl<$Res, _$ExerciseImpl>
    implements _$$ExerciseImplCopyWith<$Res> {
  __$$ExerciseImplCopyWithImpl(
      _$ExerciseImpl _value, $Res Function(_$ExerciseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? tick = null,
    Object? countCompletedExcercise = null,
  }) {
    return _then(_$ExerciseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ExerciseStatus,
      tick: null == tick
          ? _value.tick
          : tick // ignore: cast_nullable_to_non_nullable
              as int,
      countCompletedExcercise: null == countCompletedExcercise
          ? _value.countCompletedExcercise
          : countCompletedExcercise // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ExerciseImpl implements _Exercise {
  const _$ExerciseImpl(
      {this.status = ExerciseStatus.running,
      this.tick = 30,
      this.countCompletedExcercise = 0});

  @override
  @JsonKey()
  final ExerciseStatus status;
  @override
  @JsonKey()
  final int tick;
  @override
  @JsonKey()
  final int countCompletedExcercise;

  @override
  String toString() {
    return 'ExerciseState(status: $status, tick: $tick, countCompletedExcercise: $countCompletedExcercise)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.tick, tick) || other.tick == tick) &&
            (identical(
                    other.countCompletedExcercise, countCompletedExcercise) ||
                other.countCompletedExcercise == countCompletedExcercise));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, tick, countCompletedExcercise);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseImplCopyWith<_$ExerciseImpl> get copyWith =>
      __$$ExerciseImplCopyWithImpl<_$ExerciseImpl>(this, _$identity);
}

abstract class _Exercise implements ExerciseState {
  const factory _Exercise(
      {final ExerciseStatus status,
      final int tick,
      final int countCompletedExcercise}) = _$ExerciseImpl;

  @override
  ExerciseStatus get status;
  @override
  int get tick;
  @override
  int get countCompletedExcercise;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseImplCopyWith<_$ExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
