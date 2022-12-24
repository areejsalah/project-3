import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/models/product_model.dart';
import 'package:flutter_application_1/app%20router/app_router.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/customer/views/screens/detailed_project_screen.dart';

class ProductItem extends StatelessWidget {
  Product product;
  ProductItem(this.product);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRouter.appRouter.goToWidget(DetailedProductScreen(product));
      },
      child: Container(
        margin: const EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
        width: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 5,
                color: Color.fromARGB(76, 0, 0, 0),
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.grey.shade300,
                  image: DecorationImage(
                      image: NetworkImage(product.imageUrl), fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    product.price,
                    //maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

    /* GestureDetector(
      onTap: () {
        AppRouter.appRouter.goToWidget(DetailedProductScreen(product));
      },
      child: Container(
          height: 110,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(5),
                width: 110,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    product.imageUrl,
                  ),
                  radius: 80,
                ),
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                height: 1.5),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            product.price,
                            style: TextStyle(
                                color: kPrimaryColor.withOpacity(0.8),
                                height: 1.5),
                          ),
                          const Text(' \$'),
                        ],
                      )
                    ]),
              ))
            ],
          )

          //Text(product.name),
          ),
    );*/
  }
}
