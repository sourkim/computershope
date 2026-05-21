import 'package:flutter/material.dart';
import 'package:project_api/model/product.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Product> favorite = [];

  void addToFavorite(Product product) {
    favorite.add(product);
    notifyListeners();
  }

  void removeFromFavorite(Product product) {
    favorite.removeWhere((item) => item.id == product.id);
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return favorite.any((item) => item.id == product.id);
  }

  void toggleFavorite(Product product) {
    if (isFavorite(product)) {
      removeFromFavorite(product);
    } else {
      addToFavorite(product);
    }
  }
}