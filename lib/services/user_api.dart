import 'package:dio/dio.dart';
import 'package:flutter_rest_api/models/user_model.dart';

class UserApi {
  // static*
  // No necesitan una instancia: Puedes llamarlos directamente desde la clase.
  // No acceden a variables de instancia: Como no están ligados a ninguna instancia 
  // en particular, no pueden acceder a propiedades no estáticas de la clase. 
  /// Solo pueden interactuar con otras propiedades y métodos estáticos.
  static Future<List<User>> fetchUsers() async {
    final Dio dio = Dio();
    // List<User> users = [];
    print('Fetching users');
    final Response response;
    // Con Dio no hace falta hacer el jsonDecode
    response = await dio.get('https://randomuser.me/api/?results=100');
    // Expecificamos el tipo de dato porque la response es <dinamyc> y no <List<dynamic>> y usar el map
    final data = response.data['results'] as List<dynamic>;
      // users = response.data['results'];  OLD
      // Aplicamos el model User
      final List<User> users = data.map((user) {
        // Con el function factory
        return User.fromJson(user);
        // OLD PARSING MODEL
        // // UserName
        // final name = UserName(
        //   title: user['name']['title'], 
        //   first: user['name']['first'], 
        //   last: user['name']['last']
        // );
        // // UserDob
        // final dob = UserDob(
        //   date: DateTime.parse(user['dob']['date']), 
        //   age: user['dob']['age']
        // );
        // // UserLocation
        // final coordinate = LocationCoordinate(
        //   latitude: user['location']['coordinates']['latitude'].toString(), 
        //   longitude: user['location']['coordinates']['longitude'].toString()
        // );
        // final street = LocationStreet(
        //   number: user['location']['street']['number'], 
        //   name: user['location']['street']['name']
        // );
        // final timezone = LocalTimezone(
        //   offset: user['location']['timezone']['offset'], 
        //   description: user['location']['timezone']['description']
        // );
        // final location = UserLocation(
        //   city: user['location']['city'],
        //   country: user['location']['country'],
        //   postCode: user['location']['postcode'].toString(), // Some post code are string
        //   state: user['location']['state'],
        //   coordinates: coordinate, 
        //   street: street,
        //   timezone: timezone 
        // );
        // // User
        // return User(
        //   gender: user['gender'],
        //   email: user['email'],
        //   phone: user['phone'],
        //   cell: user['cell'],
        //   nat: user['nat'],
        //   name: name,
        //   dob: dob,
        //   location: location
        // );
      } ).toList();
      print('Fetching complete');
      return users;
    }
  }