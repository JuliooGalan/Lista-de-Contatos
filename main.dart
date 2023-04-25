import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Contatos',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ContactsPage(),
    );
  }
}

class ContactsPage extends StatefulWidget {
  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  int quantidadeFav = 0;
  List<bool> click = [true, true, true, true, true];
  List<bool> isClicked = List<bool>.generate(5, (index) => false);

  final List<Contact> contacts = [
    Contact(name: "John Doe", email: 'john_doeoe@gmail.com'),
    Contact(name: "Alice O. Austin", email: 'AliceOAustin@rhyta.com'),
    Contact(name: "Douglas R. Broadway", email: 'DouglasRBroadway@dayrep.com'),
    Contact(name: "Julio Cesar", email: "julio.eu123@gmail.com"),
    Contact(name: "Cauê Palma", email: "caue.palma10@gmail.com")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos Favoritos $quantidadeFav'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://i.pravatar.cc/150?img=$index"
                  )
                  ),
            title: Text(contacts[index].name),
            subtitle: Text(contacts[index].email),
            trailing: IconButton(
              icon: Icon(
                isClicked[index] ? Icons.favorite : Icons.favorite_border,
                color: isClicked[index] ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  if (isClicked[index]) {
                    quantidadeFav--;
                  } else {
                    quantidadeFav++;
                  }
                  isClicked[index] = !isClicked[index];
                });
              },
              color: Colors.red,
            ),
          );
        },
      ),
    );
  }
}

class Contact {
  String name;
  String email;

  Contact({required this.name, required this.email});
}

