// @dart=2.9

// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:mpost/models/address.dart';
import 'package:mpost/models/deliveryRequest.dart';
import 'package:mpost/models/distance.dart';
import 'package:mpost/models/distanceRequest.dart';
import 'package:mpost/models/newDeliveryRequest.dart';
import 'package:mpost/models/place.dart';
import 'package:mpost/mpost.dart';
import 'package:mpost_example/constants.dart';
import 'package:mpost_example/helpers/MainAppAPI.dart';
import 'package:mpost_example/loader.dart';
import 'package:permission_handler/permission_handler.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:select_form_field/select_form_field.dart';

void main() {
  runApp(MyApp());
}

final mpost = Mpost("YOUR-MPOST-API-KEY");

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: const Text("SHIP WITH MPOST"),
            backgroundColor: HexColor("#013F7E"),
            bottom: const TabBar(
              tabs: [
                Tab(text: "New Delivery Request"),
                Tab(text: "Delivery Requests")
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              NewDeliveryRequestPage(),
              DeliveryRequestsPage(),
            ],
          )),
    );
  }
}

class NewDeliveryRequestPage extends StatefulWidget {
  const NewDeliveryRequestPage({Key key}) : super(key: key);

  @override
  State<NewDeliveryRequestPage> createState() => _NewDeliveryRequestPageState();
}

