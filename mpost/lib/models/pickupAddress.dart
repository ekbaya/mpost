/*
@author : Elias Baya Karisa
@email : Eliasbaya1223@gmail.com
@date : 05-08-2022
*/
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PickupAddress {
  final int id;
  final int user_id;
  final double latitude;
  final double longitude;
  final String address;
  final String detailed_address;
  final String created_at;
  final String updated_at;
  final String deleted_at;
  PickupAddress({
    required this.id,
    required this.user_id,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.detailed_address,
    required this.created_at,
    required this.updated_at,
    required this.deleted_at,
  });

  PickupAddress copyWith({
    int? id,
    int? user_id,
    double? latitude,
    double? longitude,
    String? address,
    String? detailed_address,
    String? created_at,
    String? updated_at,
    String? deleted_at,
  }) {
    return PickupAddress(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      detailed_address: detailed_address ?? this.detailed_address,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      deleted_at: deleted_at ?? this.deleted_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': user_id,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'detailed_address': detailed_address,
      'created_at': created_at,
      'updated_at': updated_at,
      'deleted_at': deleted_at,
    };
  }

  factory PickupAddress.fromMap(Map<dynamic, dynamic> map) {
    return PickupAddress(
      id: map['id'] as int,
      user_id: map['user_id'] as int,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      address: map['address'] .toString(),
      detailed_address: map['detailed_address'] .toString(),
      created_at: map['created_at'] .toString(),
      updated_at: map['updated_at'] .toString(),
      deleted_at: map['deleted_at'] .toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory PickupAddress.fromJson(String source) => PickupAddress.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PickupAddress(id: $id, user_id: $user_id, latitude: $latitude, longitude: $longitude, address: $address, detailed_address: $detailed_address, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at)';
  }

  @override
  bool operator ==(covariant PickupAddress other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.user_id == user_id &&
      other.latitude == latitude &&
      other.longitude == longitude &&
      other.address == address &&
      other.detailed_address == detailed_address &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.deleted_at == deleted_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      user_id.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      address.hashCode ^
      detailed_address.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      deleted_at.hashCode;
  }
}
