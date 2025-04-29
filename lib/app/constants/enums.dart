enum Language {
  en,
  fr,
  ar,
}

extension GetDisplayNameLanguageExtension on Language {
  String get displayName {
    switch (this) {
      case Language.en:
        return 'English';
      case Language.fr:
        return 'Francais';
      case Language.ar:
        return 'العربية';
    }
  }
}
