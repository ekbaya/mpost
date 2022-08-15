import 'package:flutter_test/flutter_test.dart';
import 'package:mpost/models/distance.dart';
import 'package:mpost/models/distanceRequest.dart';
import 'package:mpost/models/place.dart';

import 'package:mpost/mpost.dart';

void main() {
  final mpost = Mpost("dd986892-170f-493d-9e50-b368b8218c32");
  test('Calculating Distance', () async {
    Place pickUpAddress = Place(latitude: -0.9534506, longitude: 37.0820681);
    Place deliveryAddress = Place(latitude: -1.046594, longitude: 37.060197);
    DistanceRequest distanceRequest = DistanceRequest(
        delivery_address: deliveryAddress, pickup_address: pickUpAddress);
    expect(
      await mpost.calculateDistance(distanceRequest),
      Distance(
          actual_distance: 13452,
          calculated_distance: 13.45,
          deliveryCost: DeliveryCost(base_rate: 50, per_km: 35),
          duration: '17 mins',
          total_delivery_cost: 521),
    );
  });
}
