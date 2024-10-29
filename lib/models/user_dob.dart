class UserDob {
  final DateTime date;
  final int age;
  UserDob({
    required this.date, 
    required this.age
  });

  factory UserDob.fromJson(Map<String, dynamic> jsonDob) {
    return UserDob(
      date: DateTime.parse(jsonDob['date']), 
      age: jsonDob['age']
    );
  }
}