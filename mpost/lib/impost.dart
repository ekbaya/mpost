// ignore: file_names
import 'package:mpost/controllers/mpostController.dart';
import 'package:mpost/models/deliveryRequest.dart';
import 'package:mpost/models/distance.dart';
import 'package:mpost/models/distanceRequest.dart';
import 'package:mpost/models/newDeliveryRequest.dart';
/*
@class : IMpost - Defines all the methods in the sdk
@author : Elias Baya Karisa
@email : Eliasbaya1223@gmail.com
@date : 05-08-2022
*/
abstract class IMpost {
  late MpostController controller;
  Future<Distance> calculateDistance(DistanceRequest distanceRequest);
  Future<DeliveryRequest> createDeliveryRequest(NewDeliveryRequest deliveryRequest);
  Future<List<DeliveryRequest>> getDeliveryRequests();
  Future<DeliveryRequest> getDeliveryRequest(int id);
}
