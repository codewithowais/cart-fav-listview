import 'package:flutter/material.dart';
import 'package:newapp1/data/products.dart';
import 'package:newapp1/screens/cart_view.dart';
import 'package:newapp1/screens/fav_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List cartItems = [];
  List favItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cartItems.length.toString()),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartView(
                    items: cartItems,
                  ),
                ),
              );
              setState(() {});
            },
            icon: const Icon(Icons.shop),
          ),
          IconButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavView(
                    favItems: favItems,
                  ),
                ),
              );
              setState(() {});
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]['name']),
            subtitle: Text('${products[index]['price']}'),
            trailing: Wrap(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (products[index]['isFav']) {
                        products[index]['isFav'] = false;
                        favItems.remove(products[index]);
                      } else {
                        products[index]['isFav'] = true;
                        favItems.add(products[index]);
                      }
                    });
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: products[index]['isFav'] ? Colors.red : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      cartItems.add(products[index]);
                    });
                    print(cartItems);
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
