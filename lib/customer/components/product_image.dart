import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/models/product_model.dart';
import 'package:flutter_application_1/constants/colors.dart';

class ProductImg extends StatelessWidget {
  String image;
  ProductImg(this.image);
  //Product product;
  // ProductImg(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Stack(children: [
        Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: kbackground),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.all(15),
            width: 250,
            height: 250,
            /*decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  offset: const Offset(-1, 10),
                  blurRadius: 10)
            ]),*/
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                image,
              ),
              radius: 100,
            ),
          ),
          /*child: Container(
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
            // child: Image.asset(product.imageUrl, fit: BoxFit.cover,),
          ),*/
        )
      ]),
    );
  }
}
