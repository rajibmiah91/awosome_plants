import 'package:cart_ui/model/cart_model.dart';
import 'package:cart_ui/pages/home_page.dart';
import 'package:cart_ui/pages/order_page.dart';
import 'package:cart_ui/providers/item_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class MyCart extends StatelessWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Your Cart"),
        backgroundColor: Colors.green,
        
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.black12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: context.watch<ItemCartProvider>().itemsInCart.isEmpty
                      ? const Center(
                          child: Text("You have no item in your cart"),
                        )
                      : Consumer<ItemCartProvider>(
                          builder: (context, prov, child) => ListView.builder(
                            itemBuilder: (context, index) {
                              CartModel product = context
                                  .read<ItemCartProvider>()
                                  .itemsInCart[index];
                              return Card(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            color: Colors.black,
                                          ),
                                          child: Image.asset(
                                            product.image,
                                            height: 100,
                                            width: 100,
                                          )),
                                    ),
                                    Column(
                                      children: [
                                        Text(product.name),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        Text(product.price),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            FloatingActionButton(
                                              mini: true,
                                              heroTag: UniqueKey(),
                                              onPressed: () {
                                                context
                                                    .read<ItemCartProvider>()
                                                    .removeQuantity(index);
                                              },
                                              child: const Icon(Icons.remove),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Text(
                                                context
                                                    .watch<ItemCartProvider>()
                                                    .itemsInCart[index]
                                                    .quantity
                                                    .toString(),
                                              ),
                                            ),
                                            FloatingActionButton(
                                              mini: true,
                                              heroTag: UniqueKey(),
                                              onPressed: () {
                                                context
                                                    .read<ItemCartProvider>()
                                                    .addQuantity(index);
                                              },
                                              child: const Icon(Icons.add),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        context
                                            .read<ItemCartProvider>()
                                            .removeItem(product.name);
                                      },
                                      icon: const Icon(Icons.delete),
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: context
                                .read<ItemCartProvider>()
                                .itemsInCart
                                .length,
                          ),
                        ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return GridViewHome();
                        }));
                      },
                      child: Text("Edit Cart"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ItemCartProvider>().removeAll();
                      },
                      child: Text("Delete All Items"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return OrderPage();
                        }));
                      },
                      child: Text("Confirm Order"),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
