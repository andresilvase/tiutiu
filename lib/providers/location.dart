import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';

class Location with ChangeNotifier {
  final _permission = BehaviorSubject<LocationPermission>();
  final _location = BehaviorSubject<LatLng>();
  final _locationServiceEnabled = BehaviorSubject<bool>();
  final _canContinue = BehaviorSubject<bool>.seeded(false);

  Stream<LatLng> get location => _location.stream;
  Stream<LocationPermission> get permission => _permission.stream;
  Stream<bool> get locationServiceEnabled => _locationServiceEnabled.stream;
  Stream<bool> get canContinue => _canContinue.stream;

  void Function(LocationPermission) get changePermission =>
      _permission.sink.add;
  void Function(LatLng) get changeLocation => _location.sink.add;
  void Function(bool) get changeLocationServiceEnabled =>
      _locationServiceEnabled.sink.add;
  void Function(bool) get changeCanContinue => _canContinue.sink.add;

  LocationPermission get getPermission => _permission.stream.value;
  LatLng get getLocation => _location.stream.value;
  bool get getLocationServiceEnabled => _locationServiceEnabled.stream.value;
  bool get getCanContinue => _canContinue.stream.value;

  Future<void> permissionCheck() async {
    // TODO: Ver depois como solicitar essa permissão de localização para o usuário!
    changePermission(LocationPermission.always);
  }

  Future<void> permissionRequest() async {
    // TODO: Ver depois como solicitar essa permissão de localização para o usuário!
    changePermission(LocationPermission.always);
  }

  Future<void> locationServiceIsEnabled() async {
    // TODO: Ver depois como solicitar essa permissão de localização para o usuário!
    // changeLocationServiceEnabled(await isLocationServiceEnabled());
  }

  Future<bool> openSeetings() async {
    // TODO: Ver depois como solicitar essa permissão de localização para o usuário!
    return true;
  }

  Future<bool> openLocalSettings() async {
    // TODO: Ver depois como solicitar essa permissão de localização para o usuário!
    return true;
  }

  Future<void> setLocation({LatLng? currentLocation}) async {
    var position;

    // TODO: Ver depois como solicitar essa permissão de localização para o usuário!
    if (currentLocation == null) {
      // position =
      // await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      changeLocation(LatLng(position.latitude, position.longitude));
    } else {
      changeLocation(currentLocation);
    }

    notifyListeners();
    return Future.value();
  }
}