class _NewDeliveryRequestPageState extends State<NewDeliveryRequestPage> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _nairobi = CameraPosition(
    target: LatLng(-1.362863, 36.834583),
    zoom: 8,
  );
  Set<Marker> markersSet = {};

  String pickup_address = "Select Address";
  double pickupLatitude = 0;
  double pickupLongitude = 0;
  String delivery_address = "Select Address";
  double deliveryLatitude = 0;
  double deliveryLongitude = 0;

  Position currentPosition;

  GoogleMapController newGoogleMapController;

  //   location pin
  BitmapDescriptor locationPin;

  Loader loader;

  String deliveryDistance = "0";
  String rate = "0";
  String total = "0";

  List<LatLng> pLinesCoordinates = [];
  Set<Polyline> polyLineSet = {};
  Set<Circle> circlesSet = {};

  @override
  void initState() {
    setCustomMapPin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    loader = Loader(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MapLocationPicker(
                      apiKey: mapKey,
                      region: "ke",
                      canPopOnNextButtonTaped: true,
                      onNext: (GeocodingResult result) async {
                        if (result != null) {
                          setState(() {
                            delivery_address =
                                result.formattedAddress ?? "Select Address";

                            deliveryLatitude = result.geometry.location.lat;
                            deliveryLongitude = result.geometry.location.lng;
                          });
                        }
                      },
                      onSuggestionSelected:
                          (PlacesDetailsResponse result) async {
                        if (result != null) {
                          setState(
                            () {
                              pickup_address = result.result.formattedAddress ??
                                  "Select Address";
                              pickupLatitude =
                                  result.result.geometry.location.lat;
                              pickupLongitude =
                                  result.result.geometry.location.lng;
                            },
                          );
                        }
                      },
                    );
                  },
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: const Icon(
                  Icons.location_on_rounded,
                  color: Colors.red,
                  size: 40,
                ),
                title: const Text("Pickup Address"),
                subtitle: Text(pickup_address),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MapLocationPicker(
                      apiKey: mapKey,
                      region: "ke",
                      canPopOnNextButtonTaped: true,
                      onNext: (GeocodingResult result) async {
                        if (result != null) {
                          setState(() {
                            delivery_address =
                                result.formattedAddress ?? "Select Address";

                            deliveryLatitude = result.geometry.location.lat;
                            deliveryLongitude = result.geometry.location.lng;
                          });
                        }
                      },
                      onSuggestionSelected:
                          (PlacesDetailsResponse result) async {
                        if (result != null) {
                          setState(
                            () {
                              delivery_address =
                                  result.result.formattedAddress ??
                                      "Select Address";

                              deliveryLatitude =
                                  result.result.geometry.location.lat;
                              deliveryLongitude =
                                  result.result.geometry.location.lng;
                            },
                          );
                        }
                      },
                    );
                  },
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: const Icon(
                  Icons.location_on_rounded,
                  color: Colors.indigo,
                  size: 40,
                ),
                title: const Text("Delivery Address"),
                subtitle: Text(delivery_address),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Cost Calculations",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Distance"),
                        Text("${int.parse(deliveryDistance) / 1000} Km")
                      ],
                    ),
                  ),
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [const Text("Rate"), Text("$rate/km")],
                    ),
                  ),
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total"),
                        Text(
                          "Ksh $total",
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 270,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _nairobi,
                myLocationButtonEnabled: true,
                padding: const EdgeInsets.only(bottom: 50),
                markers: markersSet,
                polylines: polyLineSet,
                circles: circlesSet,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  newGoogleMapController = controller;
                  locatePosition();
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async {
                    if (allDataAvailable()) {
                      loader.showDialogue("Please wait...");
                      //calculate Distances
                      Place pickup_address = Place(
                          latitude: pickupLatitude, longitude: pickupLongitude);
                      Place delivery_address = Place(
                          latitude: deliveryLatitude,
                          longitude: deliveryLongitude);
                      DistanceRequest distanceRequest = DistanceRequest(
                          pickup_address: pickup_address,
                          delivery_address: delivery_address);
                      Distance distance =
                          await mpost.calculateDistance(distanceRequest);

                      setState(() {
                        deliveryDistance = distance.actual_distance.toString();
                        rate = distance.deliveryCost.per_km.toString();
                        total = distance.total_delivery_cost.toString();
                      });

                      getPlaceDirection(LatLng(pickupLatitude, pickupLongitude),
                          LatLng(deliveryLatitude, deliveryLongitude));
                    }
                  },
                  child: const Card(
                    color: Colors.indigo,
                    child: SizedBox(
                      width: 100,
                      height: 45,
                      child: Center(
                          child: Text(
                        "Calculate",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (int.parse(total) > 0) {
                      Address pickupAddress = Address(
                          latitude: pickupLatitude,
                          longitude: pickupLongitude,
                          address: pickup_address,
                          detailed_address: pickup_address);
                      Address deliveryAddress = Address(
                          latitude: deliveryLatitude,
                          longitude: deliveryLongitude,
                          address: delivery_address,
                          detailed_address: delivery_address);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipientsDetailsPage(
                            delivery_address: deliveryAddress,
                            pickup_address: pickupAddress,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Card(
                    color: Colors.green,
                    child: SizedBox(
                      width: 100,
                      height: 45,
                      child: Center(
                          child: Text(
                        "Proceed",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  setCustomMapPin() async {
    locationPin = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.5),
        'assets/icons/pin.png');
  }

  void locatePosition() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
    ].request();
    if (kDebugMode) {
      print(statuses[Permission.location]);
    }
    if (statuses[Permission.location].isDenied) {
      requestPermission(Permission.location);
    } else {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      currentPosition = position;

      setState(() {
        markersSet.add(
          Marker(
              markerId: const MarkerId("client"),
              position: LatLng(position.latitude, position.longitude),
              anchor: const Offset(0, 0.85),
              infoWindow: const InfoWindow(
                  title: "Home Address", snippet: "Current Location"),
              icon: locationPin),
        );
      });

      LatLng latLngPosition = LatLng(position.latitude, position.longitude);
      CameraPosition cameraPosition =
          CameraPosition(target: latLngPosition, zoom: 16);
      newGoogleMapController
          .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    }
  }

  Future<void> requestPermission(Permission permission) async {
    await permission.request();
  }

  bool allDataAvailable() {
    if (pickup_address != "Select Address" &&
        delivery_address != "Select Address") {
      if (kDebugMode) {
        print("All Data Is Availabe****************");
      }
      return true;
    } else {
      if (kDebugMode) {
        print("Some Data Is Null****************");
      }
      return false;
    }
  }

  void getPlaceDirection(LatLng pickupAddress, LatLng deliveryAddress) async {
    var details = await MainAppAPI.obtainPlaceDirectionDetails(
        pickupAddress, deliveryAddress);

    // ignore: use_build_context_synchronously
    Navigator.of(
      context,
    ).pop();
    pLinesCoordinates.clear();
    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> decodedPolylinePointsResults =
        polylinePoints.decodePolyline(details.encodedPoints);
    if (decodedPolylinePointsResults.isNotEmpty) {
      for (var pointLatLng in decodedPolylinePointsResults) {
        pLinesCoordinates
            .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      }
    }
    polyLineSet.clear();
    setState(() {
      Polyline polyline = Polyline(
        color: Colors.indigo,
        polylineId: const PolylineId("PolylineID"),
        jointType: JointType.round,
        points: pLinesCoordinates,
        width: 5,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        geodesic: true,
      );

      polyLineSet.add(polyline);
    });

    LatLngBounds latLngBounds;

    if (pickupAddress.latitude > deliveryAddress.latitude &&
        pickupAddress.longitude > deliveryAddress.longitude) {
      latLngBounds =
          LatLngBounds(southwest: deliveryAddress, northeast: pickupAddress);
    } else if (pickupAddress.longitude > deliveryAddress.longitude) {
      latLngBounds = LatLngBounds(
          southwest: LatLng(pickupAddress.latitude, deliveryAddress.longitude),
          northeast: LatLng(deliveryAddress.latitude, pickupAddress.longitude));
    } else if (pickupAddress.latitude > deliveryAddress.latitude) {
      latLngBounds = LatLngBounds(
          southwest: LatLng(deliveryAddress.latitude, pickupAddress.longitude),
          northeast: LatLng(pickupAddress.latitude, deliveryAddress.longitude));
    } else {
      latLngBounds =
          LatLngBounds(southwest: pickupAddress, northeast: deliveryAddress);
    }

    newGoogleMapController
        .animateCamera(CameraUpdate.newLatLngBounds(latLngBounds, 70));

    Marker pickUpLocationMarker = Marker(
      markerId: const MarkerId("originId"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: pickupAddress,
      infoWindow: InfoWindow(title: pickup_address, snippet: "Pickup Address"),
    );

    Marker dropOffLocationMarker = Marker(
      markerId: const MarkerId("deliveryAddress"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      position: deliveryAddress,
      infoWindow:
          InfoWindow(title: delivery_address, snippet: " Delivery Address"),
    );

    setState(() {
      markersSet.add(pickUpLocationMarker);
      markersSet.add(dropOffLocationMarker);
    });

    Circle pickUpCircle = Circle(
      circleId: const CircleId("originId"),
      fillColor: Colors.blueAccent,
      center: pickupAddress,
      radius: 12,
      strokeWidth: 4,
      strokeColor: Colors.blueAccent,
    );

    Circle dropOffCircle = Circle(
      circleId: const CircleId("pickupId"),
      fillColor: Colors.deepPurple,
      center: pickupAddress,
      radius: 12,
      strokeWidth: 4,
      strokeColor: Colors.deepPurple,
    );

    setState(() {
      circlesSet.add(pickUpCircle);
      circlesSet.add(dropOffCircle);
    });
  }
}

class DeliveryRequestsPage extends StatefulWidget {
  const DeliveryRequestsPage({Key key}) : super(key: key);

  @override
  State<DeliveryRequestsPage> createState() => _DeliveryRequestsPageState();
}

class _DeliveryRequestsPageState extends State<DeliveryRequestsPage> {
  List<DeliveryRequest> deliveryRequests = [];

  @override
  void initState() {
    loadDeliveryRequests();
    super.initState();
  }

  loadDeliveryRequests() async {
    deliveryRequests = await mpost.getDeliveryRequests();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: deliveryRequests.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "#ID:${deliveryRequests[index].id}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.location_on,
                    color: Colors.red,
                  ),
                  title: const Text("Pickup Address"),
                  subtitle: Text(deliveryRequests[index].pickupAddress.address),
                  trailing: Text(
                    getFormattedDate(deliveryRequests[index].created_at),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.location_on,
                    color: Colors.indigo,
                  ),
                  title: const Text("Delivery Address"),
                  subtitle:
                      Text(deliveryRequests[index].deliveryAddress.address),
                  trailing: Text(
                    deliveryRequests[index].status.name,
                    style: const TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
          );
        });
  }

  /// Get date as a string for display.
  String getFormattedDate(String date) {
    /// Convert into local date format.
    var localDate = DateTime.parse(date).toLocal();

    /// inputFormat - format getting from api or other func.
    /// e.g If 2021-05-27 9:34:12.781341 then format must be yyyy-MM-dd HH:mm
    /// If 27/05/2021 9:34:12.781341 then format must be dd/MM/yyyy HH:mm
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(localDate.toString());

    /// outputFormat - convert into format you want to show.
    var outputFormat = DateFormat('dd-MM-yyyy HH:mm');
    var outputDate = outputFormat.format(inputDate);

    return outputDate.toString();
  }
}

class RecipientsDetailsPage extends StatefulWidget {
  Address delivery_address;
  Address pickup_address;
  RecipientsDetailsPage({Key key, this.delivery_address, this.pickup_address})
      : super(key: key);

  @override
  State<RecipientsDetailsPage> createState() => _RecipientsDetailsPageState();
}

class _RecipientsDetailsPageState extends State<RecipientsDetailsPage> {
  String name = "";
  String phone = "";
  String note = "";
  String itemType = "";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Loader loader;

  final List<Map<String, dynamic>> items = [
    {
      'value': 'Food',
      'label': 'Food',
    },
    {
      'value': 'Documents',
      'label': 'Documents',
    },
    {
      'value': 'Clothing',
      'label': 'Clothing',
    },
    {
      'value': 'Electronics',
      'label': 'Electronics',
    },
    {
      'value': 'Fragile',
      'label': 'Fragile',
    },
    {
      'value': 'Other',
      'label': 'Other',
    }
  ];
  @override
  Widget build(BuildContext context) {
    loader = Loader(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("#013F7E"),
          title: const Text("Delivery Details"),
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Text(
                    "Enter the recipients details to complete your delivery request",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    color: Colors.white,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: getRequiredLabel("Recipient Name"),
                        border: const OutlineInputBorder(),
                      ),
                      onChanged: (value) => name = value,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter recipient name";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.white,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: getRequiredLabel("Recipient Phone"),
                        border: const OutlineInputBorder(),
                      ),
                      onChanged: (value) => phone = value,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter recipient phone";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.white,
                    child: SelectFormField(
                      decoration: const InputDecoration(
                        hintText: "Item Type",
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(fontSize: 15),
                      ),
                      items: items,
                      onChanged: (val) {
                        setState(() {
                          itemType = val;
                        });
                      },
                      onSaved: (val) => print(val),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.white,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Note to Rider',
                      ),
                      onChanged: (value) => note = value,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (formKey.currentState.validate()) {
                        loader.showDialogue("Please wait...");
                        NewDeliveryRequest newDeliveryRequest =
                            NewDeliveryRequest(
                                delivery_address: widget.delivery_address,
                                pickup_address: widget.pickup_address,
                                item_type: itemType,
                                recipient_mobile: phone,
                                pickup_time: '2022-08-20 11:11:00',
                                recipient_name: name);

                        DeliveryRequest deliveryRequest = await mpost
                            .createDeliveryRequest(newDeliveryRequest);
                        loader.hideDialogue();
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 50),
                      width: MediaQuery.of(context).size.width,
                      height: 65,
                      decoration: BoxDecoration(
                          color: HexColor("#013F7E"),
                          borderRadius: BorderRadius.circular(5)),
                      child: const Center(
                        child: Text(
                          "Request Delivery",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  RichText getRequiredLabel(String fieldName) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black87, fontSize: 16),
        text: fieldName,
        children: const [
          TextSpan(
            text: '*',
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    );
  }
}
