import 'package:flutter/material.dart';

class ItemDetailPage extends StatelessWidget {
  final int itemNumber;
  final int quantity;

  const ItemDetailPage(this.itemNumber, this.quantity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Detail'),
      ),
      body: Center(
        child: Text("Item $itemNumber count = $quantity"),
      ),
    );
  }
}
