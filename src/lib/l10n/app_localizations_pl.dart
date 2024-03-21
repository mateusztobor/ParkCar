import 'app_localizations.dart';

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  ///-------------------------
  String get aboutApp => 'Informacje o aplikacji';
  String get author => 'Autor: ';
  String get close => 'Zamknij';
  String get cancel => 'Anuluj';
  String get yes => 'Tak';
  ///-------------------------
  String get noPermTitle => 'Brak uprawnień';
  String get noPermContent => 'Ta czynność wymaga nadania uprawnień do lokalizacji.\nBez tych uprawnień ta funkcja nie będzie działać.';
  String get grantPerm => 'Przyznaj uprawnienia';
  ///-------------------------
  String get confirmTitle => 'Potwierdzenie';
  String get confirmOverwriteContent => 'Czy na pewno chcesz nadpisać lokalizację pojazdu?';
  String get confirmDeleteContent => 'Czy na pewno chcesz usunąć zapisaną lokalizację pojazdu?';
  ///-------------------------
  String get btnSaveLocation => 'Zapisz lokalizację pojazdu';
  String get btnOverwriteLocation => 'Nadpisz lokalizację pojazdu';
  String get btnDeleteLocation => 'Usuń lokalizację pojazdu';
  String get btnRunMaps => 'Nawiguj do pojazdu';
  ///-------------------------
}
