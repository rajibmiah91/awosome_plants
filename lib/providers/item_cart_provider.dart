import 'package:cart_ui/model/cart_model.dart';
import 'package:cart_ui/model/item_card_model.dart';
import 'package:cart_ui/pages/categories/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:provider/provider.dart';

class ItemCartProvider with ChangeNotifier {
  final List<CartModel> _itemsINCart = [];
  List<CartModel> get itemsInCart => _itemsINCart;

  // Add Item in cart
  addItem(Product product) {
    for (var item in _itemsINCart) {
      if (product.name == item.name) {
        return;
      }
    }
    final CartModel addNewItem = CartModel(
      name: product.name,
      des: product.desc,
      image: product.imageUrl,
      price: product.price,
      quantity: 1,
    );
    _itemsINCart.add(addNewItem);
    notifyListeners();
  }

  // Remove Item from Cart
  removeItem(String prodName) {
    for (var item in _itemsINCart) {
      if (item.name == prodName) {
        _itemsINCart.remove(item);
        break;
      }
    }
    notifyListeners();
  }

  // Update Item for Cart
  updateItem(Product product) {
    for (var item in _itemsINCart) {
      if (item.name == product.name) {
        final CartModel updateItem = CartModel(
          name: product.name,
          des: product.desc,
          image: product.imageUrl,
          price: product.price,
          quantity: 1,
        );

        item = updateItem;
        break;
      }
    }
    notifyListeners();
  }

  addQuantity(int index) {
    _itemsINCart[index].quantity++;
    notifyListeners();
  }

  removeQuantity(int index) {
    if (_itemsINCart[index].quantity > 1) {
      _itemsINCart[index].quantity--;
    }
    notifyListeners();
  }

  removeAll() {
    _itemsINCart.clear();
    notifyListeners();
  }
}
