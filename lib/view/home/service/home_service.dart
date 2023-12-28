
import 'dart:async';

import 'package:sensors_plus/sensors_plus.dart';

class SensorService {
  StreamSubscription<UserAccelerometerEvent>? _accelerometerSubscription;

  void startListeningToAccelerometer(void Function(UserAccelerometerEvent) onSensorData) {
    // ignore: prefer_conditional_assignment
    if (_accelerometerSubscription == null) {
      _accelerometerSubscription = userAccelerometerEvents.listen((event) {
        onSensorData(event);
      });
    }
  }

  void stopListeningToAccelerometer() {
    _accelerometerSubscription?.cancel();
    _accelerometerSubscription = null;
  }
}

