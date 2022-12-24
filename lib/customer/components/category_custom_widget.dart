import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/models/category_model.dart';
import 'package:flutter_application_1/admin/providers/admin_provider.dart';
import 'package:flutter_application_1/app%20router/app_router.dart';
import 'package:provider/provider.dart';

import '../views/screens/all_products_screens.dart';

class CategoryCustomWidget extends StatelessWidget {
  Category category;
  CategoryCustomWidget(this.category);
  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProvider>(
      builder: (context, provider, child) {
        return GestureDetector(
          onTap: () {
            Provider.of<AdminProvider>(context, listen: false)
                .getAllProducts(category.id!);
            AppRouter.appRouter.goToWidget(AllProductsScreen(category));
          },
          child: Container(
            width: 100,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 15, top: 5, bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffC3211A),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 5,
                    color: Color.fromARGB(117, 0, 0, 0),
                  )
                ]),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 3, left: 3, right: 3, bottom: 7),
                    decoration: BoxDecoration(
                      // color: category.nameEn.isEmpty
                      //   ? Colors.white
                      //:
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(7),
                      image: DecorationImage(
                          image: NetworkImage(category.imageUrl),
                          fit: BoxFit.contain),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      category.nameEn,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    )),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        );
      },

      /* ConstrainedBox(
            constraints: const BoxConstraints.expand(width: 100, height: 120),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Column(children: [
                Image.network(
                  category.imageUrl,
                  width: 40, //52
                ),
                Text(category.nameEn)
              ]),
            ),
          ),*/
    );
  }
}
