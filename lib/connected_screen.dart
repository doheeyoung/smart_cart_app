import 'package:flutter/material.dart';

class ConnectedScreen extends StatelessWidget {
  final String qrData;

  ConnectedScreen({required this.qrData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('연결 완료'),
      ),
      body: Center(
        child: Text(
          qrData.isNotEmpty ? 'QR 데이터: $qrData' : 'QR 코드 데이터를 받지 못했습니다.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
