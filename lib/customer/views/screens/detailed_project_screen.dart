import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/models/product_model.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/customer/components/custom_app_bar.dart';
import 'package:flutter_application_1/customer/components/product_image.dart';

class DetailedProductScreen extends StatelessWidget {
  Product product;
  DetailedProductScreen(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          Icons.arrow_back_ios_new_outlined,
          Icons.add_shopping_cart_rounded,
          //Navigator.of(context).pop()
        ),
        bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                offset: Offset(-1, 1),
                blurRadius: 5,
                color: Color.fromARGB(117, 0, 0, 0),
              )
            ]),
            child: SizedBox(
                height: 50,
                width: 80,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffC3211A),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 5,
                            color: Color.fromARGB(117, 0, 0, 0),
                          )
                        ]),
                    alignment: Alignment.center,
                    child: const Text(
                      'Add To Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ))),
        body: Column(children: [
          Expanded(
              child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: NetworkImage(
                            product.imageUrl,
                          ),
                          fit: BoxFit.cover)),
                ),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                product.name,
                                maxLines: 5,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(children: [
                          Text(
                            product.price,
                            style: const TextStyle(
                              color: Color(0xffC3211A),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            ' \$',
                            style: TextStyle(
                              color: Color(0xffC3211A),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ]),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Description',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          product.description,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /*  backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
          child: Column(
        children: [
          CustomAppBar(
            Icons.arrow_back_ios_new_outlined,
            Icons.add_shopping_cart_rounded,
            //Navigator.of(context).pop()
          ),
          ProductImg(
            product.imageUrl,
          ),
          Container(
              padding: const EdgeInsets.all(25),
              color: kbackground,
              child: Column(children: [
                Text(
                  product.name,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.price,
                      style: const TextStyle(
                          fontSize: 22,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      '\$',
                      style: TextStyle(
                          fontSize: 22,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  product.description,
                  style: const TextStyle(fontSize: 16),
                ),
                ElevatedButton(
                    onPressed: () {}, child: const Text('Add To Cart')),
              ]))
        ],
      )),*/
                ])
              ]))
        ]));
  }
}
