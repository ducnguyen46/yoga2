import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yoga/constants/app_language.dart';
import 'package:yoga/models/exercise_lang.dart';

part 'app_language_state.dart';
part 'app_language_cubit.freezed.dart';

class AppLanguageCubit extends Cubit<AppLanguageState> {
  AppLanguageCubit(this._sharedPreferences) : super(AppLanguageState());
  final SharedPreferences _sharedPreferences;

  void checkApplySystemLocale() async {
    final _systemLocaleName = Platform.localeName.split("_").first;
    final _savedLocaleName = _sharedPreferences.getString("locale");

    if (_savedLocaleName != null) {
      emit(state.copyWith(
        status: AppLanguageStatus.appliedLocale,
        appLocale: Locale(_savedLocaleName),
      ));
    } else {
      if (appSupportedLocales
          .any((locale) => locale.languageCode == _systemLocaleName)) {
        emit(state.copyWith(
          status: AppLanguageStatus.appliedLocale,
          appLocale: Locale(_systemLocaleName),
        ));
      } else {
        emit(state.copyWith(
          status: AppLanguageStatus.appliedLocale,
          appLocale: appSupportedLocales.first,
        ));
      }
    }
  }

  void changeLanguage(BuildContext context, String languageCode) async {
    await _sharedPreferences.setString("locale", languageCode);
    emit(state.copyWith(appLocale: Locale(languageCode)));
  }
}
