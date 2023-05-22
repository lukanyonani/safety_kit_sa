import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../data/model/contact_model.dart';
import '../data/model/user_model.dart';

class SearchView extends StatefulWidget {
  const SearchView({
    super.key,
  });

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<UserModel> _searchResults = [];
  final List<UserModel> _users = [
    UserModel(
      name: 'John',
      surname: 'Doe',
      email: 'johndoe@example.com',
      password: 'password123',
      searchAble: true,
      socialSecurityNumber: '123-45-6789',
      contacts: [
        ContactModel(
          name: 'Jane Doe',
          phone: '555-1234',
        ),
      ],
    ),
    UserModel(
      name: 'Jane',
      surname: 'Doe',
      email: 'janedoe@example.com',
      password: 'password456',
      searchAble: true,
      socialSecurityNumber: '987-65-4321',
      contacts: [
        ContactModel(
          name: 'John Doe',
          phone: '555-5678',
        ),
      ],
    ),
  ];

  void _searchUsers(String query) {
    setState(() {
      _searchResults = [];
      for (UserModel user in _users) {
        if (user.searchAble && user.socialSecurityNumber.contains(query)) {
          _searchResults.add(user);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEC3434),
        elevation: 0,
        toolbarHeight: 80,
        title: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search using ID Number',
                        ),
                        onChanged: _searchUsers,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF1F1F1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Placeholder(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
