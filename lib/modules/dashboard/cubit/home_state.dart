part of 'home_cubit.dart';

enum HomeStatus { initial, loading, loaded, error }

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.initial) HomeStatus status,
    @Default(<String, List<Category>>{})
    Map<String, List<Category>> categoriesByTypes,
  }) = _Initial;
}
