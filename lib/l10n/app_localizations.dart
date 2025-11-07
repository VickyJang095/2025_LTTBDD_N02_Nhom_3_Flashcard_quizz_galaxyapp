import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);
  static Function(Locale)? changeLocale;
  static AppLocalizations of(BuildContext c) =>
      Localizations.of<AppLocalizations>(c, AppLocalizations)!;
  static const LocalizationsDelegate<AppLocalizations> delegate = _Delegate();

  static final Map<String, Map<String, String>> _t = {
    'en': {
      'title': 'Galaxy Flashcards',
      'login': 'Login',
      'register': 'Register',
      'learn': 'Learn',
      'quiz': 'Quiz',
      'settings': 'Settings',
      'about': 'About',
      'search': 'Search',
      'profile': 'Profile',
      'next': 'Next',
      'previous': 'Previous',
      'create new account': 'Create new account',
      'password': 'Password',
      'email': 'Email',
      'name': 'Name',
      'level': 'Level',
      'test': 'Test',
      'listen': 'Listen',
      'about us': 'About us',
      'Topics': 'Topic',
      'Learn 10 words': 'Learn 10 words',
      'Learn 8 words': 'Learn 8 words',
      'Listen practice': 'Listen practice',
      'Learn about us': 'Learn about us',
      'Adjust app options': 'Adjust app options',
    },
    'vi': {
      'title': 'Flashcard Vũ Trụ',
      'login': 'Đăng nhập',
      'register': 'Đăng ký',
      'learn': 'Học',
      'quiz': 'Quiz',
      'Settings': 'Cài đặt',
      'About': 'Thông tin',
      'search': 'Tìm kiếm',
      'profile': 'Hồ sơ',
      'next': 'Tiếp',
      'previous': 'Trước',
      'create new account': 'Tạo tài khoản mới',
      'password': 'Mật khẩu',
      'email': 'Email',
      'name': 'Tên',
      'level': 'Cấp độ',
      'Test': 'Kiểm tra',
      'Listen': 'Nghe',
      'About us': 'Về chúng tôi',
      'Topics': 'Chủ đề',
      'Learn 10 words': 'Học 10 từ',
      'Learn 8 words': 'Học 8 từ',
      'Listen pratice': 'Luyện nghe',
      'Learn about us': 'Tìm hiểu về chúng tôi',
      'Adjust app options': 'Điều chỉnh tùy chọn ứng dụng',
      'Learn':'Học',
      'Appearance':'Giao diện',
      'Language':'Ngôn ngữ',
      'App Language':'Ngôn ngữ ứng dụng',
      'Theme Palette':'Chủ đề'
    },
  };

  String t(String key) =>
      _t[locale.languageCode]?[key] ?? _t['en']![key] ?? key;
}

class _Delegate extends LocalizationsDelegate<AppLocalizations> {
  const _Delegate();
  @override
  bool isSupported(Locale locale) => ['en', 'vi'].contains(locale.languageCode);
  @override
  Future<AppLocalizations> load(Locale locale) async =>
      AppLocalizations(locale);
  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}
