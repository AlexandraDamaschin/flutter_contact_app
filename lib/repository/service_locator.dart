import 'package:get_it/get_it.dart';

import '../contacts/contacts_bloc.dart';
import 'contacts_repository.dart';

void setupLocator() {
  GetIt locator = GetIt.instance;

  locator.registerLazySingleton(() => ContactsRepository());

  locator.registerLazySingleton(() => ContactsBloc());
}
