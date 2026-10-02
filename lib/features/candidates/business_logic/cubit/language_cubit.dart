import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<String> {
  LanguageCubit() : super('en');
  void toggleLanguage() {
    state == 'en' ? emit('ar') : emit('en');
  }
}
