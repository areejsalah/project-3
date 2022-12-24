import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../auth/components/custom_text_field.dart';
import '../../providers/admin_provider.dart';

class AddNewProduct extends StatelessWidget {
  String catId;
  AddNewProduct(this.catId);
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
          "Add New Product",
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
                      provider.pickImageForProduct();
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      color: Colors.grey,
                      child: provider.imageFile == null
                          ? const Center(
                              child: Icon(Icons.camera),
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
                    label: 'Product Price',
                    validation: provider.phoneValidation,
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
                        provider.addNewProduct(catId);
                      },
                      child: const Text('Add New Product'),
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
