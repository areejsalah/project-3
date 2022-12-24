import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app router/app_router.dart';
import '../../providers/admin_provider.dart';
import 'add_new_slider.dart';
import '../components/slider_widget.dart';

class AllSliderScreen extends StatelessWidget {
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
          'All Sliders',
          style: TextStyle(color: Color(0xffC3211A)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                AppRouter.appRouter.goToWidget(AddNewSliderScreen());
              },
              icon: Icon(
                Icons.add,
                color: Color(0xffC3211A),
              ))
        ],
      ),
      body: Consumer<AdminProvider>(
        builder: (context, provider, u) {
          return provider.allSliders == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : provider.allSliders!.isEmpty
                  ? Center(
                      child: Text('No Sliders Found'),
                    )
                  : ListView.builder(
                      itemCount: provider.allSliders!.length,
                      itemBuilder: (context, index) {
                        return SliderWidget(provider.allSliders![index]);
                      });
        },
      ),
    );
  }
}
