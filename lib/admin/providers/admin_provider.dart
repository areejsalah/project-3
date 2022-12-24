import 'dart:io';
import 'package:flutter/material.dart' hide Slider;

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/admin/models/category_model.dart';
import 'package:flutter_application_1/admin/models/product_model.dart';
import 'package:flutter_application_1/admin/models/slider_model.dart';
import 'package:flutter_application_1/admin/views/screens/edit_product.dart';
import 'package:flutter_application_1/admin/views/screens/edit_slider.dart';
import 'package:flutter_application_1/app%20router/app_router.dart';
import 'package:flutter_application_1/data_repositores/firestore_helper.dart';
import 'package:flutter_application_1/data_repositores/storage_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:string_validator/string_validator.dart';

import '../views/screens/edit_category.dart';

class AdminProvider extends ChangeNotifier {
  AdminProvider() {
    getAllCategories();
    getAllSliders();
  }
  String? requiredValidation(String? content) {
    if (content == null || content.isEmpty) {
      return "Required field";
    }
  }

  String? phoneValidation(String content) {
    if (!(isNumeric(content))) {
      return 'In Correct Number Syntax';
    }
    return null;
  }

  PageController homePageController = PageController();
  File? imageFile;
  TextEditingController catNameArController = TextEditingController();
  TextEditingController catNameEnController = TextEditingController();
  GlobalKey<FormState> categoryFormKey = GlobalKey<FormState>();
  pickImageForCategory() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  addNewCategory() async {
    if (imageFile != null) {
      if (categoryFormKey.currentState!.validate()) {
        // add category process
        AppRouter.appRouter.showLoadingDialoug();
        String imageUrl = await StrorageHelper.strorageHelper
            .uploadNewImage("cats_images", imageFile!);
        Category category = Category(
            imageUrl: imageUrl,
            nameAr: catNameArController.text,
            nameEn: catNameEnController.text);

        String? id =
            await FirestoreHelper.firestoreHelper.addNewCategory(category);

        AppRouter.appRouter.hideDialoug();
        if (id != null) {
          category.id = id;
          allCategories!.add(category);
          notifyListeners();
          catNameArController.clear();
          catNameEnController.clear();
          imageFile = null;
          notifyListeners();
          AppRouter.appRouter
              .showCustomDialoug('Success', 'Your category has been added');
        }
      }
    } else {
      AppRouter.appRouter
          .showCustomDialoug('Error', 'You have to pick image first');
    }
  }

  // get cateogies
  List<Category>? allCategories;
  List<Product>? allProducts;
  List<Slider>? allSliders;
  List<Object> emptySliders = [];
  getAllCategories() async {
    allCategories = await FirestoreHelper.firestoreHelper.getAllCategories();
    notifyListeners();
  }

  // delete category
  deleteCategory(Category category) async {
    AppRouter.appRouter.showLoadingDialoug();
    bool deleteSuccess =
        await FirestoreHelper.firestoreHelper.deleteCategoey(category.id!);
    if (deleteSuccess) {
      allCategories!.remove(category);
      notifyListeners();
    }
    AppRouter.appRouter.hideDialoug();
  }

  goToEditCategoryPage(Category category) {
    catNameArController.text = category.nameAr;
    catNameEnController.text = category.nameEn;
    AppRouter.appRouter.goToWidget(EditCategory(category));
  }

  updateCategory(Category category) async {
    AppRouter.appRouter.showLoadingDialoug();
    if (imageFile != null) {
      String imageUrl = await StrorageHelper.strorageHelper
          .uploadNewImage("cats_images", imageFile!);
      category.imageUrl = imageUrl;
    }
    Category newCategory = Category(
        id: category.id,
        imageUrl: category.imageUrl,
        nameAr: catNameArController.text.isEmpty
            ? category.nameAr
            : catNameArController.text,
        nameEn: catNameEnController.text.isEmpty
            ? category.nameEn
            : catNameEnController.text);

    bool? isUpdated =
        await FirestoreHelper.firestoreHelper.updateCategory(newCategory);

    if (isUpdated != null && isUpdated) {
      int index = allCategories!.indexOf(category);
      allCategories![index] = newCategory;
      imageFile = null;
      catNameEnController.clear();
      catNameArController.clear();
      notifyListeners();
      AppRouter.appRouter.hideDialoug();
      AppRouter.appRouter.hideDialoug();
    }
  }

  TextEditingController sliderTitleController = TextEditingController();
  TextEditingController sliderUrlController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  GlobalKey<FormState> addProductKey = GlobalKey<FormState>();
  GlobalKey<FormState> addSliderKey = GlobalKey<FormState>();
  pickImageForProduct() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  addNewProduct(String catId) async {
    if (imageFile != null) {
      if (addProductKey.currentState!.validate()) {
        AppRouter.appRouter.showLoadingDialoug();
        String imageUrl = await StrorageHelper.strorageHelper
            .uploadNewImage("products_images", imageFile!);
        Product product = Product(
            imageUrl: imageUrl,
            name: productNameController.text,
            description: productDescriptionController.text,
            price: productPriceController.text,
            catId: catId);

        String? id =
            await FirestoreHelper.firestoreHelper.addNewProduct(product);

        AppRouter.appRouter.hideDialoug();
        if (id != null) {
          product.id = id;
          allProducts?.add(product);
          notifyListeners();
          productNameController.clear();
          productDescriptionController.clear();
          productPriceController.clear();
          imageFile = null;
          notifyListeners();
          AppRouter.appRouter
              .showCustomDialoug('Success', 'Your Product has been added');
        }
      }
    } else {
      AppRouter.appRouter
          .showCustomDialoug('Error', 'You have to pick image first');
    }
  }

