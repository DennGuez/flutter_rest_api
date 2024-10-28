import 'package:dio/dio.dart';
import 'package:flutter_rest_api/models/user_model.dart';
import 'package:flutter_rest_api/models/user_name.dart';

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
        final name = UserName(
          title: user['name']['title'], 
          first: user['name']['first'], 
          last: user['name']['last']
        );
        return User(
          gender: user['gender'],
          email: user['email'],
          phone: user['phone'],
          cell: user['cell'],
          nat: user['nat'],
          name: name
        );
      } ).toList();
      print('Fetching complete');
      return users;
    }
  }