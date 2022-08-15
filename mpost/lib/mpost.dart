import 'package:mpost/controllers/mpostController.dart';
import 'package:mpost/impost.dart';
import 'package:mpost/models/distance.dart';
import 'package:mpost/models/newDeliveryRequest.dart';
import 'package:mpost/models/distanceRequest.dart';
import 'package:mpost/models/deliveryRequest.dart';

/*
@class : Mpost - Represents the Mpost SDK
@author : Elias Baya Karisa
@email : Eliasbaya1223@gmail.com
@date : 05-08-2022
*/
class Mpost implements IMpost {
  @override
  late MpostController controller;

  
  ///  SDK Initialization
  ///  [String] apikey - The API key you obtained after creating account
  ///  Return new [Mpost] Object
  
  Mpost(String apikey){
    controller = MpostController(apikey: apikey);
  }

///  calculateDistance
/// Takes  [DistanceRequest] distanceRequest - The objcect with pickup and delivery address
/// return new [Distance] Object

  @override
  Future<Distance> calculateDistance(DistanceRequest distanceRequest) async {
    return await controller.calculateDistance(distanceRequest);
  }

  
  ///  createDeliveryRequest
  ///  Returns new [DeliveryRequest] Object
  @override
  Future<DeliveryRequest> createDeliveryRequest(
      NewDeliveryRequest deliveryRequest) async {
    return await controller.createDeliveryRequest(deliveryRequest);
  }

  // 
  // getDeliveryRequest
  /// @Param [int] id - The delivery request id
  /// @Return new [DeliveryRequest] Object
  
  @override
  Future<DeliveryRequest> getDeliveryRequest(int id) async {
    return await controller.getDeliveryRequest(id);
  }

  
  // getDeliveryRequests
  /// Return a list [List] of all [DeliveryRequest] for the account

  @override
  Future<List<DeliveryRequest>> getDeliveryRequests() async {
    return await controller.getDeliveryRequests();
  }
}
