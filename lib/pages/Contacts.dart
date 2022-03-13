import 'package:cart_ui/pages/home_page.dart';
import 'package:cart_ui/pages/my_cart.dart';
import 'package:cart_ui/providers/item_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Contacts extends StatelessWidget {
  const Contacts({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Contacts"),
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
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.black12,
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                color: Colors.amber,
                child: Text("For more Information or any Query Please Contact to the followings",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){}, child: Text("Call", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){}, child: Text("e-Mail", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){}, child: Text("WhatsApp", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){}, child: Text("Telegram", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){}, child: Text("Skype", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
              SizedBox(height: 20,),
              Container(
                alignment: Alignment.center,
                color: Colors.teal,
                child: Text("Follow us on Social media and Get Updates from us",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),),
              ),
              SizedBox(height: 20,),
              ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.facebook, size: 25,), label: Text("Facebook", textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold))),
              
            ],
            )
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