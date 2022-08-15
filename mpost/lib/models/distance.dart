// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Distance {
  final int actual_distance;
  final double calculated_distance;
  final String duration;
  final DeliveryCost deliveryCost;
  final int total_delivery_cost;
  Distance({
    required this.actual_distance,
    required this.calculated_distance,
    required this.duration,
    required this.deliveryCost,
    required this.total_delivery_cost,
  });

  Distance copyWith({
    int? actual_distance,
    double? calculated_distance,
    String? duration,
    DeliveryCost? deliveryCost,
    int? total_delivery_cost,
  }) {
    return Distance(
      actual_distance: actual_distance ?? this.actual_distance,
      calculated_distance: calculated_distance ?? this.calculated_distance,
      duration: duration ?? this.duration,
      deliveryCost: deliveryCost ?? this.deliveryCost,
      total_delivery_cost: total_delivery_cost ?? this.total_delivery_cost,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'actual_distance': actual_distance,
      'calculated_distance': calculated_distance,
      'duration': duration,
      'deliveryCost': deliveryCost.toMap(),
      'total_delivery_cost': total_delivery_cost,
    };
  }

  factory Distance.fromMap(Map<dynamic, dynamic> map) {
    return Distance(
      actual_distance: map['actual_distance'] as int,
      calculated_distance: map['calculated_distance'] as double,
      duration: map['duration'] as String,
      deliveryCost:
          DeliveryCost.fromMap(map['delivery_cost'] as Map<dynamic, dynamic>),
      total_delivery_cost: map['total_delivery_cost'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Distance.fromJson(String source) =>
      Distance.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Distance(actual_distance: $actual_distance, calculated_distance: $calculated_distance, duration: $duration, deliveryCost: $deliveryCost, total_delivery_cost: $total_delivery_cost)';
  }

  @override
  bool operator ==(covariant Distance other) {
    if (identical(this, other)) return true;

    return other.actual_distance == actual_distance &&
        other.calculated_distance == calculated_distance &&
        other.duration == duration &&
        other.deliveryCost == deliveryCost &&
        other.total_delivery_cost == total_delivery_cost;
  }

  @override
  int get hashCode {
    return actual_distance.hashCode ^
        calculated_distance.hashCode ^
        duration.hashCode ^
        deliveryCost.hashCode ^
        total_delivery_cost.hashCode;
  }
}

class DeliveryCost {
  final int base_rate;
  final int per_km;
  DeliveryCost({
    required this.base_rate,
    required this.per_km,
  });

  DeliveryCost copyWith({
    int? base_rate,
    int? per_km,
  }) {
    return DeliveryCost(
      base_rate: base_rate ?? this.base_rate,
      per_km: per_km ?? this.per_km,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'base_rate': base_rate,
      'per_km': per_km,
    };
  }

  factory DeliveryCost.fromMap(Map<dynamic, dynamic> map) {
    return DeliveryCost(
      base_rate: map['base_rate'] as int,
      per_km: map['per_km'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryCost.fromJson(String source) =>
      DeliveryCost.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DeliveryCost(base_rate: $base_rate, per_km: $per_km)';

  @override
  bool operator ==(covariant DeliveryCost other) {
    if (identical(this, other)) return true;

    return other.base_rate == base_rate && other.per_km == per_km;
  }

  @override
  int get hashCode => base_rate.hashCode ^ per_km.hashCode;
}
