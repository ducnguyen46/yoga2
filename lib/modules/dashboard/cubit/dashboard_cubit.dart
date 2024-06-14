import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState());

  void tapDrawer() {
    emit(state.copyWith(isShowMenu: !state.isShowMenu));
  }

  void selectTab(int index) {
    emit(state.copyWith(tabActive: index, isShowMenu: !state.isShowMenu));
  }
}
