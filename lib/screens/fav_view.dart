import 'package:flutter/material.dart';

class FavView extends StatefulWidget {
  List favItems = [];
  FavView({super.key, required this.favItems});

  @override
  State<FavView> createState() => _FavViewState();
}

class _FavViewState extends State<FavView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: widget.favItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.favItems[index]['name']),
            subtitle: Text('${widget.favItems[index]['price']}'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete_outline),
            ),
          );
        },
      ),
    );
  }
}
