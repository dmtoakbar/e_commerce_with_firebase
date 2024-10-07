import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce_project/utils/popup/loaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus =ConnectivityResult.none.obs;


  // initialize the network manager and set setup a stream to continually check the connection status

 @override
  void onInit() {
   super.onInit();
   _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

 }

 // update connection status based on change in connectivity and show a relevant popup for no internet connection
Future<void> _updateConnectionStatus(ConnectivityResult result) async {
   _connectionStatus.value = result;
   if(_connectionStatus.value == ConnectivityResult.none) {
    TLoaders.warningSnackBar(title: 'No Internet Connection');
   }
}

// check the internet connection status
// return true if connected false otherwise

Future<bool> isConnected() async {
   try {
     final result = await _connectivity.checkConnectivity();
     if(result == ConnectivityResult.none) {
       return false;
     } else {
       return true;
     }
   } on PlatformException catch(_) {
     return false;
   }
}

// dispose or close the activity connectivity stream
@override
  void onClose() {
   super.onClose();
   _connectivitySubscription.cancel();
}


}