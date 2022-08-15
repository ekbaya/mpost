/*
@author : Elias Baya Karisa
@email : Eliasbaya1223@gmail.com
@date : 05-08-2022
*/
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Place {
  final double latitude;
  final double longitude;
  Place({
    required this.latitude,
    required this.longitude,
  });

  Place copyWith({
    double? latitude,
    double? longitude,
  }) {
    return Place(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Place.fromMap(Map<dynamic, dynamic> map) {
    return Place(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Place.fromJson(String source) =>
      Place.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Place(latitude: $latitude, longitude: $longitude)';

  @override
  bool operator ==(covariant Place other) {
    if (identical(this, other)) return true;

    return other.latitude == latitude && other.longitude == longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}
