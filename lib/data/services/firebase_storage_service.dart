import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TFirebaseStorageService extends GetxController {
  static TFirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  // upload local assets from IDE
 //return a  Uint8list containing image data
Future<Uint8List> getImageDataFromAssets(String path) async {
  try {
    final byteData = await rootBundle.load(path);
    final imageData = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
    return imageData;
  } catch(e) {
    // handle exceptions gracefully
    throw 'Error loading image data: $e';
  }
}

// upload image using imageData on cloudFirebase storage
// return the download url of the upload image
Future<String> uploadImageData(String path, Uint8List image, String name) async {
  try {
    final ref = _firebaseStorage.ref(path).child(name);
    await ref.putData(image);
    final url = await ref.getDownloadURL();
    return url;
  } catch (e) {
    // handle exception gracefully
    if(e is FirebaseException) {
      throw 'Firebase exception: ${e.message}';
    } else if(e is SocketException) {
      throw 'Network error: ${e.message}';
    } else if(e is PlatformException) {
      throw 'Platform exception: ${e.message}';
    } else {
      throw "Something went wrong! Please try again.";
    }
  }
}

// upload image on cloud firebase storage
// returns the download url of the download image
Future<String> uploadImageFile(String path, XFile image) async {
  try {
    final ref = _firebaseStorage.ref(path).child(image.name);
    await ref.putFile(File(image.path));
    final url = await ref.getDownloadURL();
    return url;
  } catch (e) {
    // handle exception gracefully
    if(e is FirebaseException) {
      throw 'Firebase exception: ${e.message}';
    } else if(e is SocketException) {
      throw 'Network error: ${e.message}';
    } else if(e is PlatformException) {
      throw 'Platform exception: ${e.message}';
    } else {
      throw "Something went wrong! Please try again.";
    }
  }
}

}