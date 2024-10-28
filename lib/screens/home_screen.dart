import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_api/models/user_model.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest API Call'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final color = user.gender == 'male' ? Colors.red[100] : Colors.blue;
          return ListTile(
            // leading: Image.network(user['picture']['thumbnail']),
            title: Text('${user.name.title} ${user.name.last}'),
            tileColor: color,
            subtitle: Text(user.phone),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.update),
        onPressed: fetchUsers
      ),
    );
  }
  void fetchUsers() async {
    print('Fetching users');
    final Response response;
    // Con Dio no hace falta hacer el jsonDecode
    response = await dio.get('https://randomuser.me/api/?results=100');
    // Expecificamos el tipo de dato porque la response es <dinamyc> y no <List<dynamic>> y usar el map
    final data = response.data['results'] as List<dynamic>;
    setState(() {
      // users = response.data['results'];  OLD
      // Aplicamos el model User
      users = data.map((user) {
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
    });
    print('Fetching complete');
  }
}



