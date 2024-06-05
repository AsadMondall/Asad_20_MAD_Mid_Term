import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts (12)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchBar(),
            SizedBox(height: 16),
            Expanded(child: ContactsList()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'search names, companies etc',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            ),
          ),
        ),
        SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {
            // Add contact action
          },
          child: Icon(Icons.add),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(), backgroundColor: Colors.blue,
            padding: EdgeInsets.all(16), // <-- Button color
          ),
        ),
      ],
    );
  }
}

class ContactsList extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
        name: 'Richard Penny',
        subtitle: 'Friend',
        date: 'Sat, 8/7',
        avatar: 'assets/contact1.png'),
    Contact(
        name: 'Hella Smith',
        subtitle: 'Bother',
        date: 'Sat, 8/7',
        avatar: 'assets/contact2.png'),
    Contact(
        name: 'Machao Pitch',
        subtitle: 'Colleague of Krugger Co. Ltd.',
        date: 'Sat, 8/7',
        avatar: 'assets/contact3.png'),
    Contact(
        name: 'Harvard Jop',
        subtitle: 'Bosom Friend',
        date: 'Sat, 8/7',
        avatar: 'assets/contact4.png'),
    Contact(
        name: 'Rudder Manny',
        subtitle: 'CEO of Krugger Co. Ltd.',
        date: 'Sat, 8/7',
        avatar: 'assets/contact5.png'),
    Contact(
        name: 'Galla tennyson',
        subtitle: 'Bosom Friend',
        date: 'Sat, 8/7',
        avatar: 'assets/contact6.png'),
    Contact(
        name: 'Johnny Regg',
        subtitle: 'Bother',
        date: 'Sat, 8/7',
        avatar: 'assets/contact7.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(contact.avatar!),
          ),
          title: Text(contact.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(contact.subtitle),
              Text(contact.date),
            ],
          ),
          trailing: Icon(Icons.more_vert),
        );
      },
    );
  }
}

class Contact {
  final String name;
  final String subtitle;
  final String date;
  final String? avatar;

  Contact({
    required this.name,
    required this.subtitle,
    required this.date,
    this.avatar,
  });
}

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: 'Cards'),
        BottomNavigationBarItem(icon: Icon(Icons.contacts), label: 'Contacts'),
        BottomNavigationBarItem(icon: Icon(Icons.share), label: 'Share'),
        BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner), label: 'Scan'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
    );
  }
}
