import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  List items = [];
  CartView({super.key, required this.items});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.items[index]['name']),
            subtitle: Text('${widget.items[index]['price']}'),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  widget.items.removeAt(index);
                });
              },
              icon: const Icon(Icons.delete_outline),
            ),
          );
        },
      ),
    );
  }
}
