import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/views/screens/add_category.dart';
import 'package:provider/provider.dart';

import '../../../app router/app_router.dart';
import '../../providers/admin_provider.dart';
import '../components/category_widget.dart';

class AllCategoriesScreen extends StatelessWidget {
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
                AppRouter.appRouter.goToWidget(AddNewCategory());
              },
              icon: const Icon(
                Icons.add,
                color: Color(0xffC3211A),
              ))
        ],
        title: const Text(
          'All Categories',
          style: TextStyle(color: Color(0xffC3211A)),
        ),
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return provider.allCategories == null
            ? const Center(
                child: Text('No Categories Found'),
              )
            : ListView.builder(
                itemCount: provider.allCategories!.length,
                itemBuilder: (context, index) {
                  return CategoryWidget(provider.allCategories![index]);
                });
      }),
    );
  }
}
