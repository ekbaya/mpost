import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mpost/constants/http.dart';
import 'package:mpost/models/deliveryRequest.dart';
import 'package:mpost/models/distance.dart';
import 'package:mpost/models/distanceRequest.dart';
import 'package:mpost/models/newDeliveryRequest.dart';
import 'package:http/http.dart' as http;
/*
@class : MpostController - The central Repository of the sdk
@author : Elias Baya Karisa
@email : Eliasbaya1223@gmail.com
@date : 05-08-2022
*/
class MpostController {
  String apikey;
  MpostController({required this.apikey});

  Future<List<DeliveryRequest>> getDeliveryRequests() async {
    List<DeliveryRequest> deliveryRequests = [];
    final result = await http.get(
      Uri.parse(getDeliveryRequestsURL),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "api-key": apikey,
      },
    );
    var convertDataToJson = jsonDecode(result.body);
    List list = convertDataToJson;
    deliveryRequests = list.map((e) => DeliveryRequest.fromMap(e)).toList();
    return deliveryRequests;
  }

  Future<DeliveryRequest> getDeliveryRequest(int id) async {
    final result = await http.get(
      Uri.parse("$getDeliveryRequestURL/$id/?with[]=payment_request.payment_method&with[]=pickup_address&with[]=delivery_address&with[]=status&with[]=user"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "api-key": apikey,
      },
    );
    var convertDataToJson = jsonDecode(result.body);
    if (kDebugMode) {
      print("RES=========$convertDataToJson");
    }
    return DeliveryRequest.fromMap(convertDataToJson);
  }

  Future<Distance> calculateDistance(DistanceRequest distanceRequest) async {
    final result = await http.post(
      Uri.parse(calculateDistanceURL),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "api-key": apikey,
      },
      body: jsonEncode(distanceRequest.toMap()),
    );
    var convertDataToJson = jsonDecode(result.body);

    return Distance.fromMap(convertDataToJson);
  }

  Future<DeliveryRequest> createDeliveryRequest(
      NewDeliveryRequest deliveryRequest) async {
    final result = await http.post(
      Uri.parse(createDeliveryURL),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "api-key": apikey,
      },
      body: jsonEncode(deliveryRequest.toMap()),
    );
    var convertDataToJson = jsonDecode(result.body);
    if (kDebugMode) {
      print("RES=========$convertDataToJson");
    }
    return DeliveryRequest.fromMap(convertDataToJson);
  }
}
