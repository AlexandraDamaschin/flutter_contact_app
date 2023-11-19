import 'package:contact_app_with_flutter/contacts/contacts_bloc.dart';
import 'package:contact_app_with_flutter/contacts/contacts_screen.dart';
import 'package:contact_app_with_flutter/repository/contacts_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('Contact screen', (tester) async {
    await loadAppFonts();
    final GetIt getIt = GetIt.instance;

    getIt.registerSingleton<ContactsRepository>(ContactsRepository());
    getIt.registerSingleton<ContactsBloc>(ContactsBloc());

    await tester.pumpWidgetBuilder(const ContactsScreen());

    await multiScreenGolden(tester, 'contact_screen');
  });
}
