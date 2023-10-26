import 'package:contact_app_with_flutter/models/contact.dart';
import 'package:contact_app_with_flutter/utilis/generic_states.dart';

class ContactsState extends GenericStates {
  ContactsState() : super();
  factory ContactsState.registerData(List<Contact> contact) = ContactsDataState;
  factory ContactsState.registerLoading() = ContactsLoadingState;
}

class ContactsInitState extends ContactsState {}

class ContactsLoadingState extends ContactsState {}

class ContactsDataState extends ContactsState {
  ContactsDataState(this.contacts);
  final List<Contact> contacts;
}

class ContactsErrorState extends ContactsState {
  ContactsErrorState(this.error);
  final Error error;
}
