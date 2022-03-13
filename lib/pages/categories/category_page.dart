import 'package:cart_ui/pages/categories/in_house_items.dart';
import 'package:cart_ui/pages/categories/roof_top_items.dart';
import 'package:cart_ui/pages/categories/bonsie_plants.dart';
import 'package:cart_ui/pages/home_page.dart';
import 'package:cart_ui/pages/my_cart.dart';
import 'package:cart_ui/providers/item_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("All Categories"),
        backgroundColor: Colors.green,
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
      ),

    body: Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 350, 
              width: 300,
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
                children: [
                  ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Bonsie();
                    }));
            }, child: Text("Bonsie")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return InHouseItems();
                    }));
            }, child: Text("inhouse Items")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return RoofTopItems();
                    }));
            }, child: Text("Rooftop Items")),
            
                ],
                )
            )
          ],
    ),
      )
    ,

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