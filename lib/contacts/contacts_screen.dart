import 'package:contact_app_with_flutter/contacts/contacts_state.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:grouped_list/grouped_list.dart';

import '../components/contact_row.dart';
import 'contacts_bloc.dart';
import '../models/contact.dart';
import '../utilis/extensions.dart' as extensions;
import '../utilis/generic_states.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  _ContactsScreenState() {
    _contactsBloc = GetIt.instance<ContactsBloc>();
    _contactsBloc.initStream();
  }

  late ContactsBloc _contactsBloc;
  late bool showLoading;
  late final List<Contact> _searchResult = [];

  List<Contact> contacts = [];
  Map<String, List<Contact>> groupedContacts = {};

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _contactsBloc.getContacts();
    showLoading = false;
  }

  @override
  void dispose() {
    _contactsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GenericStates>(
        stream: _contactsBloc.contacts,
        initialData: ContactsInitState(),
        builder: (context, snapshot) {
          if (snapshot.data is ContactsInitState) {
            showLoading = false;
            return _buildInit();
          }
          if (snapshot.data is ContactsDataState) {
            ContactsDataState state = snapshot.data as ContactsDataState;
            contacts = state.contacts;

            sortContactsAlphabetic();

            groupedContacts = contacts.groupBy((m) => m.firstName[0]);
            showLoading = false;
            return _buildInit();
          }
          if (snapshot.data is ContactsLoadingState) {
            showLoading = true;
            return _buildInit();
          }
          if (snapshot.data is GenericErrorState) {
            showLoading = false;
          }
          return _buildInit();
        });
  }

  Widget _buildInit() {
    Widget searchBar = Flexible(
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.search),
          title: TextField(
            controller: searchController,
            decoration: const InputDecoration(
                hintText: 'Search', border: InputBorder.none),
            onChanged: onSearchTextChanged,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              searchController.clear();
              onSearchTextChanged('');
            },
          ),
        ),
      ),
    );

    Widget searchList = ListView.builder(
      itemCount: _searchResult.length,
      itemBuilder: (context, index) {
        var newContact = _buildContact(
            _searchResult[index].firstName, _searchResult[index].lastName);

        return ContactRow(contact: newContact);
      },
    );

    Widget contactsList = CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return GroupedListView<dynamic, String>(
                shrinkWrap: true,
                elements: groupedContacts.values.toList()[index],
                groupBy: (element) => groupedContacts.keys.toList()[index],
                groupSeparatorBuilder: (String groupByValue) =>
                    Text('Contacts starting with $groupByValue'),
                itemBuilder: (context, element) {
                  var newContact =
                      _buildContact(element.firstName, element.lastName);

                  return ContactRow(contact: newContact);
                },
              );
            },
            childCount: groupedContacts.length,
          ),
        ),
      ],
    );

    return Scaffold(
        appBar: AppBar(
          actions: [searchBar],
        ),
        body: _searchResult.isNotEmpty || searchController.text.isNotEmpty
            ? searchList
            : contactsList);
  }

  Contact _buildContact(String contactFirstName, String contactLastName) {
    return Contact(
      firstName: contactFirstName,
      lastName: contactLastName,
      email: extensions.createEmail(
          contactFirstName, contactLastName, "gmail.com"),
      username: extensions.createUsername(contactFirstName, contactLastName),
    );
  }

  sortContactsAlphabetic() {
    contacts.sort((a, b) {
      return a.firstName.toLowerCase().compareTo(b.firstName.toLowerCase());
    });
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    var searchText = text.toLowerCase();
    if (searchText.isEmpty) {
      setState(() {});
      return;
    }

    for (var contact in contacts) {
      if (contact.firstName.toLowerCase().contains(searchText) ||
          contact.lastName.toLowerCase().contains(searchText)) {
        _searchResult.add(contact);
      }
    }
    setState(() {});
  }
}
