/*
@author : Elias Baya Karisa
@email : Eliasbaya1223@gmail.com
@date : 05-08-2022
*/
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mpost/models/deliveryAddress.dart';
import 'package:mpost/models/paymentRequest.dart';
import 'package:mpost/models/pickupAddress.dart';
import 'package:mpost/models/status.dart';
import 'package:mpost/models/user.dart';

class DeliveryRequest {
  final int id;
  final int user_id;
  final int payment_request_id;
  final int status_id;
  final int pickup_address_id;
  final int delivery_address_id;
  final String pickup_time;
  final double estimated_distance;
  final int actual_distance;
  final String estimated_duration;
  final int delivery_cost;
  final String recipient_name;
  final String recipient_mobile;
  final String item_type;
  final String note;
  final String instructions;
  final String created_at;
  final String updated_at;
  final String deleted_at;
  final Status status;
  final User user;
  final PickupAddress pickupAddress;
  final DeliveryAddress deliveryAddress;
  final PaymentRequest paymentRequest;
  DeliveryRequest({
    required this.id,
    required this.user_id,
    required this.payment_request_id,
    required this.status_id,
    required this.pickup_address_id,
    required this.delivery_address_id,
    required this.pickup_time,
    required this.estimated_distance,
    required this.actual_distance,
    required this.estimated_duration,
    required this.delivery_cost,
    required this.recipient_name,
    required this.recipient_mobile,
    required this.item_type,
    required this.note,
    required this.instructions,
    required this.created_at,
    required this.updated_at,
    required this.deleted_at,
    required this.status,
    required this.user,
    required this.pickupAddress,
    required this.deliveryAddress,
    required this.paymentRequest,
  });

  DeliveryRequest copyWith({
    int? id,
    int? user_id,
    int? payment_request_id,
    int? status_id,
    int? pickup_address_id,
    int? delivery_address_id,
    String? pickup_time,
    double? estimated_distance,
    int? actual_distance,
    String? estimated_duration,
    int? delivery_cost,
    String? recipient_name,
    String? recipient_mobile,
    String? item_type,
    String? note,
    String? instructions,
    String? created_at,
    String? updated_at,
    String? deleted_at,
    Status? status,
    User? user,
    PickupAddress? pickupAddress,
    DeliveryAddress? deliveryAddress,
    PaymentRequest? paymentRequest,
  }) {
    return DeliveryRequest(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      payment_request_id: payment_request_id ?? this.payment_request_id,
      status_id: status_id ?? this.status_id,
      pickup_address_id: pickup_address_id ?? this.pickup_address_id,
      delivery_address_id: delivery_address_id ?? this.delivery_address_id,
      pickup_time: pickup_time ?? this.pickup_time,
      estimated_distance: estimated_distance ?? this.estimated_distance,
      actual_distance: actual_distance ?? this.actual_distance,
      estimated_duration: estimated_duration ?? this.estimated_duration,
      delivery_cost: delivery_cost ?? this.delivery_cost,
      recipient_name: recipient_name ?? this.recipient_name,
      recipient_mobile: recipient_mobile ?? this.recipient_mobile,
      item_type: item_type ?? this.item_type,
      note: note ?? this.note,
      instructions: instructions ?? this.instructions,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      deleted_at: deleted_at ?? this.deleted_at,
      status: status ?? this.status,
      user: user ?? this.user,
      pickupAddress: pickupAddress ?? this.pickupAddress,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      paymentRequest: paymentRequest ?? this.paymentRequest,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': user_id,
      'payment_request_id': payment_request_id,
      'status_id': status_id,
      'pickup_address_id': pickup_address_id,
      'delivery_address_id': delivery_address_id,
      'pickup_time': pickup_time,
      'estimated_distance': estimated_distance,
      'actual_distance': actual_distance,
      'estimated_duration': estimated_duration,
      'delivery_cost': delivery_cost,
      'recipient_name': recipient_name,
      'recipient_mobile': recipient_mobile,
      'item_type': item_type,
      'note': note,
      'instructions': instructions,
      'created_at': created_at,
      'updated_at': updated_at,
      'deleted_at': deleted_at,
      'status': status.toMap(),
      'user': user.toMap(),
      'pickupAddress': pickupAddress.toMap(),
      'deliveryAddress': deliveryAddress.toMap(),
      'paymentRequest': paymentRequest.toMap(),
    };
  }