  getAllProducts(String catId) async {
    allProducts = null;
    notifyListeners();
    List<Product>? products =
        await FirestoreHelper.firestoreHelper.getAllProducts(catId);

    allProducts = products;
    notifyListeners();
  }

  deleteProduct(Product product) async {
    AppRouter.appRouter.showLoadingDialoug();
    bool deleteSuccess =
        await FirestoreHelper.firestoreHelper.deleteProduct(product.id!);
    if (deleteSuccess) {
      allProducts!.remove(product);
      notifyListeners();
    }
    AppRouter.appRouter.hideDialoug();
  }

  updateProduct(Product product) async {
    AppRouter.appRouter.showLoadingDialoug();
    if (imageFile != null) {
      String imageUrl = await StrorageHelper.strorageHelper
          .uploadNewImage("products_images", imageFile!);
      product.imageUrl = imageUrl;
    }
    Product newProduct = Product(
        id: product.id,
        imageUrl: product.imageUrl,
        catId: product.catId,
        description: productDescriptionController.text.isEmpty
            ? product.description
            : productDescriptionController.text,
        name: productNameController.text.isEmpty
            ? product.name
            : productNameController.text,
        price: productPriceController.text.isEmpty
            ? product.price
            : productPriceController.text);

    bool? isUpdated =
        await FirestoreHelper.firestoreHelper.updateProduct(newProduct);

    if (isUpdated != null && isUpdated) {
      int index = allProducts!.indexOf(product);
      allProducts![index] = newProduct;
      imageFile = null;
      productDescriptionController.clear();
      productNameController.clear();
      productPriceController.clear();

      notifyListeners();
      AppRouter.appRouter.hideDialoug();
      AppRouter.appRouter.hideDialoug();
    }
  }

  goToEditProductPage(Product product) {
    productNameController.text = product.name;
    productDescriptionController.text = product.description;
    productPriceController.text = product.price;

    AppRouter.appRouter.goToWidget(EditProduct(product));
  }

  //slider methods
  getAllSliders() async {
    allSliders = await FirestoreHelper.firestoreHelper.getAllSliders();
  }

  AddNewSlider() async {
    if (imageFile != null) {
      AppRouter.appRouter.showLoadingDialoug();
      String imageUrl = await StrorageHelper.strorageHelper
          .uploadNewImage("Slider_images", imageFile!);
      Slider slider = Slider(
          imageUrl: imageUrl,
          title: sliderTitleController.text,
          url: sliderUrlController.text);

      String? id = await FirestoreHelper.firestoreHelper.addNewSlider(slider);

      AppRouter.appRouter.hideDialoug();
      if (id != null) {
        slider.id = id;
        allSliders?.add(slider);
        notifyListeners();
        sliderTitleController.clear();
        sliderUrlController.clear();

        imageFile = null;
        notifyListeners();
        AppRouter.appRouter
            .showCustomDialoug('Success', 'Your Slider has been added');
      }
    } else {
      AppRouter.appRouter
          .showCustomDialoug('Error', 'You have to pick image first');
    }
  }

  deleteSlider(Slider slider) async {
    AppRouter.appRouter.showLoadingDialoug();
    bool deleteSuccess =
        await FirestoreHelper.firestoreHelper.deleteSlider(slider.id!);
    if (deleteSuccess) {
      allSliders!.remove(slider);
      notifyListeners();
    }
    AppRouter.appRouter.hideDialoug();
  }

  updateSlider(Slider slider) async {
    AppRouter.appRouter.showLoadingDialoug();
    if (imageFile != null) {
      String imageUrl = await StrorageHelper.strorageHelper
          .uploadNewImage("products_images", imageFile!);
      slider.imageUrl = imageUrl;
    }

    Slider newSlider = Slider(
        id: slider.id,
        imageUrl: slider.imageUrl,
        title: sliderTitleController.text.isEmpty
            ? slider.title
            : sliderTitleController.text,
        url: sliderUrlController.text.isEmpty
            ? slider.url
            : sliderUrlController.text);

    bool? isUpdated =
        await FirestoreHelper.firestoreHelper.updateSlider(slider);

    if (isUpdated != null && isUpdated) {
      int index = allSliders!.indexOf(slider);
      allSliders![index] = newSlider;
      imageFile = null;
      sliderTitleController.clear();
      sliderUrlController.clear();

      notifyListeners();
      AppRouter.appRouter.hideDialoug();
      AppRouter.appRouter.hideDialoug();
    }
  }

  goToEditSliderPage(Slider slider) {
    sliderTitleController.text = slider.title;
    sliderUrlController.text = slider.url;

    AppRouter.appRouter.goToWidget(EditSlider(slider));
  }
}
