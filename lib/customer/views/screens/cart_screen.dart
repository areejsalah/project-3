


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/providers/admin_provider.dart';
import 'package:flutter_application_1/customer/components/product_item.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text( " Products in cart"),
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
    );
  }

}