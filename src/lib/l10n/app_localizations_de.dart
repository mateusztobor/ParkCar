import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override

  ///-------------------------
  String get aboutApp => 'Über die App';
  String get author => 'Autor: ';
  String get close => 'Schließen';
  String get cancel => 'Abbrechen';
  String get yes => 'Ja';
  ///-------------------------
  String get noPermTitle => 'Keine Berechtigung';
  String get noPermContent => 'Diese Aktion erfordert die Genehmigung des Zugriffs auf den Standort.\nOhne diese Genehmigung wird diese Funktion nicht funktionieren.';
  String get grantPerm => 'Berechtigung erteilen';
  ///-------------------------
  String get confirmTitle => 'Bestätigung';
  String get confirmOverwriteContent => 'Möchten Sie wirklich den Standort des Fahrzeugs überschreiben?';
  String get confirmDeleteContent => 'Möchten Sie wirklich den gespeicherten Standort des Fahrzeugs löschen?';
  ///-------------------------
  String get btnSaveLocation => 'Fahrzeugstandort speichern';
  String get btnOverwriteLocation => 'Fahrzeugstandort überschreiben';
  String get btnDeleteLocation => 'Fahrzeugstandort löschen';
  String get btnRunMaps => 'Zum Fahrzeug navigieren';
///-------------------------
}