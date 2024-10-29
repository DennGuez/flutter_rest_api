class UserPicture {
  final String large;
  final String medium;
  final String thumbnail;

  UserPicture({
    required this.large,
    required this.medium,
    required this.thumbnail
  });

  factory UserPicture.fromJson(Map<String, dynamic> jsonPicture) {
    return UserPicture(
      large: jsonPicture['large'],
      medium: jsonPicture['medium'],
      thumbnail: jsonPicture['thumbnail']
    );
  }
}