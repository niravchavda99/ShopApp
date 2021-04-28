import 'package:flutter/cupertino.dart';
import 'package:shop_app/models/CartItem.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  Future<void> addItem({String productId, double price, int qty = 1}) async {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          price: existingCartItem.price,
          qty: existingCartItem.qty + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          price: price,
          qty: 1,
        ),
      );
    }
    notifyListeners();
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, item) => total += item.price * item.qty);
    return total;
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) return;
    if (_items[productId].qty > 1)
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          price: existingCartItem.price,
          qty: existingCartItem.qty - 1,
        ),
      );
    else
      _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
