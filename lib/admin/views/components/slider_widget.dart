import 'package:flutter/material.dart' hide Slider;
import 'package:provider/provider.dart';

import '../../models/slider_model.dart';
import '../../providers/admin_provider.dart';

class SliderWidget extends StatelessWidget {
  Slider slider;
  SliderWidget(this.slider);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          SizedBox(
              height: 150,
              width: double.infinity,
              child: Image.network(
                slider.imageUrl,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(slider.title),
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: IconButton(
                        onPressed: () {
                          Provider.of<AdminProvider>(context, listen: false)
                              .deleteSlider(slider);
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
                              .goToEditSliderPage(slider);
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
    );
  }
}
