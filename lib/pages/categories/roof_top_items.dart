import 'package:cart_ui/model/item_card_model.dart';
import 'package:cart_ui/pages/item_list.dart';
import 'package:cart_ui/pages/item_list1.dart';
import 'package:cart_ui/pages/my_cart.dart';
import 'package:cart_ui/pages/home_page.dart';
import 'package:cart_ui/pages/info_page.dart';
import 'package:cart_ui/providers/item_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoofTopItems extends StatefulWidget {
  const RoofTopItems({ Key? key }) : super(key: key);

  @override
  State<RoofTopItems> createState() => _RoofTopItemsState();
}

class _RoofTopItemsState extends State<RoofTopItems> {
   late List<Product> products;
  final itemList1 = RoofTopList().data;

  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    // print.call(itemList.toString());
    List item = itemList1['products'] as List;
    setState(() {
      products = item.map((e) => Product.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        centerTitle: true,
        title: Text("Roof Top Plants"),
        actions: [
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyCart();
                }));
              },
              child: Stack(children: <Widget>[
                const Icon(Icons.shopping_cart),
                Consumer<ItemCartProvider>(
                  builder: (context, prodivder, widget) => Positioned(
                    // draw a red marble
                    top: 0.0,
                    right: 0.0,
                    child: prodivder.itemsInCart.isEmpty
                        ? Container()
                        : Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: FittedBox(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(prodivder.itemsInCart.length.toString()),
                            )),
                          ),
                  ),
                )
              ]),
            ),
          ),
          SizedBox(
            width: 25,
          ),
        ],
        backgroundColor: Colors.green,
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          // child: _gridCount(context),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (_, index) => InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InfoPage(
                    product: products[index],
                  );
                }));
              },
              child: Card(
                elevation: 10,
                borderOnForeground: true,
                child: GridTile(
                  child: Image.asset(
                    products[index].imageUrl,
                  ),
                  footer: Text(products[index].name),
                  header: Text(
                    "${products[index].price}\$",
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ),
            itemCount: products.length,
          )),
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