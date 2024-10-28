import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_api/models/user_model.dart';
import 'package:flutter_rest_api/services/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dio = Dio();
  // List<dynamic> users = []; OLD
  // Cuandro creemos el modelo user ahora la lista sera del modelo User
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    // Llamamos la api al inicio
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API Call'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          // final color = user.gender == 'male' ? Colors.red[100] : Colors.blue;
          return ListTile(
            // leading: Image.network(user['picture']['thumbnail']),
            title: Text( user.fullName),
            // tileColor: color,
            subtitle: Text(user.phone),
          );
        },
      ),
      // Boton para hacer el fetch
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.update),
      //   onPressed: fetchUsers
      // ),
    );

  }
    // Tiene que ser una funcion aparte porque el initState() no puede ser async
    Future<void> fetchUsers() async {
      final resp = await UserApi.fetchUsers(); 
      setState(() {
        users = resp;
      });
    }
}



