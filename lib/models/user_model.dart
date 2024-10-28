import 'package:flutter_rest_api/models/user_name.dart';

class User {
  String gender;
  String email;
  String phone;
  String cell;
  String nat;
  UserName name;

  User({
    required this.gender, 
    required this.email, 
    required this.phone, 
    required this.cell, 
    required this.nat,
    required this.name
  });

  String get fullName => '${name.title} ${name.last}';

}