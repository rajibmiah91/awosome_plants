import 'package:cart_ui/pages/home_page.dart';
import 'package:cart_ui/pages/my_cart.dart';
import 'package:cart_ui/providers/item_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
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
      body: Container(
        color: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
             Row(
               children: [
                 Text("User Name", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                 SizedBox(width: 20,),
                 Text(": rajib22", style: TextStyle(fontSize: 20),),
               ],
             ),
             Divider(thickness: 2, color: Colors.black26,),
             Row(children: [
                 Text("E-mail", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                 SizedBox(width: 20,),
                 Text(": miahrajib001@gmail.com", style: TextStyle(fontSize: 20),),
               ],),
               Divider(thickness: 2, color: Colors.black26,),
             Row(
               children: [
                 Text("Profile Photo:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                 SizedBox(width: 20,),
                 CircleAvatar(radius: 50,child: Image.asset("assets/images/82119.jpg", height: 80, width: 100,)),
               ],
             ),
             Divider(thickness: 2, color: Colors.black26,),
             Row(
               children: [
                 Text("Phone Number", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                 SizedBox(width: 20,),
                 Text(": +8801716888659", style: TextStyle(fontSize: 20),)
               ],
             ),
             Divider(thickness: 2, color: Colors.black26,), 
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