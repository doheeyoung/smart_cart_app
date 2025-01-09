import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'user_data.dart';
import 'connected_screen.dart';

class QRCodeScreen extends StatefulWidget {
  @override
  _QRCodeScreenState createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR 코드 스캔'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: (controller) {
                this.controller = controller;
                controller.scannedDataStream.listen((scanData) {
                  if (scanData.code == null || scanData.code!.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('QR 코드를 스캔하지 못했습니다. 다시 시도해주세요.')),
                    );
                    return;
                  }
                  Provider.of<UserData>(context, listen: false)
                      .setQRData(scanData.code!);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ConnectedScreen(qrData: scanData.code!),
                    ),
                  );
                });
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text('QR 코드를 카메라에 맞춰주세요'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
