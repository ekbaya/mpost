/*
@author : Elias Baya Karisa
@email : Eliasbaya1223@gmail.com
@date : 05-08-2022
*/
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DeliveryAddress {
  final int id;
  final int user_id;
  final double latitude;
  final double longitude;
  final String address;
  final String detailed_address;
  final String recipient_name;
  final String recipient_mobile;
  final String created_at;
  final String updated_at;
  final String deleted_at;
  DeliveryAddress({
    required this.id,
    required this.user_id,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.detailed_address,
    required this.recipient_name,
    required this.recipient_mobile,
    required this.created_at,
    required this.updated_at,
    required this.deleted_at,
  });

  DeliveryAddress copyWith({
    int? id,
    int? user_id,
    double? latitude,
    double? longitude,
    String? address,
    String? detailed_address,
    String? recipient_name,
    String? recipient_mobile,
    String? created_at,
    String? updated_at,
    String? deleted_at,
  }) {
    return DeliveryAddress(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      detailed_address: detailed_address ?? this.detailed_address,
      recipient_name: recipient_name ?? this.recipient_name,
      recipient_mobile: recipient_mobile ?? this.recipient_mobile,
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
      'recipient_name': recipient_name,
      'recipient_mobile': recipient_mobile,
      'created_at': created_at,
      'updated_at': updated_at,
      'deleted_at': deleted_at,
    };
  }

  factory DeliveryAddress.fromMap(Map<dynamic, dynamic> map) {
    return DeliveryAddress(
      id: map['id'] as int,
      user_id: map['user_id'] as int,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      address: map['address'] .toString(),
      detailed_address: map['detailed_address'] .toString(),
      recipient_name: map['recipient_name'] .toString(),
      recipient_mobile: map['recipient_mobile'] .toString(),
      created_at: map['created_at'] .toString(),
      updated_at: map['updated_at'] .toString(),
      deleted_at: map['deleted_at'] .toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryAddress.fromJson(String source) =>
      DeliveryAddress.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DeliveryAddress(id: $id, user_id: $user_id, latitude: $latitude, longitude: $longitude, address: $address, detailed_address: $detailed_address, recipient_name: $recipient_name, recipient_mobile: $recipient_mobile, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at)';
  }

  @override
  bool operator ==(covariant DeliveryAddress other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.user_id == user_id &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.address == address &&
        other.detailed_address == detailed_address &&
        other.recipient_name == recipient_name &&
        other.recipient_mobile == recipient_mobile &&
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
        recipient_name.hashCode ^
        recipient_mobile.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        deleted_at.hashCode;
  }
}
