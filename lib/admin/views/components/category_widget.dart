import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app router/app_router.dart';
import '../../models/category_model.dart';
import '../../providers/admin_provider.dart';
import '../screens/display_products.dart';

class CategoryWidget extends StatelessWidget {
  Category category;
  CategoryWidget(this.category);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        Provider.of<AdminProvider>(context, listen: false)
            .getAllProducts(category.id!);
        AppRouter.appRouter.goToWidget(AllProductsScreen(category.id!));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            SizedBox(
                height: 150,
                width: double.infinity,
                child: Image.network(
                  category.imageUrl,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category.nameEn),
                Text(category.nameAr),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: IconButton(
                          onPressed: () {
                            Provider.of<AdminProvider>(context, listen: false)
                                .deleteCategory(category);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Color(0xffC3211A),
                          )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: IconButton(
                          onPressed: () {
                            Provider.of<AdminProvider>(context, listen: false)
                                .goToEditCategoryPage(category);
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Color(0xffC3211A),
                          )),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
