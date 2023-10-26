import 'dart:async';

import 'package:contact_app_with_flutter/contacts/contacts_state.dart';
import 'package:contact_app_with_flutter/repository/contacts_repository.dart';
import 'package:get_it/get_it.dart';

import '../utilis/generic_states.dart';

class ContactsBloc {
  ContactsBloc() {
    _contactsRepository = GetIt.instance<ContactsRepository>();
    _applicationStreamController = StreamController<GenericStates>();
  }

  late ContactsRepository _contactsRepository;
  late StreamController<GenericStates> _applicationStreamController;

  Stream<GenericStates> get contacts => _applicationStreamController.stream;

  void initStream() {
    if (_applicationStreamController.isClosed) {
      _applicationStreamController = StreamController<GenericStates>();
    }
  }

  void getContacts() {
    _applicationStreamController.sink.add(ContactsState.registerLoading());

    _contactsRepository.getContacts().then((contacts) {
      _applicationStreamController.sink
          .add(ContactsState.registerData(contacts));
    }).catchError((err) {});
  }

  void dispose() {
    _applicationStreamController.close();
  }
}
