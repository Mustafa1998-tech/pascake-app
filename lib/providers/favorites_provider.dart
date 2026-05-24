import 'package:flutter/foundation.dart';
import '../models/product.dart';

class FavoritesProvider with ChangeNotifier {
  final List<String> _favoriteIds = [];

  List<Product> getFavorites(List<Product> allProducts) {
    return allProducts.where((p) => _favoriteIds.contains(p.id)).toList();
  }

  bool isFavorite(String productId) => _favoriteIds.contains(productId);
  int get count => _favoriteIds.length;

  void toggle(Product product) {
    if (_favoriteIds.contains(product.id)) {
      _favoriteIds.remove(product.id);
    } else {
      _favoriteIds.add(product.id);
    }
    notifyListeners();
  }

  void remove(String productId) {
    _favoriteIds.remove(productId);
    notifyListeners();
  }
}
