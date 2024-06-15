// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProgressState {
  ProgressStatus get status => throw _privateConstructorUsedError;
  List<Weight> get weights => throw _privateConstructorUsedError;
  double get currentWeight => throw _privateConstructorUsedError;
  double get maxWeight => throw _privateConstructorUsedError;
  double get minWeight => throw _privateConstructorUsedError;
  int? get countWorkoutCompleted => throw _privateConstructorUsedError;
  int? get countExerciseCompleted => throw _privateConstructorUsedError;
  double? get timeWorkoutCompleted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProgressStateCopyWith<ProgressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressStateCopyWith<$Res> {
  factory $ProgressStateCopyWith(
          ProgressState value, $Res Function(ProgressState) then) =
      _$ProgressStateCopyWithImpl<$Res, ProgressState>;
  @useResult
  $Res call(
      {ProgressStatus status,
      List<Weight> weights,
      double currentWeight,
      double maxWeight,
      double minWeight,
      int? countWorkoutCompleted,
      int? countExerciseCompleted,
      double? timeWorkoutCompleted});
}

/// @nodoc
class _$ProgressStateCopyWithImpl<$Res, $Val extends ProgressState>
    implements $ProgressStateCopyWith<$Res> {
  _$ProgressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? weights = null,
    Object? currentWeight = null,
    Object? maxWeight = null,
    Object? minWeight = null,
    Object? countWorkoutCompleted = freezed,
    Object? countExerciseCompleted = freezed,
    Object? timeWorkoutCompleted = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProgressStatus,
      weights: null == weights
          ? _value.weights
          : weights // ignore: cast_nullable_to_non_nullable
              as List<Weight>,
      currentWeight: null == currentWeight
          ? _value.currentWeight
          : currentWeight // ignore: cast_nullable_to_non_nullable
              as double,
      maxWeight: null == maxWeight
          ? _value.maxWeight
          : maxWeight // ignore: cast_nullable_to_non_nullable
              as double,
      minWeight: null == minWeight
          ? _value.minWeight
          : minWeight // ignore: cast_nullable_to_non_nullable
              as double,
      countWorkoutCompleted: freezed == countWorkoutCompleted
          ? _value.countWorkoutCompleted
          : countWorkoutCompleted // ignore: cast_nullable_to_non_nullable
              as int?,
      countExerciseCompleted: freezed == countExerciseCompleted
          ? _value.countExerciseCompleted
          : countExerciseCompleted // ignore: cast_nullable_to_non_nullable
              as int?,
      timeWorkoutCompleted: freezed == timeWorkoutCompleted
          ? _value.timeWorkoutCompleted
          : timeWorkoutCompleted // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProgressStateImplCopyWith<$Res>
    implements $ProgressStateCopyWith<$Res> {
  factory _$$ProgressStateImplCopyWith(
          _$ProgressStateImpl value, $Res Function(_$ProgressStateImpl) then) =
      __$$ProgressStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProgressStatus status,
      List<Weight> weights,
      double currentWeight,
      double maxWeight,
      double minWeight,
      int? countWorkoutCompleted,
      int? countExerciseCompleted,
      double? timeWorkoutCompleted});
}

