import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/auth/models/app_user.dart';

import '../admin/models/category_model.dart';
import '../admin/models/product_model.dart';
import '../admin/models/slider_model.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  addNewUser(AppUser appUser) async {
    firestore.collection('users').doc(appUser.id).set(appUser.toMap());
  }

  Future<AppUser> getUserFromFirestore(String id) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await firestore.collection('users').doc(id).get();
    Map<String, dynamic>? data = documentSnapshot.data();
    AppUser appUser = AppUser.fromMap(data ?? {});
    return appUser;
  }

  // admin methods
  Future<String?> addNewCategory(Category category) async {
    try {
      DocumentReference<Map<String, dynamic>> categoryDocument =
          await firestore.collection('categories').add(category.toMap());

      return categoryDocument.id;
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<String?> addToCart(Product product) async {
    try {
      DocumentReference<Map<String, dynamic>> documentReference =
          await firestore
              .collection('users')
              .doc(product.catId)
              .collection('cart')
              .add(product.toMap());
      return documentReference.id;
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<List<Product>?> getAllCartProducts(String userId) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
        .collection('users')
        .doc(userId)
        .collection('cart')
        .get();
    return querySnapshot.docs.map((e) {
      Product product = Product.fromMap(e.data());
      product.id = e.id;
      return product;
    }).toList();
  }

  Future<bool> deleteFromCart(String prodId) async {
    try {
      await firestore.collection('cart').doc(prodId).delete();
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> deleteCategoey(String catId) async {
    try {
      await firestore.collection('categories').doc(catId).delete();
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<List<Category>?> getAllCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> catsSnapshot =
          await firestore.collection('categories').get();
      List<Category> categories = catsSnapshot.docs.map((doc) {
        Category category = Category.fromMap(doc.data());
        category.id = doc.id;
        return category;
      }).toList();
      return categories;
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<bool?> updateCategory(Category category) async {
    try {
      await firestore
          .collection('categories')
          .doc(category.id)
          .update(category.toMap());
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  /// products functions
  Future<bool?> updateProduct(Product product) async {
    try {
      await firestore
          .collection('categories')
          .doc(product.catId)
          .collection('products')
          .doc(product.id)
          .update(product.toMap());
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<String?> addNewProduct(Product product) async {
    try {
      DocumentReference<Map<String, dynamic>> documentReference =
          await firestore
              .collection('categories')
              .doc(product.catId)
              .collection('products')
              .add(product.toMap());
      return documentReference.id;
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<List<Product>?> getAllProducts(String catId) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
        .collection('categories')
        .doc(catId)
        .collection('products')
        .get();
    return querySnapshot.docs.map((e) {
      Product product = Product.fromMap(e.data());
      product.id = e.id;
      return product;
    }).toList();
  }

  Future<bool> deleteProduct(String prodId) async {
    try {
      await firestore.collection('products').doc(prodId).delete();
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

// slider methods
  Future<String?> addNewSlider(Slider slider) async {
    try {
      DocumentReference<Map<String, dynamic>> documentReference =
          await firestore.collection('sliders').add(slider.toMap());
      return documentReference.id;
    } on Exception catch (e) {
      return null;
    }
  }

  Future<List<Slider>?> getAllSliders() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection('sliders').get();
    return querySnapshot.docs.map((e) {
      Slider slider = Slider.fromMap(e.data());
      slider.id = e.id;
      return slider;
    }).toList();
  }

  Future<bool> deleteSlider(String sliderId) async {
    try {
      await firestore.collection('sliders').doc(sliderId).delete();
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool?> updateSlider(Slider slider) async {
    try {
      await firestore
          .collection('sliders')
          .doc(slider.id)
          .update(slider.toMap());
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }
}
