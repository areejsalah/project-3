import 'package:flutter/material.dart' hide Slider;
import 'package:flutter_application_1/admin/models/slider_model.dart';
import 'package:flutter_application_1/admin/providers/admin_provider.dart';
import 'package:flutter_application_1/auth/components/custom_text_field.dart';
import 'package:provider/provider.dart';

class EditSlider extends StatelessWidget {
  Slider slider;
  EditSlider(this.slider);
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
          "Edit Slider",
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
                              slider.imageUrl,
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
                    controller: provider.sliderTitleController,
                    label: 'Slider Title',
                    validation: provider.requiredValidation,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextfield(
                    controller: provider.sliderUrlController,
                    label: 'Slider Url',
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
                        provider.updateSlider(slider);
                      },
                      child: const Text(
                        'Update Slider',
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
