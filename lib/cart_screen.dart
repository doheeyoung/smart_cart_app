import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // 장바구니 아이템 리스트
  List<String> cartItems = ['상품 1', '상품 2', '상품 3', '상품 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('장바구니'),
      ),
      body: Column(
        children: [
          // 장바구니 아이템 리스트
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cartItems[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // 삭제 버튼 클릭 시 확인 메시지 띄우기
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('삭제 확인'),
                          content: Text('${cartItems[index]}를 삭제하시겠습니까?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                // 삭제 취소
                                Navigator.of(context).pop();
                              },
                              child: Text('취소'),
                            ),
                            TextButton(
                              onPressed: () {
                                // 삭제 확인
                                setState(() {
                                  cartItems.removeAt(index);
                                });
                                Navigator.of(context).pop();
                              },
                              child: Text('삭제'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          // 결제하기 버튼
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                print('결제하기');
                // 결제 관련 로직 추가 가능
              },
              child: Text('결제하기'),
            ),
          ),
        ],
      ),
    );
  }
}
