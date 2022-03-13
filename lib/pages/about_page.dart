import 'package:cart_ui/pages/home_page.dart';
import 'package:cart_ui/pages/my_cart.dart';
import 'package:cart_ui/providers/item_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("About Us"),
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          alignment: Alignment.center,
          color: Colors.black12,
          child: Column(
            children: [
              Text("Hello, Welcome to our shop. We are the best plant seller and supplier in your city Since last years. If you are looking for a trusted supplier for Oriental plants then you have the right choice to relate with us. ----With Best Regards from Our Dedicated Team.", style: TextStyle(fontSize: 20),)
            ],
          ),
        ),
      ),
       floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
                       return GridViewHome();
                     }));
      },child: Icon(Icons.home), elevation: 10,),
    );
  }
}