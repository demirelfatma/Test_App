import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:project_adi/view/home/service/home_service.dart';

class HomeViewModel extends ChangeNotifier {
  double xValue = 0.0;
  double yValue = 12.0;
  double zValue = 0.0;
  DateTime time = DateTime.now();
  bool isRecording = false;

   void updateSensorValues(double x, double y, double z) {
    xValue = x;
    yValue = y;
    zValue = z;
    notifyListeners();
  }

Future<List<Map<String, dynamic>>> getVibrationData() async {
  List<Map<String, dynamic>> data = [];

  CollectionReference vibrationRef = FirebaseFirestore.instance.collection("vibration_data");

  // Firestore'dan verileri çek
  QuerySnapshot querySnapshot = await vibrationRef.orderBy('timestamp').get();

  // ignore: avoid_function_literals_in_foreach_calls
  querySnapshot.docs.forEach((doc) {
    data.add({
      'x': doc['x'],
      'y': doc['y'],
      'z': doc['z'],
      'timestamp': doc['timestamp'].toDate(),
    });
  });

  return data;
}


  final SensorService sensorService = SensorService();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // FirebaseAuth örneğini oluşturun
  // ignore: prefer_final_fields
  FirebaseAuth _auth = FirebaseAuth.instance;
  late User? mevcutKullanici;

  HomeViewModel() {
    initializeCurrentUser();
  }

  // ignore: prefer_final_fields
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _currentUser;

  Future<void> initializeCurrentUser() async {
    _currentUser = _auth.currentUser;
    if (_currentUser != null) {
      // Diğer kullanıcı bilgilerini buraya ekleyebilirsiniz
    } else {
    }
    notifyListeners();
  }

   Future<void> signOut() async {
    try {
      await _auth.signOut();
      exit(0);
    // ignore: empty_catches
    } catch (e) {
    }
  }

  Future<void> addVibrationData(UserAccelerometerEvent event) async {
    if (_currentUser != null) {
      double xValue = event.x.abs();
      double yValue = event.y.abs();
      double zValue = event.z.abs();
      
      DateTime time = DateTime.now();
      
      CollectionReference vibrationRef =
          _firestore.collection("vibration_data");

      await vibrationRef.add({
        'userId': _currentUser!.uid,
        'x': xValue,
        'y': yValue,
        'z': zValue,
        'timestamp': time,
      });
    } else {
    }
  }

  Future<List<Map<String, dynamic>>> getUserVibrationData(String userId) async {
    List<Map<String, dynamic>> data = [];

    CollectionReference vibrationRef = _firestore.collection("vibration_data");

    QuerySnapshot querySnapshot = await vibrationRef
        .where('userId', isEqualTo: userId)
        .orderBy('timestamp')
        .get();

    // ignore: avoid_function_literals_in_foreach_calls
    querySnapshot.docs.forEach((doc) {
      data.add({
        'x': doc['x'],
        'y': doc['y'],
        'z': doc['z'],
        'timestamp': doc['timestamp'].toDate(),
      });
    });
     return data;
  }

  Future<void> deleteAllUserVibrationData() async {
  if (_currentUser != null) {
    CollectionReference vibrationRef = _firestore.collection("vibration_data");

    QuerySnapshot querySnapshot = await vibrationRef
        .where('userId', isEqualTo: _currentUser!.uid)
        .get();

    List<QueryDocumentSnapshot> documents = querySnapshot.docs;

    for (QueryDocumentSnapshot doc in documents) {
      await doc.reference.delete();
    }

  } else {
  }
}


  void startRecording() {
    isRecording = true;
    sensorService.startListeningToAccelerometer(onSensorData);
    notifyListeners();
  }

  void stopRecording() {
    isRecording = false;
    sensorService.stopListeningToAccelerometer();
    notifyListeners();
  }


  void onSensorData(UserAccelerometerEvent event) {
    if (isRecording) {
      addVibrationData(event);
    }
  }
}