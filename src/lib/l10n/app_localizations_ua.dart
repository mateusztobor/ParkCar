import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsUa extends AppLocalizations {
  AppLocalizationsUa([String locale = 'ua']) : super(locale);

  @override


  ///-------------------------
  String get aboutApp => 'Інформація про додаток';
  String get author => 'Автор: ';
  String get close => 'Закрити';
  String get cancel => 'Скасувати';
  String get yes => 'Так';
  ///-------------------------
  String get noPermTitle => 'Відсутні дозволи';
  String get noPermContent => 'Ця дія потребує надання дозволів на місцезнаходження.\nБез цих дозволів функція не буде працювати.';
  String get grantPerm => 'Надати дозволи';
  ///-------------------------
  String get confirmTitle => 'Підтвердження';
  String get confirmOverwriteContent => 'Ви впевнені, що хочете перезаписати місцезнаходження автомобіля?';
  String get confirmDeleteContent => 'Ви впевнені, що хочете видалити збережене місцезнаходження автомобіля?';
  ///-------------------------
  String get btnSaveLocation => 'Зберегти місцезнаходження автомобіля';
  String get btnOverwriteLocation => 'Перезаписати місцезнаходження автомобіля';
  String get btnDeleteLocation => 'Видалити місцезнаходження автомобіля';
  String get btnRunMaps => 'Навігувати до автомобіля';
///-------------------------
}