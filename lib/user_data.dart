import 'package:flutter/material.dart';

class UserData extends ChangeNotifier {
  String _qrData = '';

  String get qrData => _qrData;

  void setQRData(String qrData) {
    _qrData = qrData;
    notifyListeners();
  }
}
