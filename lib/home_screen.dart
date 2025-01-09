import 'package:flutter/material.dart';
import 'qr_code_screen.dart'; // QR 코드 화면 import

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Cart App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 이미지 추가
            Image.asset(
              'assets/wheelchair_cart.png', // assets 폴더에 이미지 추가 필요
              height: 200,
              width: 200,
            ),
            SizedBox(height: 20),
            // 쇼핑 시작 버튼
            ElevatedButton(
              onPressed: () {
                // QR 코드 화면으로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRCodeScreen()),
                );
              },
              child: Text('쇼핑 시작'),
            ),
          ],
        ),
      ),
    );
  }
}
