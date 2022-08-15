/*
@author : Elias Baya Karisa
@email : Eliasbaya1223@gmail.com
@date : 05-08-2022
*/
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mpost/models/address.dart';

class NewDeliveryRequest {
  final Address pickup_address;
  final Address delivery_address;
  final String recipient_name;
  final String recipient_mobile;
  final String  item_type;
  final String  pickup_time;
  NewDeliveryRequest({
    required this.pickup_address,
    required this.delivery_address,
    required this.recipient_name,
    required this.recipient_mobile,
    required this.item_type,
    required this.pickup_time,
  });

  

  NewDeliveryRequest copyWith({
    Address? pickup_address,
    Address? delivery_address,
    String? recipient_name,
    String? recipient_mobile,
    String? item_type,
    String? pickup_time,
  }) {
    return NewDeliveryRequest(
      pickup_address: pickup_address ?? this.pickup_address,
      delivery_address: delivery_address ?? this.delivery_address,
      recipient_name: recipient_name ?? this.recipient_name,
      recipient_mobile: recipient_mobile ?? this.recipient_mobile,
      item_type: item_type ?? this.item_type,
      pickup_time: pickup_time ?? this.pickup_time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pickup_address': pickup_address.toMap(),
      'delivery_address': delivery_address.toMap(),
      'recipient_name': recipient_name,
      'recipient_mobile': recipient_mobile,
      'item_type': item_type,
      'pickup_time': pickup_time,
    };
  }

  factory NewDeliveryRequest.fromMap(Map<dynamic, dynamic> map) {
    return NewDeliveryRequest(
      pickup_address: Address.fromMap(map['pickup_address'] as Map<String,dynamic>),
      delivery_address: Address.fromMap(map['delivery_address'] as Map<String,dynamic>),
      recipient_name: map['recipient_name'] as String,
      recipient_mobile: map['recipient_mobile'] as String,
      item_type: map['item_type'] as String,
      pickup_time: map['pickup_time'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewDeliveryRequest.fromJson(String source) => NewDeliveryRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NewDeliveryRequest(pickup_address: $pickup_address, delivery_address: $delivery_address, recipient_name: $recipient_name, recipient_mobile: $recipient_mobile, item_type: $item_type, pickup_time: $pickup_time)';
  }

  @override
  bool operator ==(covariant NewDeliveryRequest other) {
    if (identical(this, other)) return true;
  
    return 
      other.pickup_address == pickup_address &&
      other.delivery_address == delivery_address &&
      other.recipient_name == recipient_name &&
      other.recipient_mobile == recipient_mobile &&
      other.item_type == item_type &&
      other.pickup_time == pickup_time;
  }

  @override
  int get hashCode {
    return pickup_address.hashCode ^
      delivery_address.hashCode ^
      recipient_name.hashCode ^
      recipient_mobile.hashCode ^
      item_type.hashCode ^
      pickup_time.hashCode;
  }
}
