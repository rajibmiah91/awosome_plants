import 'package:cart_ui/model/item_card_model.dart';
import 'package:cart_ui/pages/home_page.dart';
import 'package:cart_ui/providers/item_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Image.asset(
              product.imageUrl,
              height: 300,
              width: 300,
            ),
            Text(product.desc),
            ElevatedButton.icon(
                onPressed: () {
                  context.read<ItemCartProvider>().addItem(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${product.name} add to your cart")),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
                label: const Text("Add to Cart"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return GridViewHome();
          }));
        },
        child: Icon(Icons.home),
        elevation: 10,
      ),
    );
  }
}
