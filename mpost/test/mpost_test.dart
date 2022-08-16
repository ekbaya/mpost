import 'package:flutter_test/flutter_test.dart';
import 'package:mpost/models/address.dart';
import 'package:mpost/models/deliveryRequest.dart';
import 'package:mpost/models/distance.dart';
import 'package:mpost/models/distanceRequest.dart';
import 'package:mpost/models/newDeliveryRequest.dart';
import 'package:mpost/models/place.dart';

import 'package:mpost/mpost.dart';

void main() {
  final mpost = Mpost("de6cad52-1605-446f-a167-14f845d8b5a0");
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

  test('Creating Delivery Request', () async {
    Address deliveryAddress = Address(
        latitude: 40.659569,
        longitude: -73.933783,
        address: "Globe Round About",
        detailed_address:
            "Sunrays House, Near Globe Cinema Roundabout, Nairobi City");
    Address pickupAddress = Address(
        latitude: 37.785834,
        longitude: -122.406417,
        address: "Globe Round About",
        detailed_address:
            "Sunrays House, Near Globe Cinema Roundabout, Nairobi City");
    NewDeliveryRequest newDeliveryRequest = NewDeliveryRequest(
      delivery_address: deliveryAddress,
      item_type: 'Food',
      pickup_time: '2022-02-02 11:11:00',
      pickup_address: pickupAddress,
      recipient_mobile: '0712695820',
      recipient_name: 'Elias Baya',
    );
    expect(
      (await mpost.createDeliveryRequest(newDeliveryRequest)).runtimeType ==
          DeliveryRequest,
      true,
    );
  });

  test('Fetching All Delivery Requests', () async {
    expect(
      (await mpost.getDeliveryRequests()).runtimeType ==
          List<DeliveryRequest>,
      true,
    );
  });

   test('Get A Single Delivery Request', () async {
    expect(
      (await mpost.getDeliveryRequest(130)).runtimeType ==
          DeliveryRequest,
      true,
    );
  });
}
