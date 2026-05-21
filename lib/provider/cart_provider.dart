import 'package:flutter/material.dart';
import 'package:project_api/model/product.dart';

class CartProvider extends ChangeNotifier {
  List<Product> cartItem = [];
  // add product to cart
  void addToCart(Product pro) {
    cartItem.add(
      Product(
        id: pro.id,
        name: pro.name,
        price: pro.price,
        image: pro.image,
        desciption: pro.desciption,
        category: pro.category,
        stock: pro.stock,
        specs: pro.specs,
      ),
    );
    notifyListeners();
  }

  void increment(int index) {
    cartItem[index].stock = cartItem[index].stock + 1;
    notifyListeners();
  }

  // decrement
  void decrement(int index) {
    cartItem[index].stock = cartItem[index].stock - 1;
    if (cartItem[index].stock == 0) {
      cartItem.removeAt(index);
    }
    notifyListeners();
  }
  // total
  double total(){
    double sum = 0;
    for(int i=0;i<cartItem.length;i++){
       sum += cartItem[i].stock*cartItem[i].price;
    }
    return sum;
  }
}
