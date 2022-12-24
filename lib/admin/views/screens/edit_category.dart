import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../auth/components/custom_text_field.dart';
import '../../models/category_model.dart';
import '../../providers/admin_provider.dart';

class EditCategory extends StatelessWidget {
  Category category;
  EditCategory(this.category);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Color(0xffC3211A), // <-- SEE HERE
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Edit Category",
          style: TextStyle(color: Color(0xffC3211A)), // <-- SEE HERE
        ),
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: provider.categoryFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      provider.pickImageForCategory();
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      color: Colors.grey,
                      child: provider.imageFile == null
                          ? Image.network(
                              category.imageUrl,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              provider.imageFile!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextfield(
                    controller: provider.catNameArController,
                    label: 'Category Arabic name',
                    validation: provider.requiredValidation,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextfield(
                    controller: provider.catNameEnController,
                    label: 'Category English name',
                    validation: provider.requiredValidation,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xffC3211A),
                          textStyle: const TextStyle(
                            fontSize: 16,
                          )),
                      onPressed: () {
                        provider.updateCategory(category);
                      },
                      child: const Text('Update Category'),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
