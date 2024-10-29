import 'package:flutter_rest_api/models/user_dob.dart';
import 'package:flutter_rest_api/models/user_location.dart';
import 'package:flutter_rest_api/models/user_name.dart';
import 'package:flutter_rest_api/models/user_picture.dart';

class User {
  String gender;
  String email;
  String phone;
  String cell;
  String nat;
  UserName name;
  UserDob dob;
  UserLocation location;
  UserPicture picture;

  User({
    required this.gender, 
    required this.email, 
    required this.phone, 
    required this.cell, 
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
    required this.picture,
  });

  String get fullName => '${name.title} ${name.last}';

  factory User.fromJson(Map<String, dynamic> json) { 
        // UserName OLD sin el metodo factory
        // final name = UserName(
        //   title: json['name']['title'], 
        //   first: json['name']['first'], 
        //   last: json['name']['last']
        // );
       // UserName
        final name = UserName.fromJson(json['name']);
        // UserDob
        final dob = UserDob.fromJson(json['dob']);
        // UserLocation
        final location = UserLocation.fromJson(json['location']);
        // UserPicture
        final picture = UserPicture.fromJson(json['picture']);
        // User
        return User(
          gender: json['gender'],
          email: json['email'],
          phone: json['phone'],
          cell: json['cell'],
          nat: json['nat'],
          name: name,
          dob: dob,
          location: location,
          picture: picture
        );
  }
}