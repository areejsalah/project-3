import 'package:flutter/material.dart';
import 'package:flutter_application_1/customer/components/product_item.dart';
import 'package:provider/provider.dart';

import '../../../admin/models/category_model.dart';
import '../../../admin/providers/admin_provider.dart';
import '../../components/product_custom_widget.dart';

class AllProductsScreen extends StatelessWidget {
  Category category;
  AllProductsScreen(this.category);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black87),
          elevation: 0,
          titleSpacing: 0,
          title: Text(
            category.nameEn + ' Meals',
            style: const TextStyle(
                color: Colors.black87, fontWeight: FontWeight.bold),
          ),
        ),
        body: Consumer<AdminProvider>(builder: (context, provider, child) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: provider.allProducts?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ProductItem(provider.allProducts![index]);
                  }));
        }));

    /*Scaffold(
      appBar: AppBar(
        title: Text(category.nameEn + " Products"),
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return provider.allProducts == null
            ? Column(children: const [
                Expanded(
                    child: Center(
                  child: CircularProgressIndicator(),
                )),
              ])
            : ListView.builder(
                itemCount: provider.allProducts?.length ?? 0,
                itemBuilder: (context, index) {
                  return ProductItem(provider.allProducts![index]);
                });
      }),
    );*/
  }
}
