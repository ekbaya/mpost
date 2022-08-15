/*
@author : Elias Baya Karisa
@email : Eliasbaya1223@gmail.com
@date : 05-08-2022
*/
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Address {
  final double latitude;
  final double longitude;
  final String address;
  final String detailed_address;
  Address({
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.detailed_address,
  });

  

  Address copyWith({
    double? latitude,
    double? longitude,
    String? address,
    String? detailed_address,
  }) {
    return Address(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      detailed_address: detailed_address ?? this.detailed_address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'detailed_address': detailed_address,
    };
  }

  factory Address.fromMap(Map<dynamic, dynamic> map) {
    return Address(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      address: map['address'] as String,
      detailed_address: map['detailed_address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) => Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Address(latitude: $latitude, longitude: $longitude, address: $address, detailed_address: $detailed_address)';
  }

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;
  
    return 
      other.latitude == latitude &&
      other.longitude == longitude &&
      other.address == address &&
      other.detailed_address == detailed_address;
  }

  @override
  int get hashCode {
    return latitude.hashCode ^
      longitude.hashCode ^
      address.hashCode ^
      detailed_address.hashCode;
  }
}
