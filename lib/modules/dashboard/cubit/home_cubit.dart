import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yoga/core/repositories/app_repository.dart';
import 'package:yoga/models/category.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final AppRepository _appRepository;
  HomeCubit({
    required AppRepository appRepository,
  })  : _appRepository = appRepository,
        super(HomeState());

  void getCategories() async {
    emit(state.copyWith(status: HomeStatus.loading));
    List<String> types = await _appRepository.getListCategoryType();
    Map<String, List<Category>> categoriesByTypes = {};
    for (String type in types) {
      final categories = await _appRepository.getCategoryByType(type);
      categoriesByTypes[type] = categories;
    }
    emit(state.copyWith(
        status: HomeStatus.loaded, categoriesByTypes: categoriesByTypes));
  }
}
