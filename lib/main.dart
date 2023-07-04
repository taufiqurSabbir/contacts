import 'package:flutter/material.dart';

void main() {
  runApp(ContactListApp());
}

class Contact {
  final String name;
  final String email;
  final String phoneNumber;

  Contact({required this.name, required this.email, required this.phoneNumber});
}

class ContactListApp extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(name: 'John Doe', email: 'johndoe@example.com', phoneNumber: '1234567890'),
    Contact(name: 'Jane Smith', email: 'janesmith@example.com', phoneNumber: '0987654321'),
    Contact(name: 'Alice Johnson', email: 'alicejohnson@example.com', phoneNumber: '9876543210'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactListScreen(contacts: contacts),
    );
  }
}

class ContactListScreen extends StatelessWidget {
  final List<Contact> contacts;

  ContactListScreen({required this.contacts});

  void _showContactDetails(BuildContext context, Contact contact) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Contact Details', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
              Text('name:${contact.name}'),
              SizedBox(height: 8.0),
              Text('Email: ${contact.email}'),
              SizedBox(height: 8.0),
              Text('Phone: ${contact.phoneNumber}'),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          Contact contact = contacts[index];
          return ListTile(
            title: Text(contact.name),
            subtitle: Text(contact.email),
            onTap: () => _showContactDetails(context, contact),
          );
        },
      ),
    );
  }
}
