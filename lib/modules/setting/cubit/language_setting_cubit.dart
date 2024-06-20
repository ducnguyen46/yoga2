import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:yoga/models/language_set.dart';

class LanguageSettingCubit extends Cubit<int> {
  LanguageSettingCubit() : super(0);

  final langSets = [
    LanguageSet(
      language: "English",
      image: "english",
      languageCode: "en",
    ),
    LanguageSet(
      language: "France",
      image: "france",
      languageCode: "fr",
    ),
    LanguageSet(
      language: "Italia",
      image: "italy",
      languageCode: "it",
    ),
    LanguageSet(
      language: "Portugal",
      image: "portugal",
      languageCode: "pt",
    ),
    LanguageSet(
      language: "Россия",
      image: "russia",
      languageCode: "ru",
    ),
  ];

  void selectLanguage(int index) {
    emit(index);
  }

  void initLanguage(Locale appLocale) {
    final initIndex = langSets.indexWhere(
      (lang) => lang.languageCode == appLocale.languageCode,
    );
    emit(initIndex);
  }
}
