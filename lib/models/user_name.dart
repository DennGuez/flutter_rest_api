class UserName {
  String title;
  String first;
  String last;

  UserName({
    required this.title, 
    required this.first, 
    required this.last
  });

  factory UserName.fromJson(Map<String, dynamic> jsonName) {
    return UserName(
      title: jsonName['title'], 
      first: jsonName['first'], 
      last: jsonName['last']
    );
  }
}