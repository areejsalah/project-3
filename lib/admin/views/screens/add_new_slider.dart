import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../auth/components/custom_text_field.dart';
import '../../providers/admin_provider.dart';

class AddNewSliderScreen extends StatelessWidget {
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
          'Add New Slider',
          style: TextStyle(color: Color(0xffC3211A)),
        ),
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return SingleChildScrollView(
          child: Form(
            key: provider.addSliderKey,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    provider.pickImageForCategory();
                  },
                  child: Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey,
                      child: provider.imageFile == null
                          ? Center(
                              child: Icon(Icons.camera),
                            )
                          : Image.file(
                              provider.imageFile!,
                              fit: BoxFit.cover,
                            )),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextfield(
                        controller: provider.sliderTitleController,
                        label: 'Slider Title',
                        validation: provider.requiredValidation,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextfield(
                        controller: provider.sliderUrlController,
                        label: 'Slider Url',
                        validation: provider.requiredValidation,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xffC3211A),
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                )),
                            onPressed: () {
                              provider.AddNewSlider();
                            },
                            child: Text('Add New Slider')),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
