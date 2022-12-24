import 'package:flutter/material.dart';

import '../../../app router/app_router.dart';
import 'display_all_sliders.dart';
import 'display_categories.dart';

class MainAdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 100, left: 10, right: 10),
          child: Column(
            children: [
              SizedBox(
                  height: 200,
                  child: InkWell(
                    onTap: () {
                      AppRouter.appRouter.goToWidget(AllCategoriesScreen());
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'Go To Categories',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.grey[400]),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 200,
                  child: InkWell(
                    onTap: () {
                      AppRouter.appRouter.goToWidget(AllSliderScreen());
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'Go To Sliders',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.grey),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
