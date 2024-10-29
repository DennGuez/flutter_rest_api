class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postCode;
  final LocationStreet street;
  final LocationCoordinate coordinates;
  final LocalTimezone timezone;
  UserLocation({
    required this.city, 
    required this.state, 
    required this.country, 
    required this.postCode, 
    required this.street, 
    required this.coordinates, 
    required this.timezone
  });

  factory UserLocation.fromJson(Map<String, dynamic> jsonLocation) {
            // UserLocation
        final coordinate = LocationCoordinate.fromJson(jsonLocation['coordinates']);
        final street = LocationStreet.fromJson(jsonLocation['street']);
        final timezone = LocalTimezone.fromJson(jsonLocation['timezone']);

        return UserLocation(
          city: jsonLocation['city'],
          country: jsonLocation['country'],
          postCode: jsonLocation['postcode'].toString(), // Some post code are string
          state: jsonLocation['state'],
          coordinates: coordinate, 
          street: street,
          timezone: timezone 
        );
  }

}
class LocationCoordinate {
  final String latitude;
  final String longitude;
  LocationCoordinate({
    required this.latitude, 
    required this.longitude
  });
  factory LocationCoordinate.fromJson(Map<String, dynamic> jsonCoordinate) {
    return LocationCoordinate(
      latitude: jsonCoordinate['latitude'].toString(), 
      longitude: jsonCoordinate['longitude'].toString()
    );
  }
}
class LocationStreet {
  final int number;
  final String name;
  LocationStreet({
    required this.number, 
    required this.name
  });

  factory LocationStreet.fromJson(Map<String, dynamic> jsonStreet) {
    return LocationStreet(
      number: jsonStreet['number'], 
      name: jsonStreet['name']
    );
  }
}
class LocalTimezone {
  final String offset;
  final String description;
  LocalTimezone({
    required this.offset, 
    required this.description
  });
  factory LocalTimezone.fromJson(Map<String, dynamic> jsonTimezone) {
    return LocalTimezone(
      offset: jsonTimezone['offset'], 
      description: jsonTimezone['description']
    );
  }
}