/*
@author : Elias Baya Karisa
@email : Eliasbaya1223@gmail.com
@date : 05-08-2022
*/
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mpost/models/place.dart';

class DistanceRequest {
  final Place pickup_address;
  final Place delivery_address;
  DistanceRequest({
    required this.pickup_address,
    required this.delivery_address,
  });

  

  DistanceRequest copyWith({
    Place? pickup_address,
    Place? delivery_address,
  }) {
    return DistanceRequest(
      pickup_address: pickup_address ?? this.pickup_address,
      delivery_address: delivery_address ?? this.delivery_address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pickup_address': pickup_address.toMap(),
      'delivery_address': delivery_address.toMap(),
    };
  }

  factory DistanceRequest.fromMap(Map<dynamic, dynamic> map) {
    return DistanceRequest(
      pickup_address: Place.fromMap(map['pickup_address'] as Map<String,dynamic>),
      delivery_address: Place.fromMap(map['delivery_address'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory DistanceRequest.fromJson(String source) => DistanceRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DistanceRequest(pickup_address: $pickup_address, delivery_address: $delivery_address)';

  @override
  bool operator ==(covariant DistanceRequest other) {
    if (identical(this, other)) return true;
  
    return 
      other.pickup_address == pickup_address &&
      other.delivery_address == delivery_address;
  }

  @override
  int get hashCode => pickup_address.hashCode ^ delivery_address.hashCode;
}
