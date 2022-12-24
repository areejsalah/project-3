import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/views/screens/add_product.dart';
import 'package:flutter_application_1/admin/views/components/product_widget.dart';
import 'package:provider/provider.dart';

import '../../../app router/app_router.dart';
import '../../providers/admin_provider.dart';
import 'add_category.dart';

class AllProductsScreen extends StatelessWidget {
  String catId;
  AllProductsScreen(this.catId);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Color(0xffC3211A), // <-- SEE HERE
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                AppRouter.appRouter.goToWidget(AddNewProduct(catId));
              },
              icon: const Icon(Icons.add, color: Color(0xffC3211A)))
        ],
        title: const Text('All Products',
            style: TextStyle(color: Color(0xffC3211A))),
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return provider.allProducts == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: provider.allProducts!.length,
                itemBuilder: (context, index) {
                  return ProductWidget(provider.allProducts![index]);
                });
      }),
    );
  }
}