  factory DeliveryRequest.fromMap(Map<dynamic, dynamic> map) {
    return DeliveryRequest(
      id: map['id'] as int,
      user_id: map['user_id'] as int,
      payment_request_id: map['payment_request_id'] as int,
      status_id: map['status_id'] as int,
      pickup_address_id: map['pickup_address_id'] as int,
      delivery_address_id: map['delivery_address_id'] as int,
      pickup_time: map['pickup_time'] as String,
      estimated_distance: map['estimated_distance'] as double,
      actual_distance: map['actual_distance'] as int,
      estimated_duration: map['estimated_duration'] as String,
      delivery_cost: map['delivery_cost'] as int,
      recipient_name: map['recipient_name'] as String,
      recipient_mobile: map['recipient_mobile'] as String,
      item_type: map['item_type'] as String,
      note: map['note'] as String,
      instructions: map['instructions'] as String,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
      deleted_at: map['deleted_at'] as String,
      status: Status.fromMap(map['status'] as Map<dynamic, dynamic>),
      user: User.fromMap(map['user'] as Map<dynamic, dynamic>),
      pickupAddress:
          PickupAddress.fromMap(map['pickup_address'] as Map<dynamic, dynamic>),
      deliveryAddress: DeliveryAddress.fromMap(
          map['delivery_address'] as Map<dynamic, dynamic>),
      paymentRequest: PaymentRequest.fromMap(
          map['payment_request'] as Map<dynamic, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryRequest.fromJson(String source) =>
      DeliveryRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DeliveryRequest(id: $id, user_id: $user_id, payment_request_id: $payment_request_id, status_id: $status_id, pickup_address_id: $pickup_address_id, delivery_address_id: $delivery_address_id, pickup_time: $pickup_time, estimated_distance: $estimated_distance, actual_distance: $actual_distance, estimated_duration: $estimated_duration, delivery_cost: $delivery_cost, recipient_name: $recipient_name, recipient_mobile: $recipient_mobile, item_type: $item_type, note: $note, instructions: $instructions, created_at: $created_at, updated_at: $updated_at, deleted_at: $deleted_at, status: $status, user: $user, pickupAddress: $pickupAddress, deliveryAddress: $deliveryAddress, paymentRequest: $paymentRequest)';
  }

  @override
  bool operator ==(covariant DeliveryRequest other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.user_id == user_id &&
        other.payment_request_id == payment_request_id &&
        other.status_id == status_id &&
        other.pickup_address_id == pickup_address_id &&
        other.delivery_address_id == delivery_address_id &&
        other.pickup_time == pickup_time &&
        other.estimated_distance == estimated_distance &&
        other.actual_distance == actual_distance &&
        other.estimated_duration == estimated_duration &&
        other.delivery_cost == delivery_cost &&
        other.recipient_name == recipient_name &&
        other.recipient_mobile == recipient_mobile &&
        other.item_type == item_type &&
        other.note == note &&
        other.instructions == instructions &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.deleted_at == deleted_at &&
        other.status == status &&
        other.user == user &&
        other.pickupAddress == pickupAddress &&
        other.deliveryAddress == deliveryAddress &&
        other.paymentRequest == paymentRequest;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user_id.hashCode ^
        payment_request_id.hashCode ^
        status_id.hashCode ^
        pickup_address_id.hashCode ^
        delivery_address_id.hashCode ^
        pickup_time.hashCode ^
        estimated_distance.hashCode ^
        actual_distance.hashCode ^
        estimated_duration.hashCode ^
        delivery_cost.hashCode ^
        recipient_name.hashCode ^
        recipient_mobile.hashCode ^
        item_type.hashCode ^
        note.hashCode ^
        instructions.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        deleted_at.hashCode ^
        status.hashCode ^
        user.hashCode ^
        pickupAddress.hashCode ^
        deliveryAddress.hashCode ^
        paymentRequest.hashCode;
  }
}
