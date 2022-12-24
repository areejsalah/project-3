import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/models/product_model.dart';

import '../../data_repositores/firestore_helper.dart';

class CartProvider extends ChangeNotifier {
  List<Product>? cartProducts;
  getAllCartProducts(String userId) async {
    cartProducts = null;
    notifyListeners();
    List<Product>? products =
        await FirestoreHelper.firestoreHelper.getAllCartProducts(userId);

    cartProducts = products;
    notifyListeners();
  }

  addToCart(Product product) {}
}