/// @nodoc
class __$$ProgressStateImplCopyWithImpl<$Res>
    extends _$ProgressStateCopyWithImpl<$Res, _$ProgressStateImpl>
    implements _$$ProgressStateImplCopyWith<$Res> {
  __$$ProgressStateImplCopyWithImpl(
      _$ProgressStateImpl _value, $Res Function(_$ProgressStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? weights = null,
    Object? currentWeight = null,
    Object? maxWeight = null,
    Object? minWeight = null,
    Object? countWorkoutCompleted = freezed,
    Object? countExerciseCompleted = freezed,
    Object? timeWorkoutCompleted = freezed,
  }) {
    return _then(_$ProgressStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProgressStatus,
      weights: null == weights
          ? _value._weights
          : weights // ignore: cast_nullable_to_non_nullable
              as List<Weight>,
      currentWeight: null == currentWeight
          ? _value.currentWeight
          : currentWeight // ignore: cast_nullable_to_non_nullable
              as double,
      maxWeight: null == maxWeight
          ? _value.maxWeight
          : maxWeight // ignore: cast_nullable_to_non_nullable
              as double,
      minWeight: null == minWeight
          ? _value.minWeight
          : minWeight // ignore: cast_nullable_to_non_nullable
              as double,
      countWorkoutCompleted: freezed == countWorkoutCompleted
          ? _value.countWorkoutCompleted
          : countWorkoutCompleted // ignore: cast_nullable_to_non_nullable
              as int?,
      countExerciseCompleted: freezed == countExerciseCompleted
          ? _value.countExerciseCompleted
          : countExerciseCompleted // ignore: cast_nullable_to_non_nullable
              as int?,
      timeWorkoutCompleted: freezed == timeWorkoutCompleted
          ? _value.timeWorkoutCompleted
          : timeWorkoutCompleted // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$ProgressStateImpl implements _ProgressState {
  const _$ProgressStateImpl(
      {this.status = ProgressStatus.initial,
      final List<Weight> weights = const <Weight>[],
      this.currentWeight = 0,
      this.maxWeight = 0,
      this.minWeight = 0,
      this.countWorkoutCompleted,
      this.countExerciseCompleted,
      this.timeWorkoutCompleted})
      : _weights = weights;

  @override
  @JsonKey()
  final ProgressStatus status;
  final List<Weight> _weights;
  @override
  @JsonKey()
  List<Weight> get weights {
    if (_weights is EqualUnmodifiableListView) return _weights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weights);
  }

  @override
  @JsonKey()
  final double currentWeight;
  @override
  @JsonKey()
  final double maxWeight;
  @override
  @JsonKey()
  final double minWeight;
  @override
  final int? countWorkoutCompleted;
  @override
  final int? countExerciseCompleted;
  @override
  final double? timeWorkoutCompleted;

  @override
  String toString() {
    return 'ProgressState(status: $status, weights: $weights, currentWeight: $currentWeight, maxWeight: $maxWeight, minWeight: $minWeight, countWorkoutCompleted: $countWorkoutCompleted, countExerciseCompleted: $countExerciseCompleted, timeWorkoutCompleted: $timeWorkoutCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._weights, _weights) &&
            (identical(other.currentWeight, currentWeight) ||
                other.currentWeight == currentWeight) &&
            (identical(other.maxWeight, maxWeight) ||
                other.maxWeight == maxWeight) &&
            (identical(other.minWeight, minWeight) ||
                other.minWeight == minWeight) &&
            (identical(other.countWorkoutCompleted, countWorkoutCompleted) ||
                other.countWorkoutCompleted == countWorkoutCompleted) &&
            (identical(other.countExerciseCompleted, countExerciseCompleted) ||
                other.countExerciseCompleted == countExerciseCompleted) &&
            (identical(other.timeWorkoutCompleted, timeWorkoutCompleted) ||
                other.timeWorkoutCompleted == timeWorkoutCompleted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_weights),
      currentWeight,
      maxWeight,
      minWeight,
      countWorkoutCompleted,
      countExerciseCompleted,
      timeWorkoutCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgressStateImplCopyWith<_$ProgressStateImpl> get copyWith =>
      __$$ProgressStateImplCopyWithImpl<_$ProgressStateImpl>(this, _$identity);
}

abstract class _ProgressState implements ProgressState {
  const factory _ProgressState(
      {final ProgressStatus status,
      final List<Weight> weights,
      final double currentWeight,
      final double maxWeight,
      final double minWeight,
      final int? countWorkoutCompleted,
      final int? countExerciseCompleted,
      final double? timeWorkoutCompleted}) = _$ProgressStateImpl;

  @override
  ProgressStatus get status;
  @override
  List<Weight> get weights;
  @override
  double get currentWeight;
  @override
  double get maxWeight;
  @override
  double get minWeight;
  @override
  int? get countWorkoutCompleted;
  @override
  int? get countExerciseCompleted;
  @override
  double? get timeWorkoutCompleted;
  @override
  @JsonKey(ignore: true)
  _$$ProgressStateImplCopyWith<_$ProgressStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
