import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  ///-------------------------
  String get aboutApp => 'About the app';
  String get author => 'Author: ';
  String get close => 'Close';
  String get cancel => 'Cancel';
  String get yes => 'Yes';
  ///-------------------------
  String get noPermTitle => 'No permissions';
  String get noPermContent => 'This action requires location permissions.\nWithout these permissions, this feature will not work.';
  String get grantPerm => 'Grant permissions';
  ///-------------------------
  String get confirmTitle => 'Confirmation';
  String get confirmOverwriteContent => 'Are you sure you want to overwrite the vehicle location?';
  String get confirmDeleteContent => 'Are you sure you want to delete the saved vehicle location?';
  ///-------------------------
  String get btnSaveLocation => 'Save vehicle location';
  String get btnOverwriteLocation => 'Overwrite vehicle location';
  String get btnDeleteLocation => 'Delete vehicle location';
  String get btnRunMaps => 'Navigate to vehicle';
  ///-------------------------
}