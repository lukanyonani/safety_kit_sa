import 'contact_model.dart';

class UserModel {
  String name;
  String surname;
  String email;
  String password;
  bool searchAble;
  String socialSecurityNumber;
  List<ContactModel> contacts;

  UserModel({
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    this.searchAble = false,
    this.socialSecurityNumber = '',
    this.contacts = const [],
  });
}
