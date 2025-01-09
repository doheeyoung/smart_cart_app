import 'package:flutter/material.dart';
import 'cart_screen.dart';

class ShoppingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('쇼핑 화면'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // 장바구니 화면으로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
              child: Text('장바구니'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('직원 호출');
              },
              child: Text('직원 호출'),
            ),
          ],
        ),
      ),
    );
  }
}
