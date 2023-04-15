library myprij.conn;
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
bool internetConnected = false;
final _connectivity = Connectivity();
StreamSubscription? connectivitySubscription;


Future<bool> isInternetConnected() async {
  final connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
    internetConnected = true;
  } else if (connectivityResult == ConnectivityResult.none) {
    internetConnected = false;
  }
  else{
    internetConnected = false;
  }
  return internetConnected;
}

bool internetConnectionListener(){
  connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
    if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
      internetConnected = true;
    }
    else {
      internetConnected = false;
    }
  });
  return internetConnected;
}