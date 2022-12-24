import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/models/product_model.dart';

class ProductCustomerWidget extends StatelessWidget {
  Product product;
  ProductCustomerWidget(this.product);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          SizedBox(
              height: 100,
              width: 100,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              )),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(product.name), Text(product.price)],
          )
        ],
      ),
    );
  }
}
