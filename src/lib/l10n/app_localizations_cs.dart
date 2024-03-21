import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override

  ///-------------------------
  String get aboutApp => 'O aplikaci';
  String get author => 'Autor: ';
  String get close => 'Zavřít';
  String get cancel => 'Zrušit';
  String get yes => 'Ano';
  ///-------------------------
  String get noPermTitle => 'Chybějící oprávnění';
  String get noPermContent => 'Tato akce vyžaduje povolení k přístupu k poloze. \nBez těchto oprávnění nebude tato funkce fungovat.';
  String get grantPerm => 'Přidělit oprávnění';
  ///-------------------------
  String get confirmTitle => 'Potvrzení';
  String get confirmOverwriteContent => 'Určitě chcete přepsat polohu vozidla?';
  String get confirmDeleteContent => 'Určitě chcete odstranit uloženou polohu vozidla?';
  ///-------------------------
  String get btnSaveLocation => 'Uložit polohu vozidla';
  String get btnOverwriteLocation => 'Přepsat polohu vozidla';
  String get btnDeleteLocation => 'Odstranit polohu vozidla';
  String get btnRunMaps => 'Navigovat k vozidlu';
///-------------------------
}