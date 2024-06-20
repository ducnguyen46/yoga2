part of 'app_language_cubit.dart';

enum AppLanguageStatus {
  initial,
  loadingLocale,
  appliedLocale,
  changingLocale,
  error,
}

@freezed
class AppLanguageState with _$AppLanguageState {
  const factory AppLanguageState({
    @Default(AppLanguageStatus.initial) AppLanguageStatus status,
    @Default(<ExerciseLang>[]) List<ExerciseLang> exerciseLangs,
    @Default(Locale("en")) Locale appLocale,
  }) = _AppLanguageState;
}
