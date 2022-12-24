import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide Slider;
import 'package:flutter_application_1/admin/providers/admin_provider.dart';
import 'package:provider/provider.dart';

class AdsBox extends StatelessWidget {
  AdsBox({Key? key, required this.revere}) : super(key: key);

  final bool revere;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Consumer<AdminProvider>(
        builder: (context, provider, child) {
          return CarouselSlider.builder(
              itemCount: provider.allSliders?.length ?? 0,
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                reverse: revere,
                enlargeCenterPage: true,
                autoPlayInterval: const Duration(seconds: 4),
              ),
              itemBuilder: (context, index, realindex) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                              provider.allSliders![index].imageUrl,
                            ),
                            fit: BoxFit.cover),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 5,
                            color: Color.fromARGB(117, 0, 0, 0),
                          )
                        ]),
                  ),
                );
              });
        },
      ),
    );
  }
}
