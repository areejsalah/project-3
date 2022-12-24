import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/models/product_model.dart';
import 'package:flutter_application_1/admin/providers/admin_provider.dart';
import 'package:provider/provider.dart';

import '../../../auth/components/custom_text_field.dart';

class EditProduct extends StatelessWidget {
  Product product;
  EditProduct(this.product);
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
          "Edit Product",
          style: TextStyle(color: Color(0xffC3211A)), // <-- SEE HERE
        ),
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: provider.addProductKey,
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
                              product.imageUrl,
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
                    controller: provider.productNameController,
                    label: 'Product name',
                    validation: provider.requiredValidation,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextfield(
                    controller: provider.productDescriptionController,
                    label: 'Product Description',
                    validation: provider.requiredValidation,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextfield(
                    controller: provider.productPriceController,
                    label: 'Product price',
                    validation: provider.requiredValidation,
                  ),
                  const SizedBox(
                    height: 20,
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
                        provider.updateProduct(product);
                      },
                      child: const Text(
                        'Update Product',
                      ),
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
